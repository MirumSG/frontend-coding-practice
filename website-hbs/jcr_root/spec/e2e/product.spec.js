describe('angularjs homepage todo list', function() {
  it('should add a todo', function() {
    browser.ignoreSynchronization = true;

    browser.get('https://www.google.com');

    element(by.id('lst-ib')).sendKeys('Jane');
    element(by.id('sblsbb')).click();

    expect(1).toEqual(2);
  });
});
