CREATE MIGRATION m1wrgcvfywceb2jwn3huxaa6obqexmi4vrt4ivcwlyqphoodd3a6oq
    ONTO m1wpbwzqsimug4f5qzd6q3mqgqro3oedj3taz5timjbqzcv2ngmrnq
{
  ALTER TYPE default::Franchise {
      ALTER LINK entries {
          DROP CONSTRAINT std::exclusive;
      };
      ALTER LINK entries {
          USING (.<franchise);
      };
  };
};
