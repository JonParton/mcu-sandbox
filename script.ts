import { createClient } from "edgedb";
import { getTotalGrossProfitPerFranchise } from "./dbschema/queries";
import e from "./dbschema/edgeql-js";

const client = createClient();

async function run() {
  // const groupQuery = e.group(e.Movie, (movie) => {
  //   return {
  //     // title: true,
  //     by: { release_year: movie.release_year },
  //   };
  // });

  // // This query gives a type instantiation too deep error!
  // const summaryStats = e.select(groupQuery, (moviesByReleaseYear) => {
  //   return {
  //     key: {
  //       release_year: true,
  //     },
  //     movieCounts: e.count(moviesByReleaseYear.elements),
  //     numberOfActors: e.count(moviesByReleaseYear.elements.actors),
  //     actors: e.select(moviesByReleaseYear.elements.actors, {
  //       name: true,
  //     }),
  //   };
  // });

  const result = await getTotalGrossProfitPerFranchise(client);
  console.log(JSON.stringify(result, null, 2));
}

run();
