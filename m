From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 renesas tree
Date: Wed, 26 Feb 2014 09:46:27 +0100
Message-ID: <20140226084627.GC6865@pengutronix.de>
References: <20140226182700.4001291b522f958a8da83f58@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42360 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750801AbaBZIqg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Feb 2014 03:46:36 -0500
Content-Disposition: inline
In-Reply-To: <20140226182700.4001291b522f958a8da83f58@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Simon Horman <horms@verge.net.au>, linux-next@vger.kernel.org, Magnus Damm <damm@opensource.se>

Hello Stephen,

On Wed, Feb 26, 2014 at 06:27:00PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the akpm-current tree got a conflict in
> arch/arm/mach-shmobile/Kconfig between commits 2b2e7c65166a ("ARM:
> shmobile: Use 64-bit dma_addr_t on r8a7790/r8a7791") and 4a51856b4267
> ("ARM: shmobile: Use 64-bit dma_addr_t on r8a7790/r8a7791") from the
> renesas tree and commit b096b0b50c4b ("Kconfig: rename HAS_IOPORT to
> HAS_IOPORT_MAP") from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no acti=
on
> is required).
>=20
> (I am not sure why that commit appears twice in the renesas tree)
The two commits (4a51856b4267 and 2b2e7c65166a) both base on top of
v3.14-rc1, but it seems it's just the CommitData that is different
beween the twos. The relevant history can be seen in

	git log --boundary --graph --oneline 5ffd11e972c4~2..5ffd11e972c4 -- a=
rch/arm/mach-shmobile/Kconfig

This shows that heads/defconfig-for-v3.15, heads/soc-for-v3.15 and
heads/boards-for-v3.15 where pulled into Simon's devel branch twice.
While heads/defconfig-for-v3.15 is identical in both merges,
heads/soc-for-v3.15 was rewritten and heads/boards-for-v3.15 got an
additional patch.

Simon: if you want to fix that in your branch, the most easiest option
is probably:

	git filter-branch -f --parent-filter 'sed s/4a51856b42672cfcb7d6fbab22=
dcf2caba2be5ab/2b2e7c65166aa4a7d6ca0352b249b38b45680d45/' v3.14-rc1..br=
anch1 branch2 branch3

for all branches that contain 4a51856b4267.  (Or alternatively
substitute in the opposite direction if you want to drop 2b2e7c65166a
instead.)

> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc arch/arm/mach-shmobile/Kconfig
> index 57069c12f9a4,dac2941fa383..000000000000
> --- a/arch/arm/mach-shmobile/Kconfig
> +++ b/arch/arm/mach-shmobile/Kconfig
> @@@ -13,8 -13,7 +13,8 @@@ config ARCH_SHMOBILE_MULT
>   	select ARM_GIC
>   	select MIGHT_HAVE_CACHE_L2X0
>   	select MIGHT_HAVE_PCI
>  +	select ARCH_DMA_ADDR_T_64BIT if ARM_LPAE
> - 	select NO_IOPORT
> + 	select NO_IOPORT_MAP
>   	select PINCTRL
>   	select ARCH_REQUIRE_GPIOLIB
>   	select CLKDEV_LOOKUP
Obviously looks right. Thanks.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
