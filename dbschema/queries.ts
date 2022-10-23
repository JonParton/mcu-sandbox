import type {Client} from "edgedb";

export async function getTotalGrossProfitPerFranchise(client: Client): Promise<{
  "key": {
    "franchise_name": string;
  };
  "franchise_gross_profit": number;
}[]> {
  return client.query(`with 
groups:= (
  group Movie {
    gross_profit
  }
  using franchise_name := .franchise.name
  by franchise_name
)

select groups {
  key:= .key {franchise_name},
  franchise_gross_profit := sum(.elements.gross_profit)
}`);
}