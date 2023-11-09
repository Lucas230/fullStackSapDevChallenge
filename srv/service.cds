using { sap.capire.course as my } from '../db/schema';

service DevChallengeService @(path: 'dev-challenge') {
    @odata.draft.enabled: true
    entity Tests as projection on my.Tests actions {
        action assignQuestionsToTest(questionsCount : Integer) returns String;
    };
    @readonlys
    entity Questions as projection on my.Questions;
}