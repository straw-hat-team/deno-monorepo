import { IJsonMarshaler, removeEmpty } from "../resource.ts";
import { Image } from "./images.ts";
import { Stage } from "./stages.ts";
import { Tags } from "./tags.ts";
import { Commands, Script } from "./script.ts";

class JobNeed implements IJsonMarshaler {
  #job: Job;

  constructor(opts: { job: Job }) {
    this.#job = opts.job;
  }

  toJSON() {
    return {
      job: this.#job.toJSON().at(0),
    };
  }
}

type NeedValue = JobNeed;

class Needs implements IJsonMarshaler {
  readonly #needs?: NeedValue[];

  constructor(needs?: NeedValue[]) {
    this.#needs = needs;
  }

  toJSON(): any {
    return this.#needs?.map((need) => need.toJSON());
  }
}

class Job implements IJsonMarshaler {
  readonly #name: string;
  readonly #stage: Stage;
  readonly #image: Image;
  readonly #tags: Tags;
  readonly #script: Script;
  readonly #allowFailure?: boolean;
  readonly #needs: Needs;

  constructor(
    opts: {
      needs?: NeedValue[];
      image: Image;
      stage: Stage;
      name: string;
      allowFailure?: boolean;
      script: Commands[];
      tags?: string[];
    },
  ) {
    this.#needs = new Needs(opts.needs);
    this.#allowFailure = opts.allowFailure;
    this.#name = opts.name;
    this.#stage = opts.stage;
    this.#image = opts.image;
    this.#tags = new Tags(opts.tags);
    this.#script = new Script(opts.script);
  }

  get name() {
    return this.#name;
  }

  toJSON() {
    return [
      this.#name,
      removeEmpty({
        allow_failure: this.#allowFailure,
        image: this.#image.toJSON(),
        tags: this.#tags.toJSON(),
        script: this.#script.toJSON(),
        stage: this.#stage.toJSON(),
        needs: this.#needs.toJSON(),
      }),
    ];
  }
}

class Jobs implements IJsonMarshaler {
  #value = new Map<string, Job>();

  constructor(jobs?: Job[]) {
    jobs?.forEach((stage) => this.#maybeSet(stage));
  }

  #maybeSet(value: Job) {
    if (this.#value.has(value.name)) {
      throw new Error(`Job "${value.name}" is already exists`);
    }
    this.#value.set(value.name, value);
  }

  toJSON() {
    if (this.#value.size === 0) {
      return undefined;
    }
    const entries = Array.from(this.#value.values()).map((stage) =>
      stage.toJSON()
    );
    return Object.fromEntries(entries);
  }
}

export { Job, JobNeed, Jobs };
