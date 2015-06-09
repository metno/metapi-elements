# Template for new metapi submodules

This is meant to be used as a starting point when creating new modules
for metapi.

A script. `renameto` is provided, renaming files and classes here to what 
you decide. you may run it like this:

`./renameto foo`

It will rename some files and classes, making them have foo-like names. 
Remember not to commit the results back to metapi-template, but on a 
new remote. 


## Global dependencies

Also, for publishing to metno, make sure the file ~/.sbt/0.13/global.sbt 
exists, with the following contents:

```Scala
publishTo := {
  val nexus = "http://maven.met.no/"
  if (isSnapshot.value)
    Some("snapshots" at nexus + "content/repositories/snapshots")
  else
    Some("releases"  at nexus + "service/local/staging/deploy/maven2")
}

credentials += Credentials(Path.userHome / ".ivy2" / ".credentials")
```
