import { EnvironmentVariable } from "./variables.ts";

const CI_JOB_TOKEN = new EnvironmentVariable({
  name: "CI_JOB_TOKEN",
});

const CI_PROJECT_DIR = new EnvironmentVariable({
  name: "CI_PROJECT_DIR",
});

const CI_COMMIT_REF_NAME = new EnvironmentVariable({
  name: "CI_COMMIT_REF_NAME",
});

const CI_COMMIT_SHA = new EnvironmentVariable({
  name: "CI_COMMIT_SHA",
});
const GITLAB_USER_LOGIN = new EnvironmentVariable({
  name: "GITLAB_USER_LOGIN",
});
const GITLAB_USER_NAME = new EnvironmentVariable({
  name: "GITLAB_USER_NAME",
});
const CI_COMMIT_MESSAGE = new EnvironmentVariable({
  name: "CI_COMMIT_MESSAGE",
});
const CI_PROJECT_ID = new EnvironmentVariable({
  name: "CI_PROJECT_ID",
});
const CI_PROJECT_NAME = new EnvironmentVariable({
  name: "CI_PROJECT_NAME",
});
const CI_PROJECT_NAMESPACE = new EnvironmentVariable({
  name: "CI_PROJECT_NAMESPACE",
});

export {
  CI_COMMIT_MESSAGE,
  CI_COMMIT_REF_NAME,
  CI_COMMIT_SHA,
  CI_JOB_TOKEN,
  CI_PROJECT_DIR,
  CI_PROJECT_ID,
  CI_PROJECT_NAME,
  CI_PROJECT_NAMESPACE,
  GITLAB_USER_LOGIN,
  GITLAB_USER_NAME,
};
