/// <reference types="cypress" />

import { loginPage } from "../models/login";

describe('Cypress', () => {

  it('Round 1: Element Interaction', () => {

    cy.visit('https://demo.applitools.com/')

    cy.get('#username').type('filip')
    cy.get('#password').type('i<3slovakia!')
    cy.get('#log-in').click()

    cy.contains('.element-header', 'Financial Overview')
      
  });

  it('Round 2: Inline Frames', () => {

    cy.visit('https://kitchen.applitools.com/ingredients/iframe')

    cy.iframe('#the-kitchen-table')
      .find('#fruits-vegetables')
      .should('be.visible')
      
  });

  it('Round 3: Waiting', () => {

    cy.visit('https://automationbookstore.dev/')

    cy.get('#searchBar').type('testing')
    cy.get('li:visible').should('have.length', 1)
      
  });

  it('Round 4: Accept Alerts', () => {

    cy.visit('https://kitchen.applitools.com/ingredients/alert')

    cy.get('#alert-button').click()
    cy.on('window:alert', (alert) => {
      expect(alert).to.eq('Airfryers can make anything!')
    })
      
  });

  it('Round 5: Dismiss Alerts', () => {

    const dismiss = () => false
    
    cy.visit('https://kitchen.applitools.com/ingredients/alert')

    cy.get('#confirm-button').click()
    cy.on('window:confirm', dismiss)
      
  });

  it('Round 6: Answer Prompts', () => {

    cy.visit('https://kitchen.applitools.com/ingredients/alert', {
      onLoad(win: Window) {
        cy.stub(win, 'prompt')
          .returns('Hi mom!');
      }
    })

    cy.get('#prompt-button').click()
      
  });

  it('Round 7: Navigation to New Windows', () => {

    cy.visit('https://kitchen.applitools.com/ingredients/links')
    
    cy.get('#button-the-kitchen-table')
      .invoke('removeAttr', 'target')
      .click()

    cy.location('pathname')
      .should('eq', '/ingredients/table')

    cy.get('#fruits-vegetables:visible').should('have.length', 1)
      
  });

  it('Round 8: API Requests', () => {

    cy.request('https://kitchen.applitools.com/api/recipes')
      .then(({ status, body, duration }) => {
        expect(status).to.eq(200)
        expect(body.data).to.have.length.greaterThan(0)
        expect(duration).to.be.greaterThan(0)
      })
      
  });

});