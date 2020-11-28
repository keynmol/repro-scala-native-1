val SCALA_NATIVE = sys.env.getOrElse("SCALA_NATIVE_VERSION", "0.4.0-M2")

addSbtPlugin("org.scala-native" % "sbt-scala-native" % SCALA_NATIVE)
