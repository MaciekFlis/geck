module Plants

open Microsoft.AspNetCore.Mvc

type PlantStatus = 
  {
    Id : int;
    Humidity : decimal;
    Temperature : decimal
  }

[<Route("plants/{id}")>]
[<ApiController>]
type PlantsController () =
  inherit ControllerBase()

  [<HttpGet>]
  member this.Get(id : int) = 
    ActionResult<PlantStatus>( 
      { Id = id; 
        Humidity = 10.0m; 
        Temperature = 18.0m} )