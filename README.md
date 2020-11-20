# Reproduction

Issue: https://github.com/scala-native/scala-native/issues/2024

## Steps:

```bash
# code
git clone https://github.com/keynmol/repro-scala-native-1.git
cd repro-scala-native-1

# Run in a docker container
docker run -v $(pwd):/src -it keynmol/scala-native-repro-nio bash -c "sbt ';clean;nativeLink' && sbt ';clean;nativeLink' && sbt ';clean;nativeLink'"
```

Running SBT 3 times for good measure, because the issue is flaky.