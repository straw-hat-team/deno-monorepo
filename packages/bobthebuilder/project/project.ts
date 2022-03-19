import { OutputDir } from "./output-dir.ts";
import { NodeId } from "./types.ts";

export type ProjectOptions = {
  /**
   * The output directory for the project.
   */
  readonly outputDir: OutputDir;
};

export abstract class Component {
  readonly #project: Project;
  readonly #id: NodeId;

  preRun(): Promise<void> | void {}

  run(): Promise<void> | void {}

  postRun(): Promise<void> | void {}

  protected constructor(project: Project, id: NodeId) {
    this.#project = project;
    this.#id = id;
    project.addComponent(this);
  }

  getId() {
    return this.#id;
  }

  getProject() {
    return this.#project;
  }
}

export class Project {
  readonly #id: string;
  readonly #outputDir: OutputDir;
  readonly components = new Set<Component>();

  constructor(id: string, opts: ProjectOptions) {
    this.#id = id;
    this.#outputDir = opts.outputDir;
  }

  getOutputDir() {
    return this.#outputDir;
  }

  preRun() {
    return Promise.resolve();
  }

  addComponent(component: Component) {
    this.components.add(component);
    return this;
  }

  async run() {
    await this.preRun();

    for (const component of this.components) {
      await component.preRun();
    }

    for (const component of this.components) {
      await component.run();
    }

    for (const component of this.components) {
      await component.postRun();
    }

    await this.postRun();
  }

  postRun() {
    return Promise.resolve();
  }
}
