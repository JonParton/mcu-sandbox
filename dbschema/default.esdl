using extension graphql;

module default {

  type Franchise {
    required property name -> str;
    multi link entries := .<franchise
  }

  abstract type Content {
    required property title -> str { constraint exclusive; };
    multi link actors -> Person {
      property character_name -> str;
    };
    required link franchise -> Franchise
  }

  type Movie extending Content {
    link director -> Person;
    property release_year -> int64;
    required property gross_profit -> float32 {
      constraint min_value(0);
    };
  }

  type TVShow extending Content {
    property num_seasons -> int64;
  }

  scalar type Gender extending enum<Male, Female, Non_Binary>;

  type Person {
    required property name -> str;
    required property gender -> Gender;
    multi link acted_in := .<actors[is Content];
    multi link directed := .<director[is Movie];
  }

}

