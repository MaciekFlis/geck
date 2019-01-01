namespace Api.Controllers

open System
open System.Collections.Generic
open System.Linq
open System.Threading.Tasks
open Microsoft.AspNetCore.Mvc

type HealthStatus = { IsHealthy : bool }

[<Route("health")>]
[<ApiController>]
type HealthController () =
    inherit ControllerBase()

    [<HttpGet>]
    member this.Get() =
        ActionResult<HealthStatus>({ IsHealthy = true })
