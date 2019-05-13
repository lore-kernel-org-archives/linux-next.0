From: Carlo Pisani <carlojpisani@gmail.com>
Subject: Re: C3600, sata controller
Date: Mon, 13 May 2019 17:10:13 +0200
Message-ID: <CA+QBN9CN=n556f0KYj2LZ4q9wY+wx9mbWpaMcC44GufUqbsgEg@mail.gmail.com>
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Parisc List <linux-parisc@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

hi, good news!
after a burn-in test of 8hours, we can affirm that Adaptec 1210SA does work
The chip is "Silicon Image Sil31122", so the kernel module is
"sata_sil" (not sata_sil24)

while [ 1 ]
do
for item in `ls *.bin`
    do
        rm -f $copy.out
        echo -n "$item ... "
        mycp $item $copy.out
        echo "done"
    done
done

*.bin are giant files, 1GB, 2GB, 4GB, 8GB, 16GB, 32GB

it has been tested on a PCI 32bit lost of a C3600
with kernel /v4.16!!!

"mycp" does a copy and then checks the md5 checksum

I think this card can be added to the list!

Our list has been already updated
http://www.downthebunker.com/reloaded/space/viewtopic.php?f=50&p=1632
