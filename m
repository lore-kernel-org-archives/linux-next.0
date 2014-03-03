From: Simon Horman <horms@verge.net.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 renesas tree
Date: Mon, 3 Mar 2014 13:27:01 +0900
Message-ID: <20140303042659.GA14534@verge.net.au>
References: <20140226182700.4001291b522f958a8da83f58@canb.auug.org.au>
 <20140226084627.GC6865@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49940 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753452AbaCCE1F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 2 Mar 2014 23:27:05 -0500
Content-Disposition: inline
In-Reply-To: <20140226084627.GC6865@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, Magnus Damm <damm@opensource.se>

On Wed, Feb 26, 2014 at 09:46:27AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello Stephen,
>=20
> On Wed, Feb 26, 2014 at 06:27:00PM +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the akpm-current tree got a conflict in
> > arch/arm/mach-shmobile/Kconfig between commits 2b2e7c65166a ("ARM:
> > shmobile: Use 64-bit dma_addr_t on r8a7790/r8a7791") and 4a51856b42=
67
> > ("ARM: shmobile: Use 64-bit dma_addr_t on r8a7790/r8a7791") from th=
e
> > renesas tree and commit b096b0b50c4b ("Kconfig: rename HAS_IOPORT t=
o
> > HAS_IOPORT_MAP") from the akpm-current tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary (no ac=
tion
> > is required).
> >=20
> > (I am not sure why that commit appears twice in the renesas tree)
> The two commits (4a51856b4267 and 2b2e7c65166a) both base on top of
> v3.14-rc1, but it seems it's just the CommitData that is different
> beween the twos. The relevant history can be seen in
>=20
> 	git log --boundary --graph --oneline 5ffd11e972c4~2..5ffd11e972c4 --=
 arch/arm/mach-shmobile/Kconfig
>=20
> This shows that heads/defconfig-for-v3.15, heads/soc-for-v3.15 and
> heads/boards-for-v3.15 where pulled into Simon's devel branch twice.
> While heads/defconfig-for-v3.15 is identical in both merges,
> heads/soc-for-v3.15 was rewritten and heads/boards-for-v3.15 got an
> additional patch.
>=20
> Simon: if you want to fix that in your branch, the most easiest optio=
n
> is probably:
>=20
> 	git filter-branch -f --parent-filter 'sed s/4a51856b42672cfcb7d6fbab=
22dcf2caba2be5ab/2b2e7c65166aa4a7d6ca0352b249b38b45680d45/' v3.14-rc1..=
branch1 branch2 branch3
>=20
> for all branches that contain 4a51856b4267.  (Or alternatively
> substitute in the opposite direction if you want to drop 2b2e7c65166a
> instead.)

Thanks.

I believe that I have removed the duplicate commits.

>=20
> > --=20
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> >=20
> > diff --cc arch/arm/mach-shmobile/Kconfig
> > index 57069c12f9a4,dac2941fa383..000000000000
> > --- a/arch/arm/mach-shmobile/Kconfig
> > +++ b/arch/arm/mach-shmobile/Kconfig
> > @@@ -13,8 -13,7 +13,8 @@@ config ARCH_SHMOBILE_MULT
> >   	select ARM_GIC
> >   	select MIGHT_HAVE_CACHE_L2X0
> >   	select MIGHT_HAVE_PCI
> >  +	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
> > - 	select NO_IOPORT
> > + 	select NO_IOPORT_MAP
> >   	select PINCTRL
> >   	select ARCH_REQUIRE_GPIOLIB
> >   	select CLKDEV_LOOKUP
> Obviously looks right. Thanks.
>=20
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig   =
         |
> Industrial Linux Solutions                 | http://www.pengutronix.d=
e/  |
>=20
