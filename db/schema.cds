using { Currency, managed, cuid, sap } from '@sap/cds/common';
namespace sap.capire.course;

@fiori.draft.enabled
entity Tests : cuid, managed {
    title: String;
    description: String;
    questions: Association to many Questions;
}

@fiori.draft.enabled
entity Questions: cuid {
    text: String;
    test: Association to Tests;
    answer: Composition of Answers;
}

@readonly
aspect Answers: cuid {
    text: String;
}