const cds = require("@sap/cds");
// const cov2ap = require("@sap/cds-odata-v2-adapter-proxy");
// cds.on("bootstrap", (app) => app.use(cov2ap()));
// module.exports = cds.server;

module.exports = class DevChallengeService extends cds.ApplicationService { 
    init(){
        return super.init();
    }
    
    async assignQuestionsToTest(TestsIn, keys, questionsCount, req) {
        const { Tests, Questions } = this.entities();

        if(!questionsCount || questionsCount < 1)
            throw new cds.error(`No questions provided`)
        
        const Items = await cds.run(
            SELECT.from(Questions).where({test_ID: null}).limit(questionsCount))
        
        if(!Items || Items.length === 0) return `No questions avaiable to assign to a test`
            
        for await (const item of Items){
            item.test_ID = keys.ID
            await cds.run(UPDATE.entity(Questions).data(item).where({ID: item.ID}))
        }
        await cds.run(UPDATE.entity(Tests).set({modifiedAt: new Date()}).where({ID: keys.ID}))

        if (questionsCount > Items.length){
            return `Only ${Items.length} questions available, but you requested ${questionsCount}`
        }else {
            return `${questionsCount} questions successfully added to the test!`
        }

    }
}
