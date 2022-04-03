import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps'
import AppPage from '../AppPage'

And('I open application', () => {
    AppPage.visit()
})

And('I should see main page', () => {
    cy.get('#root').should('be.visible')
})