From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH][BUILD FAILURE 03/12] Re: Next April 21 : PPC64 randconfig
 [arch/powerpc/kernel/of_platform.o]
Date: Thu, 23 Apr 2009 09:25:30 +0200 (CEST)
Message-ID: <alpine.LRH.2.00.0904230924490.2313@vixen.sonytel.be>
References: <20090422161648.9231.76057.sendpatchset@subratamodak.linux.ibm.com> <1240447420.6689.13.camel@localhost>  <49EFDD66.3060407@oracle.com> <1240460606.6689.32.camel@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vervifontaine.sonytel.be ([80.88.33.193]:53750 "EHLO
	pophost.sonytel.be" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752824AbZDWHZg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 03:25:36 -0400
In-Reply-To: <1240460606.6689.32.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <michael@ellerman.id.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, Linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-next <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Subrata Modak <subrata@linux.vnet.ibm.com>, Alexander Beregalov <a.beregalov@gmail.com>, Balbir Singh <balbir@linux.vnet.ibm.com>

On Thu, 23 Apr 2009, Michael Ellerman wrote:
> On Wed, 2009-04-22 at 20:15 -0700, Randy Dunlap wrote:
> > Michael Ellerman wrote:
> > > On Wed, 2009-04-22 at 21:46 +0530, Subrata Modak wrote:
> > >> On Wed, 2009-04-22 at 00:20 +0530, Subrata Modak wrote:
> > >>> Reported this earlier on 14th April 2009:
> > >>> http://lkml.org/lkml/2009/4/14/480,
> > >>>
> > >>> Michael,
> > >>>
> > >>> Any fix in sight ?
> > >>> http://lkml.org/lkml/2009/4/14/676,
> > >>>
> > >>> CC      arch/powerpc/kernel/of_platform.o
> > >>> arch/powerpc/kernel/of_platform.c: In function 'of_pci_phb_prob=
e':
> > >>> arch/powerpc/kernel/of_platform.c:270: error: implicit declarat=
ion of
> > >>> function 'pci_devs_phb_init_dynamic'
> > >>> arch/powerpc/kernel/of_platform.c:279: error: implicit declarat=
ion of
> > >>> function 'scan_phb'
> > >>> arch/powerpc/kernel/of_platform.c:295: error: implicit declarat=
ion of
> > >>> function 'pci_bus_add_devices'
> > >>> make[1]: *** [arch/powerpc/kernel/of_platform.o] Error 1
> > >>> make: *** [arch/powerpc/kernel] Error 2
> > >>> ---
> > >=20
> > > The problem above is as I said before, that the Cell Kconfig forc=
es on
> > > PPC_OF_PLATFORM_PCI even if PCI is disabled. I think the proper f=
ix is
> > > just to have CELL_NATIVE force on PCI.
> > >=20
> > > I don't know how you got the other errors, both pci_dn.c and pci_=
dlpar.c
> > > are only built if CONFIG_PCI is enabled, see the Makefiles.
> >=20
> >=20
> > The Kconfig could be more like this:
> > config PPC_CELL_NATIVE
> > 	bool
> > 	select PPC_CELL_COMMON
> > -	select PPC_OF_PLATFORM_PCI
> > +	select PPC_OF_PLATFORM_PCI if PCI
>=20
> That might be better. Although I think in truth the Cell code won't
> build without PCI, but we could fix that. As I said in my patch I thi=
nk
> we do want PCI on Cell native, so we should just select it too.
>=20
> http://patchwork.ozlabs.org/patch/26338/

Last time this came up, it was mentioned that QPACE doesn't have PCI.

With kind regards,

Geert Uytterhoeven
Software Architect
Techsoft Centre

Technology and Software Centre Europe
The Corporate Village =B7 Da Vincilaan 7-D1 =B7 B-1935 Zaventem =B7 Bel=
gium

Phone:    +32 (0)2 700 8453
=46ax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 =B7 RPR Brussels
=46ortis =B7 BIC GEBABEBB =B7 IBAN BE41293037680010
