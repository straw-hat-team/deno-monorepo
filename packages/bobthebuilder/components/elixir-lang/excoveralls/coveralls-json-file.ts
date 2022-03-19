import type { NodeId } from "../../../project/mod.ts";
import type { WithDirectoryOption } from "../../file.ts";
import { File, getWithDirectoryFilePath } from "../../file.ts";
import { Project } from "../../../project/mod.ts";

export type Config = {
  default_stop_words?: string[];
  custom_stop_words?: string[];
  coverage_options?: {
    treat_no_relevant_lines_as_covered?: boolean;
    output_dir?: string;
    template_path?: string;
    minimum_coverage?: number;
    xml_base_dir?: string;
  };
  skip_files?: string[];
  terminal_options?: {
    file_column_width?: number;
    print_files?: boolean;
  };
};

export type CoverallsJsonFileOptions = WithDirectoryOption<{
  config: Config;
}>;

const FILE_NAME = "coveralls.json";

export class CoverallsJsonFile extends File {
  readonly #config: Config;

  constructor(project: Project, id: NodeId, opts?: CoverallsJsonFileOptions) {
    super(project, id, {
      path: getWithDirectoryFilePath(FILE_NAME, opts),
      readonly: true,
    });

    this.#config = opts?.config ?? {};
  }

  override getFileContent() {
    return JSON.stringify(this.#config, null, 2) + "\n";
  }
}
