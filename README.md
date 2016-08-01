# api-benchmarks


Idea borrowed from: https://medium.com/@tschundeee/express-vs-flask-vs-go-acc0879c2122#.61v429cr3


#### SETUP

## Benchmark tool (wrk)
git clone https://github.com/wg/wrk
cd wrk; make; cp wrk; /usr/local/bin/; cd ..

## Python
pip install meinheld gunicorn falcon

## GO
brew install go
go get github.com/gorilla/pat
go build serve.go

#NodeJS w/pm2 for lazy concurrency
npm install
npm install -g pm2



## Test Go
./serve
## Bench it (in other tab)
wrk -c 64 -d 30s http://localhost:4000/10

## Test Falcon with 4 threads per core
gunicorn -w16 falconer:app -k meinheld.gmeinheld.MeinheldWorker
## Bench it (in other tab)
wrk -c 64 -d 30s http://localhost:8000/10

## Test NodeJS (express)
pm2 start express.js -i 16
## Bench it (in other tab)
wrk -c 64 -d 30s http://localhost:3000/10

## Test NodeJS (restify)
pm2 start express.js -i 16
## Bench it (in other tab)
wrk -c 64 -d 30s http://localhost:3000/10
