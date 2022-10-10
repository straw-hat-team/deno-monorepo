import type { NodeId } from "../../../project/mod.ts";
import type { WithDirectoryOption } from "../../file.ts";
import { File, getWithDirectoryFilePath } from "../../file.ts";
import { Project } from "../../../project/mod.ts";
import {
  excludeEmptyArray,
  excludeEmptyObject,
  removeUndefinedValues,
} from "../../../helpers.ts";

type TerminalOptions = {
  fileColumnWidth?: number;
  printFiles?: boolean;
};

type CoverageOptions = {
  treatNoRelevantLinesAsCovered?: boolean;
  outputDir?: string;
  templatePath?: string;
  minimumCoverage?: number;
  xmlBaseDir?: string;
};

export type Config = {
  default_stop_words?: string[];
  custom_stop_words?: string[];
  skip_files?: string[];
  coverage_options?: CoverageOptions;
  terminal_options?: TerminalOptions;
};

export type CoverallsJsonFileOptions = WithDirectoryOption<{
  config: Config;
}>;

const FILE_NAME = "coveralls.json";

export class CoverallsJsonFile extends File {
  readonly #config: Config = {};

  readonly #skipFiles = new Set<string>();
  readonly #defaultStopWords = new Set<string>();
  readonly #customStopWords = new Set<string>();
  #terminalOptions: TerminalOptions = {};
  #coverageOptions: CoverageOptions = {};

  constructor(project: Project, id: NodeId, opts?: CoverallsJsonFileOptions) {
    super(project, id, {
      path: getWithDirectoryFilePath(FILE_NAME, opts),
      readonly: true,
    });

    this.#config = {};
  }

  setTerminalOptions(opts: TerminalOptions) {
    this.#terminalOptions = Object.assign(this.#terminalOptions, opts);
    return this;
  }

  setCoverageOptions(opts: CoverageOptions) {
    this.#coverageOptions = Object.assign(this.#coverageOptions, opts);
    return this;
  }

  addSkipFile(file: string) {
    this.#skipFiles.add(file);
    return this;
  }

  addDefaultStopWord(word: string) {
    this.#defaultStopWords.add(word);
    return this;
  }

  addCustomStopWord(word: string) {
    this.#customStopWords.add(word);
    return this;
  }

  override getFileContent() {
    return JSON.stringify(
      removeUndefinedValues({
        default_stop_words: excludeEmptyArray(
          Array.from(this.#defaultStopWords),
        ),
        custom_stop_words: excludeEmptyArray(Array.from(this.#customStopWords)),
        skip_files: excludeEmptyArray(Array.from(this.#skipFiles)),
        coverage_options: excludeEmptyObject(removeUndefinedValues({
          treat_no_relevant_lines_as_covered:
            this.#coverageOptions.treatNoRelevantLinesAsCovered,
          output_dir: this.#coverageOptions.outputDir,
          template_path: this.#coverageOptions.templatePath,
          minimum_coverage: this.#coverageOptions.minimumCoverage,
          xml_base_dir: this.#coverageOptions.xmlBaseDir,
        })),
        terminal_options: excludeEmptyObject(removeUndefinedValues({
          file_column_width: this.#terminalOptions.fileColumnWidth,
          print_files: this.#terminalOptions.printFiles,
        })),
      }),
      null,
      2,
    );
  }
}
