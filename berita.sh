#!/data/data/com.termux/files/usr/bin/bash

#jikalau mau pakai sctipt saya jangan pakai api key nya ya
#langsung daftar di situs news api gratis kok :)

topik=("technology" "business" "science" "health" "general")

function tampil_berita(){
for i in 0 1 2 3 4;
do
api="http://newsapi.org/v2/top-headlines?country=id&category="${topik[$i]}"&apiKey=0579e1ff48b34b2281f98ef323b50f6d"                                  ambil=`curl $api`
for angka in 1 2 3 4 5 6 7 8 9 10;
do
	ambilw=`echo $ambil |
                jq .articles[$angka].publishedAt`
        waktu=`echo $ambilw |
                sed 's/"/⌚/g' |
                sed 's/T/|/g' |
                sed 's/Z//g'`
        ambils=`echo $ambil |
                jq .articles[$angka].source.name`
        sumber=`echo $ambils |
                sed 's/"/📡/g'`
	ambilu=`echo $ambil |
                jq .articles[$angka].url`
	url=`echo $ambilu |
                sed 's/"//g'`
	ambili=`echo $ambil |
                jq .articles[$angka].urlToImage`
        image=`echo $ambili |
                sed 's/"//g'`
	ws=`echo $sumber+$waktu`
	echo $ambil | jq .articles[$angka].title,.articles[$angka].description|
	termux-notification -t $ws --button1 "Link" --button1-action "termux-open $url" --button2 "Image" --button2-action "termux-open $image"
done
done
}
tampil_berita;
