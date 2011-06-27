From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] bcma: main.c needs to include <linux/slab.h>
Date: Mon, 27 Jun 2011 16:09:21 +0200
Message-ID: <BANLkTintpOOnu-DCGkvOYPizu9ZigHfbVg@mail.gmail.com>
References: <alpine.DEB.2.00.1106261016100.25900@ayla.of.borg>
	<BANLkTikSLx6FKvF518s99Q8eRU_WF+cn9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36457 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750708Ab1F0OJW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jun 2011 10:09:22 -0400
In-Reply-To: <BANLkTikSLx6FKvF518s99Q8eRU_WF+cn9A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

2011/6/27 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> 2011/6/26 Geert Uytterhoeven <geert@linux-m68k.org>:
>> m68k allmodconfig:
>>
>> drivers/bcma/main.c: In function =E2=80=98bcma_release_core_dev=E2=80=
=99:
>> drivers/bcma/main.c:68: error: implicit declaration of function =E2=80=
=98kfree=E2=80=99
>
> We already include slab.h in:
> host_pci.c
> scan.c
> sprom.c
>
> Maybe we can just include this in bcma.h as a better solution? We
> could drop other includes then.
> Can you submit patch for this?

If bcma.h doesn't use linux/slab.h, IMHO it should not include linux/sl=
ab.h.

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
