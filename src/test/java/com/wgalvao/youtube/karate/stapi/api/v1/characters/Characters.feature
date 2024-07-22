Feature: Listar dados dos personagens

  Background:
    Given url 'https://stapi.co/api/v1/rest/character'
    And def apiRequestHeaders = read('../../requestHeaders.json')
    And def apiResponseHeaders = read('../../responseHeaders.json')
    And def schemaPage = read('../../schemaPage.json')

  Scenario: Listar a primeira pagina com cinquenta personagens
    And def schemaV1Character = read('schemaV1Character.json')
    And def schemaV1CharacterPage = read('schemaV1CharacterSearch.json')
    And path '/search'
    When method get
    Then status 200
    And match karate.prevRequest.headers == apiRequestHeaders
    And match karate.response.headers contains apiResponseHeaders
    And match karate.response.body == schemaV1CharacterPage
    And match karate.response.body.page.firstPage == true
    And print karate.response.body

  Scenario Outline: Buscar personagem <name> pelo id <uid>
    And def schemaV1CharacterPerformes = read('schemaV1CharacterPerformes.json')
    And def schemaV1CharacterEpisodes = read('schemaV1CharacterEpisodes.json')
    And def schemaV1CharacterMovies = read('schemaV1CharacterMovies.json')
    And def schemaV1CharacterSpecies = read('schemaV1CharacterSpecies.json')
    And def schemaV1CharacterRelations = read('schemaV1CharacterRelations.json')
    And def schemaV1CharacterTitles = read('schemaV1CharacterTitles.json')
    And def schemaV1CharacterOccupations = read('schemaV1CharacterOccupations.json')
    And def schemaV1CharacterOrganizations = read('schemaV1CharacterOrganizations.json')
    And def schemaV1CharacterUid = read('schemaV1CharacterUid.json')
    And params { uid: <uid> }
    When method get
    Then status 200
    And match karate.prevRequest.headers == apiRequestHeaders
    And match karate.response.headers contains apiResponseHeaders
    And match karate.response.body == schemaV1CharacterUid
    And print karate.response.body
    Examples:
      | uid            | name                     |
      | CHMA0000147243 | James Tiberius Kirk      |
      | CHMA0000202697 | Spock                    |
      | CHMA0000017952 | Leonard H. McCoy         |
      | CHMA0000108904 | Montgomery Scott         |
      | CHMA0000111295 | Hikaru Kato Sulu         |
      | CHMA0000003172 | Pavel Andreyevich Chekov |
      | CHMA0000068639 | Nyota Uhura              |
