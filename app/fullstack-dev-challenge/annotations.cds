using DevChallengeService as service from '../../srv/service';

annotate service.Tests with @(UI.LineItem: [ 
    { 
        $Type: 'UI.DataField', 
        Label: 'Title', 
        Value: title, 
    }, 
     {
        $Type: 'UI.DataField',
        Label: 'Description',
        Value: description,
    },
    {
        $Type: 'UI.DataField',
        Label: 'CreatedBy',
        Value: createdBy,
    },
    {
        $Type: 'UI.DataField',
        Label: 'CreatedAt',
        Value: createdAt,
    },
]); 

annotate service.Questions with @(UI.LineItem: [
    {
        $Type : 'UI.DataField',
        Value : text,
        ![@UI.Importance]: #High,
    },
    {
        $Type : 'UI.DataField',
        Value : answer.text,
        ![@UI.Importance]: #High,
    },
]);

annotate service.Tests with @(
    UI.FieldGroup #TestDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Title',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CreatedBy',
                Value: createdBy,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CreatedAt',
                Value: createdAt,
            },
        ],
    });

annotate service.Tests with @(UI.Facets: [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'TestDetailsFacet',
        Label : 'Test Details',
        Target: '@UI.FieldGroup#TestDetails',
    },
    {
        $Type : 'UI.ReferenceFacet',
        Target: 'questions/@UI.LineItem',
        Label : 'Question Details',
        ID    : 'QuestionDetailsFacet',
    },
]);

annotate service.Tests with @(UI.HeaderInfo: {
    TypeName : 'Developer Challenge Three',
    TypeNamePlural : '',
    Title : {
        $Type : 'UI.DataField',
        Value : 'Developer Challenge Three',
    },
    Description : {
        $Type : 'UI.DataField',
        Value : 'Week Three - Front-end Development with SAP Fiori Elements'
    }
});

annotate service.Tests with @(UI.PresentationVariant: {
    SortOrder     : [{Property: title}],
    Visualizations: ['@UI.LineItem']
});