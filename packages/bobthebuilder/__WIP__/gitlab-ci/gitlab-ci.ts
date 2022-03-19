import { IJsonMarshaler } from "../resource.ts";
import { Stage, Stages } from "./stages.ts";
import { Command, Script } from "./script.ts";
import { Image } from "./images.ts";
import { Job, Jobs } from "./jobs.ts";
import { Variable, Variables } from "./variables.ts";

export class GitLabCI implements IJsonMarshaler {
  readonly #image?: Image;
  readonly #beforeScript: Script;
  readonly #afterScript: Script;
  readonly #variables: Variables;
  readonly #jobs: Jobs;
  readonly #stages: Stages;

  constructor(opts: {
    stages?: Stage[];
    jobs: Job[];
    variables?: Variable[];
    beforeScript?: Command[];
    afterScript?: Command[];
    image?: Image;
  }) {
    this.#variables = new Variables(opts.variables);
    this.#stages = new Stages(opts.stages);
    this.#jobs = new Jobs(opts.jobs);

    this.#image = opts.image;
    this.#beforeScript = new Script(opts.beforeScript);
    this.#afterScript = new Script(opts.afterScript);
  }

  toJSON() {
    const jobs = this.#jobs.toJSON();
    return {
      variables: this.#variables.toJSON(),
      stages: this.#stages.toJSON(),
      ...jobs,
      // image: this.#image?.toJSON(),
      // before_script: this.#beforeScript.toJSON(),
      // after_script: this.#afterScript.toJSON(),
    };
  }
}
