CREATE MIGRATION m1cmllucfo7wae5fgwumqyfilttektpk2cw7ain2lyoxtmrsqxne2q
    ONTO initial
{
  CREATE EXTENSION graphql VERSION '1.0';
  CREATE ABSTRACT TYPE default::Content {
      CREATE REQUIRED PROPERTY title -> std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  CREATE TYPE default::Movie EXTENDING default::Content {
      CREATE REQUIRED PROPERTY gross_profit -> std::float32 {
          CREATE CONSTRAINT std::min_value(0);
      };
      CREATE PROPERTY release_year -> std::int64;
  };
  CREATE TYPE default::TVShow EXTENDING default::Content {
      CREATE PROPERTY num_seasons -> std::int64;
  };
  CREATE SCALAR TYPE default::Gender EXTENDING enum<Male, Female, Non_Binary>;
  CREATE TYPE default::Person {
      CREATE REQUIRED PROPERTY gender -> default::Gender;
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  ALTER TYPE default::Content {
      CREATE MULTI LINK actors -> default::Person {
          CREATE PROPERTY character_name -> std::str;
      };
  };
  ALTER TYPE default::Person {
      CREATE MULTI LINK acted_in := (.<actors[IS default::Content]);
  };
  CREATE TYPE default::Franchise {
      CREATE REQUIRED PROPERTY name -> std::str;
  };
  ALTER TYPE default::Content {
      CREATE REQUIRED LINK franchise -> default::Franchise;
  };
  ALTER TYPE default::Franchise {
      CREATE MULTI LINK entries := (.<franchise);
  };
  ALTER TYPE default::Movie {
      CREATE LINK director -> default::Person;
  };
  ALTER TYPE default::Person {
      CREATE MULTI LINK directed := (.<director[IS default::Movie]);
  };
};
