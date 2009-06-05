From: Greg KH <greg@kroah.com>
Subject: Re: [BUILD FAILURE 01/04] Next June 04:PPC64 randconfig
	[drivers/staging/comedi/drivers.o]
Date: Fri, 5 Jun 2009 11:26:18 -0700
Message-ID: <20090605182618.GA11853@kroah.com>
References: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43855 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750876AbZFESpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Jun 2009 14:45:31 -0400
Content-Disposition: inline
In-Reply-To: <20090605182625.24093.7808.sendpatchset@elm3a191.beaverton.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, Michael Ellerman <michael@ellerman.id.au>

On Fri, Jun 05, 2009 at 01:26:25PM -0500, Subrata Modak wrote:
> >On Thu, 2009-06-04 at 22:40 +0200, Geert Uytterhoeven wrote:
> >On Thu, Jun 4, 2009 at 20:07, Greg KH <greg@kroah.com> wrote:
> > > On Thu, Jun 04, 2009 at 07:01:32PM +0530, Subrata Modak wrote:
> > >> CC [M]  drivers/staging/comedi/drivers.o
> > >> drivers/staging/comedi/drivers.c: In function =E2=80=98comedi_bu=
f_alloc=E2=80=99:
> > >> drivers/staging/comedi/drivers.c:496: error: =E2=80=98PAGE_KERNE=
L_NOCACHE=E2=80=99 undeclared (first use in this function)
> > >> drivers/staging/comedi/drivers.c:496: error: (Each undeclared id=
entifier is reported only once
> > >> drivers/staging/comedi/drivers.c:496: error: for each function i=
t appears in.)
> > >> make[3]: *** [drivers/staging/comedi/drivers.o] Error 1
> > >> make[2]: *** [drivers/staging/comedi] Error 2
> > >> make[1]: *** [drivers/staging] Error 2
> > >> make: *** [drivers] Error 2
> > >>
> > >> Is it still normal to expect this failure ?
> > >
> > > No.
> > >
> > >> I reported them long back during April:
> > >> http://www.gossamer-threads.com/lists/linux/kernel/1065227,
> > >
> > > Yes, and I took some patches that were supposed to fix this.  I c=
an't
> > > duplicate this here, care to send a patch that would fix it?
>=20
> I tried this. But, with some catch. =E2=80=98PAGE_KERNEL_NOCACHE=E2=80=
=99 seems to be the
> choice for majority of architectures like frv, m32r, sh, x86, etc, as=
 Geert
> mentions below. However, i believe POWERPC defines it as =E2=80=98PAG=
E_KERNEL_NC=E2=80=98
> found at arch/powerpc/include/asm/pte-common.h.
>=20
> Paul/Banjamin,
> Can you please confirm this ?
>=20
> The below patch fixes the build error.

Ick, that's a mess.

> +#ifdef __powerpc64__
> +				vmap(pages, n_pages, VM_MAP,
> +				PAGE_KERNEL_NC);
> +#else
>  				vmap(pages, n_pages, VM_MAP,
>  				PAGE_KERNEL_NOCACHE);
> +#endif

Should the comedi layer just not be using PAGE_KERNEL_NOCACHE here?  I
can't believe that we need to do something like this in a driver.  What
should the proper fix for this be?

thanks,

greg k-h
