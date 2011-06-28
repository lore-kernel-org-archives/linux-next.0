From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH -next] bcma: main.c needs to include <linux/slab.h>
Date: Tue, 28 Jun 2011 11:49:31 +0200
Message-ID: <BANLkTin4w2QWGNxqbyZyzO+wCmkBH6eUVg@mail.gmail.com>
References: <alpine.DEB.2.00.1106261016100.25900@ayla.of.borg>
	<BANLkTin_axWbYNKox+R59VmEq7tggaKvHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:33552 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756300Ab1F1Jtc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 28 Jun 2011 05:49:32 -0400
In-Reply-To: <BANLkTin_axWbYNKox+R59VmEq7tggaKvHQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

2011/6/28 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> Hopefully last thing ;)
>
> 2011/6/26 Geert Uytterhoeven <geert@linux-m68k.org>:
>> m68k allmodconfig:
>>
>> drivers/bcma/main.c: In function =E2=80=98bcma_release_core_dev=E2=80=
=99:
>> drivers/bcma/main.c:68: error: implicit declaration of function =E2=80=
=98kfree=E2=80=99
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> --
>
>
> If this is not manual mistake, you may want to fix your script or
> whatever you use. You typed "--" instead of "---", which resulted in
> the following commit message:

It's a manual mistake :-)

> m68k allmodconfig:
>
> =C2=A0drivers/bcma/main.c: In function =C3=A2=E2=82=AC=CB=9Cbcma_rele=
ase_core_dev=C3=A2=E2=82=AC=E2=84=A2:
> =C2=A0drivers/bcma/main.c:68: error: implicit declaration of function=
 =C3=A2=E2=82=AC=CB=9Ckfree=C3=A2=E2=82=AC=E2=84=A2
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> =C2=A0--
> =C2=A0http://kisskb.ellerman.id.au/kisskb/buildresult/4243344/
>
> =C2=A0drivers/bcma/main.c | =C2=A0 =C2=A01 +
> =C2=A01 files changed, 1 insertions(+), 0 deletions(-)
> Signed-off-by: John W. Linville <linville@tuxdriver.com>

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
