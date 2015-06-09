name := """elements"""

organization := "no.met.data"

version := "0.1-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.11.6"

scalacOptions += "-feature"

javaOptions += "-Djunit.outdir=target/test-report"

ScoverageSbtPlugin.ScoverageKeys.coverageHighlighting := true

ScoverageSbtPlugin.ScoverageKeys.coverageMinimum := 95

ScoverageSbtPlugin.ScoverageKeys.coverageFailOnMinimum := true

ScoverageSbtPlugin.ScoverageKeys.coverageExcludedPackages := """
  <empty>;
  util.HttpStatus;views.html.swaggerUi.*;
  value.ApiResponse;
  ReverseApplication;
  ReverseAssets;
  Routes;
"""

scalacOptions += "-feature"

scalacOptions += "-language:postfixOps"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache,
  ws
)

PlayKeys.devSettings += ("application.router", "elements.Routes")
