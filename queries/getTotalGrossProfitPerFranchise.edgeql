with 
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
}