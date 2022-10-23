CREATE MIGRATION m1h7j4bu5bhay4eqiehxtitlarr2dmuaayiweie3hsxfiajcers4hq
    ONTO m17cfxwywkdu6aula4a4ui46ieje7irwxr27b7kuyqacmjjefaycxq
{
  ALTER TYPE default::Movie {
      CREATE REQUIRED PROPERTY gross_profit -> std::float32 {
          SET REQUIRED USING (100000);
          CREATE CONSTRAINT std::min_value(0);
      };
  };
  CREATE SCALAR TYPE default::Gender EXTENDING enum<Male, Female, Non_Binary>;
  ALTER TYPE default::Person {
      CREATE REQUIRED PROPERTY gender -> default::Gender {
          SET REQUIRED USING (default::Gender.Male);
      };
  };
};
