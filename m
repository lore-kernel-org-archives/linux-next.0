From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
	[drivers/staging/comedi/drivers.o]
Date: Thu, 4 Jun 2009 22:40:47 +0200
Message-ID: <10f740e80906041340x4f51b5f0ra542b60d758a4b54@mail.gmail.com>
References: <20090604133132.19010.16577.sendpatchset@subratamodak.linux.ibm.com>
	 <20090604180736.GA24902@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:57364 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750814AbZFDUkq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2009 16:40:46 -0400
In-Reply-To: <20090604180736.GA24902@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Subrata Modak <subrata@linux.vnet.ibm.com>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Michael Ellerman <michael@ellerman.id.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>

On Thu, Jun 4, 2009 at 20:07, Greg KH <greg@kroah.com> wrote:
> On Thu, Jun 04, 2009 at 07:01:32PM +0530, Subrata Modak wrote:
>> CC [M] =C2=A0drivers/staging/comedi/drivers.o
>> drivers/staging/comedi/drivers.c: In function =E2=80=98comedi_buf_al=
loc=E2=80=99:
>> drivers/staging/comedi/drivers.c:496: error: =E2=80=98PAGE_KERNEL_NO=
CACHE=E2=80=99 undeclared (first use in this function)
>> drivers/staging/comedi/drivers.c:496: error: (Each undeclared identi=
fier is reported only once
>> drivers/staging/comedi/drivers.c:496: error: for each function it ap=
pears in.)
>> make[3]: *** [drivers/staging/comedi/drivers.o] Error 1
>> make[2]: *** [drivers/staging/comedi] Error 2
>> make[1]: *** [drivers/staging] Error 2
>> make: *** [drivers] Error 2
>>
>> Is it still normal to expect this failure ?
>
> No.
>
>> I reported them long back during April:
>> http://www.gossamer-threads.com/lists/linux/kernel/1065227,
>
> Yes, and I took some patches that were supposed to fix this. =C2=A0I =
can't
> duplicate this here, care to send a patch that would fix it?

PAGE_KERNEL_NOCACHE is defined on a few architectures only, namely
frv, m32r, mn10300, sh, and x86[*]. On all others, it will fail.

[*] Interestingly, sparc refers to it in one of its include files,
without providing a
    definition, Probably that code is unused.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
