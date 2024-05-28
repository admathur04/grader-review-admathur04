CPATH="../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

cd student-submission

if [ -f "ListExamples.java" ];
then 
    echo "ListExamples.java exists"
else 
    echo "ListExamples.java does not exist"
    exit 1
fi 

cp ListExamples.java ../grading-area/
cp ../TestListExamples.java ../grading-area/

cd ../grading-area

javac -cp "$CPATH" *.java
if [ $? -eq 0 ] 
then
    echo "Compilation Successful"
else
    echo "Compilation failed"
    exit 1
fi

java -cp ".:$CPATH" org.junit.runner.JUnitCore TestListExamples > result.txt
echo "Test results:"
cat result.txt
exit 0
