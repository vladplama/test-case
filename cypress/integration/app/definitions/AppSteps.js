import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps'
import AppPage from '../AppPage'

And('I open the Dog Shop application', () => {
    AppPage.visit()
})

And('I should see main page', () => {
    cy.get('#root').should('be.visible')
})

//Adding a new unique Dog into the Shop

And('Dog was not previously added into the Shop', () => {
    AppPage.visit()
    cy.get(':nth-child(7) > :nth-child(1)').should('not.exist')
})

And('I add a new Dog', () => {
    cy.get('[name="breed"]').type('Corgi')
    cy.get('[name="nick"]').type('Dog')
    cy.get('[name="price"]').type('123')
    cy.get('[name="url"]').type('https://www.dogtime.com/assets/uploads/2019/08/corgi-inu-mixed-dog-breed-pictures-1-650x433.jpg')
    cy.get('form > button').click()
})

And('Dog is successfully added', () => {
    cy.get(':nth-child(7) > :nth-child(1)').should('be.visible')
})