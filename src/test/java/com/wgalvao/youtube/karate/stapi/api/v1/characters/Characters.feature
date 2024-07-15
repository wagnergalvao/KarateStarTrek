Feature: Listar dados dos personagens

  Background:
    Given url 'https://stapi.co/api/v1/rest/character'
    And def schemaPage = read('../../schemaPage.json')
    And def schemaV1Characters = read('../../schemaV1Characters.json')
    And def schemaV1Character = read('../../schemaV1Character.json')
    And def apiRequestHeaders = read('../../requestHeaders.json')
    And def apiResponseHeaders = read('../../responseHeaders.json')

  Scenario: Listar a primeira pagina com cinquenta personagens
    And path '/search'
    When method get
    Then status 200
    And match karate.prevRequest.headers == apiRequestHeaders
    And match karate.response.headers contains apiResponseHeaders
    And match karate.response.body == schemaV1Characters
    And match karate.response.body.page.firstPage == true
    And print karate.response.body