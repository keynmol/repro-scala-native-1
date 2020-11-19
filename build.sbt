lazy val core = project
  .in(file("core"))
  .enablePlugins(ScalaNativePlugin)
  .settings(
    scalaVersion := "2.11.12",
    // mainClass in (Compile, run) := Some("m.Main")
  )

lazy val app = project
  .in(file("app"))
  .dependsOn(core)
  .enablePlugins(ScalaNativePlugin)
  .settings(
    // mainClass in (Compile, run) := Some("a.App"),
    scalaVersion := "2.11.12"
  )
