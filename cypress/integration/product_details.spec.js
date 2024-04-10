it("Navigates to the products page by clicking", () => {
  cy.visit("/");
  cy.get(".products article:first").click();
});