import { Component, NodeId, Project } from "../../project/mod.ts";

export class Stub extends Component {
  #preRunCalled = false;
  #runCalled = false;
  #postRunCalled = false;

  constructor(project: Project, id: NodeId) {
    super(project, id);
  }

  override postRun() {
    this.#postRunCalled = true;
  }

  override preRun() {
    this.#preRunCalled = true;
  }

  override run() {
    this.#runCalled = true;
  }

  getPreRunCalled() {
    return this.#preRunCalled;
  }

  getRunCalled() {
    return this.#runCalled;
  }

  getPostRunCalled() {
    return this.#postRunCalled;
  }
}
