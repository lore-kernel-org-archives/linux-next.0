From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: linux-next: build failure after merge of the wireless-drivers-next tree
Date: Tue, 19 Jul 2016 10:09:16 +0300
Message-ID: <871t2qw1cz.fsf@kamboji.qca.qualcomm.com>
References: <20160719160831.79c0303f@canb.auug.org.au>
	<8760s2w369.fsf@kamboji.qca.qualcomm.com>
	<CACna6rxVFD1MpAEYP_Zd4W8CvgnxSQpa0wJs83jwDJ5v11gZ=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6rxVFD1MpAEYP_Zd4W8CvgnxSQpa0wJs83jwDJ5v11gZ=Q@mail.gmail.com>
	(=?utf-8?Q?=22Rafa=C5=82_Mi=C5=82ecki=22's?= message of "Tue, 19 Jul 2016
 08:51:48 +0200")
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd@lists.infradead.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "linux-wireless@vger.kernel.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 19 July 2016 at 08:30, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org> writes:
>>
>>> After merging the wireless-drivers-next tree, today's linux-next bu=
ild
>>> (powerpc allyesconfig) failed like this:
>>>
>>> drivers/mtd/devices/bcm47xxsflash.c: In function 'bcm47xxsflash_bcm=
a_probe':
>>> drivers/mtd/devices/bcm47xxsflash.c:299:17: error: implicit declara=
tion of function 'ioremap_cache' [-Werror=3Dimplicit-function-declarati=
on]
>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>                  ^
>>> drivers/mtd/devices/bcm47xxsflash.c:299:15: warning: assignment mak=
es pointer from integer without a cast [-Wint-conversion]
>>>   b47s->window =3D ioremap_cache(res->start, resource_size(res));
>>>                ^
>>>
>>> Caused by commit
>>>
>>>   57d8f7dd2132 ("bcma: allow enabling serial flash support on non-M=
IPS SoCs")
>>>
>>> I have reverted that commit for today.
>>
>> Thanks, kbuild bot also notified about this.
>>
>> Rafa=C5=82, as the merge window is getting really close I would like=
 to
>> revert this for now and we can reapply it once we the problem is ful=
ly
>> solved. And we can use my pending branch for build testing the patch
>> with kbuild bot. What do you think?
>
> The simplest fix sounds pretty much as simple as the revert.

The problem is that I don't have much time, I need to send the pull
request to Dave within next few days. The fix might create other
problems so I'm not enthusiastic about iterating with this patch at the
moment. I think it can wait for 4.9.

--=20
Kalle Valo
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
