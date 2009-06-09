From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
	[drivers/staging/comedi/drivers.o]
Date: Tue, 9 Jun 2009 20:54:54 +0200
Message-ID: <10f740e80906091154p60babd99t8452696ec7ccc8f3@mail.gmail.com>
References: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
	 <1244261806.31984.36.camel@pasglop> <20090606055103.GA9446@kroah.com>
	 <200906060936.22322.fmhess@speakeasy.net>
	 <1244385405.5265.7.camel@subratamodak.linux.ibm.com>
	 <1244519418.5235.2.camel@pasglop>
	 <1244572446.5497.32.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:47265 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752386AbZFISyy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 14:54:54 -0400
In-Reply-To: <1244572446.5497.32.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: subrata@linux.vnet.ibm.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg KH <greg@kroah.com>, fmhess@users.sourceforge.net, Ian Abbott <abbotti@mev.co.uk>, David Miller <davem@davemloft.net>, sachinp@linux.vnet.ibm.com, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, Linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, paulus@samba.org, Geert.Uytterhoeven@sonycom.com

On Tue, Jun 9, 2009 at 20:34, Subrata Modak<subrata@linux.vnet.ibm.com>=
 wrote:
> On Tue, 2009-06-09 at 13:50 +1000, Benjamin Herrenschmidt wrote:
>> On Sun, 2009-06-07 at 20:06 +0530, Subrata Modak wrote:
>> > On Sat, 2009-06-06 at 09:36 -0400, Frank Mori Hess wrote:
>> > > On Saturday 06 June 2009, Greg KH wrote:
>> > > > Frank and Ian, any thoughts about the vmap call in the
>> > > > comedi_buf_alloc() call? =C2=A0Why is it using PAGE_KERNEL_NOC=
ACHE, and what
>> > > > is the prealloc_buf buffer used for?
>> > >
>> > > It is a circular buffer used to hold data streaming either to or=
 from a
>> > > board (for example when producing an analog output waveform). =C2=
=A0Reads and
>> > > writes to the device files read/write to the circular buffer, pl=
us a few
>> > > drivers do dma directly to/from it. =C2=A0I personally don't hav=
e a problem
>> > > with requiring drivers to have their own dma buffers and making =
them copy
>> > > data between their private dma buffers and the main circular buf=
fer. =C2=A0I
>> > > guess the original design wanted to support zero-copy dma.
>> >
>> > Great to hear that. How about a patch that solves my build problem=
 on
>> > PPC64(the problem seems to be existing for long) ?
>>
>> In any case, doing PAGE_KERNEL_NOCACHE for DMA memory is incorrect o=
n
>> many architectures. So at this stage, there's no much option but ifd=
ef I
>> suspect for now until this is fixed properly.
>
> Ok. But, i am not sure whether Greg will agree to this. If, Ok, is th=
e
> following patch i sent earlier Ok ?
>
> http://lkml.org/lkml/2009/6/5/462,

Your patch helps powerpc only. Compilation is still broken on most
other architectures.

>> It does make sense to want to have some memory like that shared betw=
een
>> user space and DMA, though I don't know what the right approach that
>> works on all archs is at this stage. Worth asking the Alsa guys, I t=
hink
>> they have similar issues :-)
>>
>> But doing double buffering might do the trick fine for now.

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
