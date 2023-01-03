describe('product details spec', () => {

  it('visits the homepage', () => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it('should naviagate to the product detail page', () => {
    cy.get('[alt="Scented Blade"]').click()
  });

})
