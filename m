From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] bcma: main.c needs to include <linux/slab.h>
Date: Mon, 27 Jun 2011 16:49:39 +0200
Message-ID: <BANLkTi=XYQYee_AoKOXXmO4krwscP_qo4g@mail.gmail.com>
References: <alpine.DEB.2.00.1106261016100.25900@ayla.of.borg>
	<BANLkTikSLx6FKvF518s99Q8eRU_WF+cn9A@mail.gmail.com>
	<BANLkTinGvM79fza-=bFwcbtfFzGHAVKJag@mail.gmail.com>
	<4E089730.1080306@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E089730.1080306-mXXj517/zsQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>
Cc: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Development <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

2011/6/27 Pavel Roskin <proski-mXXj517/zsQ@public.gmane.org>:
> On 06/27/2011 10:24 AM, Alexey Dobriyan wrote:
>>
>> 2011/6/27 Rafa=C5=82 Mi=C5=82ecki<zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>>>
>>> 2011/6/26 Geert Uytterhoeven<geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>:
>>>>
>>>> m68k allmodconfig:
>>>>
>>>> drivers/bcma/main.c: In function =E2=80=98bcma_release_core_dev=E2=
=80=99:
>>>> drivers/bcma/main.c:68: error: implicit declaration of function =E2=
=80=98kfree=E2=80=99
>>>
>>> We already include slab.h in:
>>> host_pci.c
>>> scan.c
>>> sprom.c
>>>
>>> Maybe we can just include this in bcma.h as a better solution?
>>
>> It isn't better solution.
>> It results in situation where unnecessary inclusion will be done.
>> Maybe it's not the case now, but it will be in future.
>
> I agree. =C2=A0kfree() is used in main.c, not in bcma.h. =C2=A0There =
is no need for
> all files that include bcma.h to include linux/slab.h, especially (bu=
t not
> only) because bcma.h is not a private header.

You ignore the fact I clarified my idea to use bcma_private.h instead o=
f bcma.h.

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
