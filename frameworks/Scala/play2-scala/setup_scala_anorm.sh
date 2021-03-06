#!/bin/bash

cd play2-scala-anorm
sed -i "s|jdbc:mysql:\/\/.*:3306|jdbc:mysql://${DBHOST}:3306|g" conf/application.conf

# If application has an already existing process id, clear it.
if [ -f ${TROOT}/play2-scala-anorm/target/universal/stage/RUNNING_PID ]
then
  rm -f -r ${TROOT}/play2-scala-anorm/target/universal/stage/RUNNING_PID
fi

# Stage application.
${IROOT}/sbt/bin/sbt stage

# Execute Start script in background.
${TROOT}/play2-scala-anorm/target/universal/stage/bin/play2-scala-anorm &