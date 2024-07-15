package com.wgalvao.youtube.karate.stapi.api.v1.characters;

import com.intuit.karate.junit5.Karate;

class CharactersRunner {
    
    @Karate.Test
    Karate TestCharacters() {
        return Karate.run("characters").relativeTo(getClass());
    }    

}
