From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build failure after merge of the final tree
 (jdelvare-hwmon tree related)
Date: Thu, 17 Mar 2011 13:18:00 +0100
Message-ID: <AANLkTin46NLhP+0mmYELkD8zeC5o32H=-jXkySZ4R_dj@mail.gmail.com>
References: <20110315192428.ce74a177.sfr@canb.auug.org.au>
	<4D7F2609.3080508@redhat.com>
	<20110315103228.30233acc@endymion.delvare>
	<20110315212226.7e940b51.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:45146 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754118Ab1CQMSC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Mar 2011 08:18:02 -0400
In-Reply-To: <20110315212226.7e940b51.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <khali@linux-fr.org>, Hans de Goede <hdegoede@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 15, 2011 at 11:22, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> On Tue, 15 Mar 2011 10:32:28 +0100 Jean Delvare <khali@linux-fr.org> =
wrote:
>> Stephen, sorry for the inconvenience, both Hans and myself build-tes=
ted
>> the new code on an architecture where <linux/delay.h> gets included
>> implicitly, so we didn't notice it was missing.
>
> It happens. =C2=A0It seems that delay.h is almost always the one that=
 is
> forgotten. =C2=A0X86 builds include it implicitly but powerpc doesn't=
=2E
>
> I wonder if we could concoct a nice checkpatch test for it.

Or remove the implicit includes on x86...

$ git grep delay\\.h arch/x86/include/
arch/x86/include/asm/apic.h:#include <linux/delay.h>
arch/x86/include/asm/dma.h:#include <linux/delay.h>
arch/x86/include/asm/i8259.h:#include <linux/delay.h>
$

At first sight, apic.h and dmah.h don't seem to need it.

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
