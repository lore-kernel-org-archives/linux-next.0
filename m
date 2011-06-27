From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] bcma: main.c needs to include <linux/slab.h>
Date: Mon, 27 Jun 2011 16:53:42 +0200
Message-ID: <BANLkTi=NNP+-jsR34CdzJ=ygJ=-izRbSXg@mail.gmail.com>
References: <alpine.DEB.2.00.1106261016100.25900@ayla.of.borg>
	<BANLkTikSLx6FKvF518s99Q8eRU_WF+cn9A@mail.gmail.com>
	<BANLkTinGvM79fza-=bFwcbtfFzGHAVKJag@mail.gmail.com>
	<4E089730.1080306@gnu.org>
	<BANLkTi=XYQYee_AoKOXXmO4krwscP_qo4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44743 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750698Ab1F0Oxn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jun 2011 10:53:43 -0400
In-Reply-To: <BANLkTi=XYQYee_AoKOXXmO4krwscP_qo4g@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Pavel Roskin <proski@gnu.org>, Alexey Dobriyan <adobriyan@gmail.com>, linux-wireless@vger.kernel.org, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

2011/6/27 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> 2011/6/27 Pavel Roskin <proski@gnu.org>:
>> On 06/27/2011 10:24 AM, Alexey Dobriyan wrote:
>>> 2011/6/27 Rafa=C5=82 Mi=C5=82ecki<zajec5@gmail.com>:
>>>> 2011/6/26 Geert Uytterhoeven<geert@linux-m68k.org>:
>>>>>
>>>>> m68k allmodconfig:
>>>>>
>>>>> drivers/bcma/main.c: In function =E2=80=98bcma_release_core_dev=E2=
=80=99:
>>>>> drivers/bcma/main.c:68: error: implicit declaration of function =E2=
=80=98kfree=E2=80=99
>>>>
>>>> We already include slab.h in:
>>>> host_pci.c
>>>> scan.c
>>>> sprom.c
>>>>
>>>> Maybe we can just include this in bcma.h as a better solution?
>>>
>>> It isn't better solution.
>>> It results in situation where unnecessary inclusion will be done.
>>> Maybe it's not the case now, but it will be in future.
>>
>> I agree. =C2=A0kfree() is used in main.c, not in bcma.h. =C2=A0There=
 is no need for
>> all files that include bcma.h to include linux/slab.h, especially (b=
ut not
>> only) because bcma.h is not a private header.
>
> You ignore the fact I clarified my idea to use bcma_private.h instead=
 of bcma.h.

One day A Cleaner will remove it again, seeing bcma_private.h doesn't
use any slab
interface, and it still seems to compile on his platform of choice
(which implicitly
pulls in slab.h).

If it's put in main.c, The Cleaner will notice main.c uses kfree(),
and won't touch it.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
