CREATE MIGRATION m1wpbwzqsimug4f5qzd6q3mqgqro3oedj3taz5timjbqzcv2ngmrnq
    ONTO m1mgpmkujvyy6k7sdun4b63p2lkxtxg7rrgfffncqlaiycxjxuodvq
{
  ALTER TYPE default::Content {
      CREATE REQUIRED LINK franchise -> default::Franchise {
          SET REQUIRED USING (SELECT
              default::Franchise
          FILTER
              (.id = <std::uuid>'687b8604-518d-11ed-842d-c784c08ee540')
          );
      };
  };
};
