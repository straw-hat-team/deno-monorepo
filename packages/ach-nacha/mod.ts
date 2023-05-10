#!/usr/bin/env -S deno run --allow-read

// https://tableconvert.com/html-to-yaml

enum FieldInclusionRequirement {
  Mandatory = "M",
  Optional = "O",
  Required = "R",
  NA = "N/A",
  InsertedByOperator = "Inserted by ACH Operator"
}

type Order = number;
type ElementName = string;

type ContentType =
  "1"
  | "5"
  | "9"
  | "094"
  | "10"
  | "Alphameric"
  | "Numeric"
  | "bTTTTAAAAC"
  | "YYMMDD"
  | "HHMM"
  | "UPPER CASE A-Z NUMERIC 0-9"
  | "Dollar Amount"
  | "Blank"
  | "TTTTAAAA"

type Length = number;

class Position {
  start: number;
  end: number;

  constructor({ start, end }: { start: number, end: number }) {
    this.start = start;
    this.end = end;
  }
}

type FieldArgs = {
  order: Order
  name: ElementName,
  inclusionRequirement: FieldInclusionRequirement,
  contentType: ContentType,
  length: Length,
  position: Position
}

class Field {
  order: number;
  elementName: ElementName;
  fieldInclusionRequirement: FieldInclusionRequirement
  contentType: ContentType
  length: Length
  position: Position

  constructor({
                order,
                name,
                inclusionRequirement,
                contentType,
                length,
                position,
              }: FieldArgs) {
    this.order = order;
    this.elementName = name;
    this.fieldInclusionRequirement = inclusionRequirement;
    this.contentType = contentType;
    this.length = length;
    this.position = position;
  }
}

class Record {
  name: string;
  fields = new Set<Field>();

  constructor({ name }: { name: string }) {
    this.name = name;
  }

  addField(field: Field) {
    this.fields.add(field);
    return this;
  }
}

const FileHeader = new Record({ name: "FILE HEADER" })
  .addField(new Field({
    order: 1,
    name: "RECORD TYPE CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "1",
    length: 1,
    position: new Position({ start: 1, end: 1 }),
  }))
  .addField(new Field({
    order: 2,
    name: "PRIORITY CODE",
    inclusionRequirement: FieldInclusionRequirement.Required,
    contentType: "Numeric",
    length: 2,
    position: new Position({ start: 2, end: 3 }),
  }))
  .addField(new Field({
    order: 3,
    name: "IMMEDIATE DESTINATION",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "bTTTTAAAAC",
    length: 10,
    position: new Position({ start: 4, end: 13 }),
  }))
  .addField(new Field({
    order: 4,
    name: "IMMEDIATE ORIGIN",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "bTTTTAAAAC",
    length: 10,
    position: new Position({ start: 14, end: 23 }),
  }))
  .addField(new Field({
    order: 5,
    name: "FILE CREATION DATE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "YYMMDD",
    length: 6,
    position: new Position({ start: 24, end: 29 }),
  }))
  .addField(new Field({
    order: 6,
    name: "FILE CREATION TIME",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "HHMM",
    length: 4,
    position: new Position({ start: 30, end: 33 }),
  }))
  .addField(new Field({
    order: 7,
    name: "FILE ID MODIFIER",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "UPPER CASE A-Z NUMERIC 0-9",
    length: 1,
    position: new Position({ start: 34, end: 34 }),
  }))
  .addField(new Field({
    order: 8,
    name: "RECORD SIZE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "094",
    length: 3,
    position: new Position({ start: 35, end: 37 }),
  }))
  .addField(new Field({
    order: 9,
    name: "BLOCKING FACTOR",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "10",
    length: 2,
    position: new Position({ start: 38, end: 39 }),
  }))
  .addField(new Field({
    order: 10,
    name: "FORMAT CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "1",
    length: 1,
    position: new Position({ start: 40, end: 40 }),
  }))
  .addField(new Field({
    order: 11,
    name: "IMMEDIATE DESTINATION NAME",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "Alphameric",
    length: 23,
    position: new Position({ start: 41, end: 63 }),
  }))
  .addField(new Field({
    order: 12,
    name: "IMMEDIATE ORIGIN NAME",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "Alphameric",
    length: 23,
    position: new Position({ start: 64, end: 86 }),
  }))
  .addField(new Field({
    order: 13,
    name: "REFERENCE CODE",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "Alphameric",
    length: 8,
    position: new Position({ start: 87, end: 94 }),
  }));

const FileControl = new Record({ name: "FILE CONTROL" })
  .addField(new Field({
    order: 1,
    name: "RECORD TYPE CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "9",
    length: 1,
    position: new Position({ start: 1, end: 1 })
  }))
  .addField(new Field({
    order: 2,
    name: "BATCH COUNT",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 6,
    position: new Position({ start: 2, end: 7 })
  }))
  .addField(new Field({
    order: 3,
    name: "BLOCK COUNT",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 6,
    position: new Position({ start: 8, end: 13 })
  }))
  .addField(new Field({
    order: 4,
    name: "ENTRY/ADDENDA COUNT",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 8,
    position: new Position({ start: 14, end: 21 })
  }))
  .addField(new Field({
    order: 5,
    name: "ENTRY HASH",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 10,
    position: new Position({ start: 22, end: 31 })
  }))
  .addField(new Field({
    order: 6,
    name: "TOTAL DEBIT ENTRY DOLLAR AMOUNT IN FILE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Dollar Amount",
    length: 12,
    position: new Position({ start: 32, end: 43 })
  }))
  .addField(new Field({
    order: 7,
    name: "TOTAL CREDIT ENTRY DOLLAR AMOUNT IN FILE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Dollar Amount",
    length: 12,
    position: new Position({ start: 44, end: 55 })
  }))
  .addField(new Field({
    order: 8,
    name: "RESERVED",
    inclusionRequirement: FieldInclusionRequirement.NA,
    contentType: "Blank",
    length: 39,
    position: new Position({ start: 56, end: 94 })
  }))

const BatchHeader = new Record({ name: "BATCH HEADER" })
  .addField(new Field({
    order: 1,
    name: "RECORD TYPE CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "5",
    length: 1,
    position: new Position({ start: 1, end: 1 })
  }))
  .addField(new Field({
    order: 2,
    name: "SERVICE CLASS CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 3,
    position: new Position({ start: 2, end: 4 })
  }))
  .addField(new Field({
    order: 3,
    name: "COMPANY NAME",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Alphameric",
    length: 16,
    position: new Position({ start: 5, end: 20 })
  }))
  .addField(new Field({
    order: 4,
    name: "COMPANY DISCRETIONARY DATA",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "Alphameric",
    length: 20,
    position: new Position({ start: 21, end: 40 })
  }))
  .addField(new Field({
    order: 5,
    name: "COMPANY IDENTIFICATION",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Alphameric",
    length: 10,
    position: new Position({ start: 41, end: 50 })
  }))
  .addField(new Field({
    order: 6,
    name: "STANDARD ENTRY CLASS CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Alphameric",
    length: 3,
    position: new Position({ start: 51, end: 53 })
  }))
  .addField(new Field({
    order: 7,
    name: "COMPANY ENTRY DESCRIPTION",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Alphameric",
    length: 10,
    position: new Position({ start: 54, end: 63 })
  }))
  .addField(new Field({
    order: 8,
    name: "COMPANY DESCRIPTIVE DATE",
    inclusionRequirement: FieldInclusionRequirement.Optional,
    contentType: "Alphameric",
    length: 6,
    position: new Position({ start: 64, end: 69 })
  }))
  .addField(new Field({
    order: 9,
    name: "EFFECTIVE ENTRY DATE",
    inclusionRequirement: FieldInclusionRequirement.Required,
    contentType: "YYMMDD",
    length: 6,
    position: new Position({ start: 70, end: 75 })
  }))
  .addField(new Field({
    order: 10,
    name: "SETTLEMENT DATE",
    inclusionRequirement: FieldInclusionRequirement.InsertedByOperator,
    contentType: "Numeric",
    length: 3,
    position: new Position({ start: 76, end: 78 })
  }))
  .addField(new Field({
    order: 11,
    name: "ORIGINATOR STATUS CODE",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Alphameric",
    length: 1,
    position: new Position({ start: 79, end: 79 })
  }))
  .addField(new Field({
    order: 12,
    name: "ORIGINATING DFI IDENTIFICATION",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "TTTTAAAA",
    length: 8,
    position: new Position({ start: 80, end: 87 })
  }))
  .addField(new Field({
    order: 13,
    name: "BATCH NUMBER",
    inclusionRequirement: FieldInclusionRequirement.Mandatory,
    contentType: "Numeric",
    length: 7,
    position: new Position({ start: 88, end: 94 })
  }))
