namespace Api.Controllers

open Microsoft.AspNetCore.Mvc

type HealthStatus = { IsHealthy : bool }

[<Route("health")>]
[<ApiController>]
type HealthController () =
    inherit ControllerBase()

    [<HttpGet>]
    member this.Get() =
        ActionResult<HealthStatus>({ IsHealthy = true })
