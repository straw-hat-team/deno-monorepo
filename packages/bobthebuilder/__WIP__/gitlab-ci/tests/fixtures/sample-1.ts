import {
  CI_COMMIT_MESSAGE,
  CI_COMMIT_REF_NAME,
  CI_COMMIT_SHA,
  CI_JOB_TOKEN,
  CI_PROJECT_DIR,
  CI_PROJECT_ID,
  CI_PROJECT_NAME,
  CI_PROJECT_NAMESPACE,
  Command,
  EnvironmentVariable,
  GITLAB_USER_LOGIN,
  GITLAB_USER_NAME,
  GitLabCI,
  Image,
  Job,
  JobNeed,
  Stage,
  Variable,
} from "../../mod.ts";
import { shell } from "../../../resource.ts";

export default () => {
  const GITLAB_SHORTCUT_RELEASER_GITLAB_TOKEN = new EnvironmentVariable({
    name: "GITLAB_SHORTCUT_RELEASER_GITLAB_TOKEN",
  });

  const GITLAB_SHORTCUT_RELEASER_SLACK_TOKEN = new EnvironmentVariable({
    name: "GITLAB_SHORTCUT_RELEASER_SLACK_TOKEN",
  });

  const GITLAB_SHORTCUT_RELEASER_SLACK_CHANNEL = new EnvironmentVariable({
    name: "GITLAB_SHORTCUT_RELEASER_SLACK_CHANNEL",
  });

  const GITLAB_SHORTCUT_RELEASER_SHORTCUT_TOKEN = new EnvironmentVariable({
    name: "GITLAB_SHORTCUT_RELEASER_SHORTCUT_TOKEN",
  });

  const lintingStage = new Stage({
    name: "linting",
  });
  const yarnInstallScript = [new Command("yarn ci:install")];

  const afterReleaseStage = new Stage({
    name: "after_release",
  });

  const releaseStage = new Stage({
    name: "release",
  });

  const vercelDeployProductionJob = new Job({
    stage: releaseStage,
    name: "vercel:deploy:production",
    image: new Image({
      name: "docker.myapp.io/core/base/vercel-ci:2.2.0",
    }),
    tags: ["kubernetes"],
    script: [
      new Command(shell`DEPLOYMENT_URL=$(vercel
          --prod
          -A ./devops/production.vercel.json
          --token $VERCEL_AUTH_TOKEN
          --scope $VERCEL_SCOPE
          -b NEXT_PUBLIC_VERCEL_GIT_PROVIDER="gitlab"
          -b NEXT_PUBLIC_VERCEL_GIT_COMMIT_REF="${CI_COMMIT_REF_NAME}"
          -b NEXT_PUBLIC_VERCEL_GIT_COMMIT_SHA="${CI_COMMIT_SHA}"
          -b NEXT_VERCEL_GIT_COMMIT_SHA="${CI_COMMIT_SHA}"
          -b NEXT_PUBLIC_VERCEL_GIT_COMMIT_AUTHOR_LOGIN="${GITLAB_USER_LOGIN}"
          -b NEXT_PUBLIC_VERCEL_GIT_COMMIT_AUTHOR_NAME="${GITLAB_USER_NAME}"
          -b NEXT_PUBLIC_VERCEL_GIT_COMMIT_MESSAGE="${CI_COMMIT_MESSAGE}"
          -b NEXT_PUBLIC_VERCEL_GIT_REPO_ID="${CI_PROJECT_ID}"
          -b NEXT_PUBLIC_VERCEL_GIT_REPO_SLUG="${CI_PROJECT_NAME}"
          -b NEXT_PUBLIC_VERCEL_GIT_REPO_OWNER="${CI_PROJECT_NAMESPACE}"
          )
        `),
      new Command("make release"),
    ],
  });

  return new GitLabCI({
    variables: [
      new Variable({
        name: "MYAPP_GITLAB_TOKEN",
        value: CI_JOB_TOKEN,
      }),
      new Variable({
        name: "CYPRESS_CACHE_FOLDER",
        value: shell`${CI_PROJECT_DIR}/cache/Cypress`,
      }),
    ],
    stages: [
      lintingStage,
      new Stage({
        name: "test",
      }),
      new Stage({
        name: "preview",
      }),
      releaseStage,
      afterReleaseStage,
      new Stage({
        name: "cleanup",
      }),
    ],
    jobs: [
      vercelDeployProductionJob,
      new Job({
        name: "linting:eslint",
        stage: lintingStage,
        tags: ["kubernetes"],
        image: new Image({
          name: "docker.myapp.io/core/base/node-ci:2.1.0",
        }),
        script: [
          yarnInstallScript,
          new Command("yarn ci:eslint || exit 0"),
        ],
      }),
      new Job({
        name: "linting:prettier",
        stage: lintingStage,
        image: new Image({
          name: "docker.myapp.io/core/base/node-ci:2.1.0",
        }),
        tags: ["kubernetes"],
        script: [
          yarnInstallScript,
          new Command("yarn ci:prettier"),
        ],
      }),
      new Job({
        needs: [
          new JobNeed({
            job: vercelDeployProductionJob,
          }),
        ],
        allowFailure: true,
        name: "shortcut:release",
        stage: afterReleaseStage,
        image: new Image({
          name: "docker.myapp.io/core/devops/gitlab-shortcut-releaser:2.1.0",
        }),
        script: [
          new Command(shell`gitlab-shortcut-releaser
              --gitLabToken=${GITLAB_SHORTCUT_RELEASER_GITLAB_TOKEN}
              --slackToken=${GITLAB_SHORTCUT_RELEASER_SLACK_TOKEN}
              --slackChannel=${GITLAB_SHORTCUT_RELEASER_SLACK_CHANNEL}
              --shortcutToken=${GITLAB_SHORTCUT_RELEASER_SHORTCUT_TOKEN}
              --shortcutWorkflowStateId="500010247"
              --shortcutLabel="webapp"
              --appName="Web App"
              --slackEmoji=":pogcrazy:"
            `),
        ],
      }),
    ],
  });
};
