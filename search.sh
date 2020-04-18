#!/bin/sh

echo "searching for $1 package"
debian21="mcr.microsoft.com/dotnet/core/runtime:2.1-stretch-slim"
debian31="mcr.microsoft.com/dotnet/core/runtime:3.1-buster-slim"
ubuntu21="mcr.microsoft.com/dotnet/core/runtime:2.1-bionic"
ubuntu31="mcr.microsoft.com/dotnet/core/runtime:3.1-bionic"

alpine21_311="mcr.microsoft.com/dotnet/core/runtime:2.1-alpine3.11"
alpine21_310="mcr.microsoft.com/dotnet/core/runtime:2.1-alpine3.10"
alpine31_311="mcr.microsoft.com/dotnet/core/runtime:3.1-alpine3.11"
alpine31_310="mcr.microsoft.com/dotnet/core/runtime:3.1-alpine3.10"

for image in $debian21 $debian31 $ubuntu21 $ubuntu31
do
	echo $image
	docker pull $image
	docker run --rm -it -v $(pwd):/scripts -w /scripts $image ./debian-search.sh $1
done

for image in $alpine21_310 $alpine21_311 $alpine31_310 $alpine31_311
do
	echo $image
	docker pull $image
	docker run --rm -it -v $(pwd):/scripts -w /scripts $image ./alpine-search.sh $1
done
