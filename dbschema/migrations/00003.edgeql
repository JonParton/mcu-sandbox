CREATE MIGRATION m1mgpmkujvyy6k7sdun4b63p2lkxtxg7rrgfffncqlaiycxjxuodvq
    ONTO m1h7j4bu5bhay4eqiehxtitlarr2dmuaayiweie3hsxfiajcers4hq
{
  ALTER TYPE default::Franchise {
      ALTER LINK entries {
          CREATE CONSTRAINT std::exclusive;
      };
  };
};
