From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: linux-next: Tree for November 19
Date: Sat, 20 Nov 2010 11:44:37 +0100
Message-ID: <4CE7A695.10508@fusionio.com>
References: <20101119143207.b2d5731e.sfr@canb.auug.org.au>	<AANLkTik0jXvoNTfNzAGAnzDQbE5oyEVmQ0hVyYt84jGQ@mail.gmail.com> <AANLkTinUToUN8sfRBtTQm=8TeTGxDBwPnJC8j8zrJ_8c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTinUToUN8sfRBtTQm=8TeTGxDBwPnJC8j8zrJ_8c@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mike Miller <mike.miller@hp.com>
List-Id: linux-next.vger.kernel.org

On 2010-11-20 06:52, Zimny Lech wrote:
> W dniu 20 listopada 2010 06:50 u=BFytkownik Zimny Lech
> <napohybelskurwysynom2010@gmail.com> napisa=B3:
>> Hi,
>>
>> 2010/11/19 Stephen Rothwell <sfr@canb.auug.org.au>:
>>> Hi all,
>>>
>>> Changes since 20101118:
>>
>> I do not recall that I saw it before
>>  CC [M]  drivers/block/cciss.o
>> /home/test/linux-2.6/drivers/block/cciss.c: In function 'cciss_clean=
up':
>> /home/test/linux-2.6/drivers/block/cciss.c:4929:6: error: 'proc_ccis=
s'
>> undeclared (first use in this function)
>> /home/test/linux-2.6/drivers/block/cciss.c:4929:6: note: each
>> undeclared identifier is reported only once for each function it
>> appears in
>> make[3]: *** [drivers/block/cciss.o] Error 1
>> make[2]: *** [drivers/block] Error 2
>> make[1]: *** [drivers] Error 2
>> make: *** [sub-make] Error 2
>>
>=20
> BTW. mainline too I guess

A fix for this is queued up in for-linus, it'll go out shortly.

--=20
Jens Axboe
