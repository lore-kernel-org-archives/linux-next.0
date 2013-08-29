From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the v4l-dvb tree
Date: Thu, 29 Aug 2013 17:50:12 +1000
Message-ID: <20130829175012.2380fdebfa8a5f57695e5467@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__29_Aug_2013_17_50_12_+1000_erlgXX7kkHDDeDFu"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59862 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754968Ab3H2HuP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2013 03:50:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--Signature=_Thu__29_Aug_2013_17_50_12_+1000_erlgXX7kkHDDeDFu
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in
arch/arm/mach-shmobile/include/mach/r8a7779.h between commit 4714a0255eee
("[media] ARM: shmobile: r8a7779: add VIN support") from the v4l-dvb tree
and commit fee529df76ff ("ARM: shmobile: r8a7779: cleanup registration of
usb phy") from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-shmobile/include/mach/r8a7779.h
index 6d2b641,f08d6ec..0000000
--- a/arch/arm/mach-shmobile/include/mach/r8a7779.h
+++ b/arch/arm/mach-shmobile/include/mach/r8a7779.h
@@@ -4,8 -4,6 +4,7 @@@
  #include <linux/sh_clk.h>
  #include <linux/pm_domain.h>
  #include <linux/sh_eth.h>
- #include <linux/platform_data/usb-rcar-phy.h>
 +#include <linux/platform_data/camera-rcar.h>
 =20
  struct platform_device;
 =20
@@@ -35,9 -32,6 +33,8 @@@ extern void r8a7779_add_early_devices(v
  extern void r8a7779_add_standard_devices(void);
  extern void r8a7779_add_standard_devices_dt(void);
  extern void r8a7779_add_ether_device(struct sh_eth_plat_data *pdata);
- extern void r8a7779_add_usb_phy_device(struct rcar_phy_platform_data *pda=
ta);
 +extern void r8a7779_add_vin_device(int idx,
 +				   struct rcar_vin_platform_data *pdata);
  extern void r8a7779_init_late(void);
  extern void r8a7779_clock_init(void);
  extern void r8a7779_pinmux_init(void);

--Signature=_Thu__29_Aug_2013_17_50_12_+1000_erlgXX7kkHDDeDFu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSHv00AAoJEECxmPOUX5FEvwUP/2WMUyeZlC0Y7jilA1uAwWtW
g17TTB6LyhuwHzoEenqFi3XxfDyXLTW4e6z/y0C8aV/pCQ5ULU5fCtK7Zp8jDcXb
9DIKBc0q9ogILMsyJyzaYoYFB76zl1xWom6kDWLZ30QE7MgWlhyYF341IZwHT7La
alwgczaXiKAyaQsis2trFsKeWpFH7bEdaCfP8txXqC5J/Xp3B4nw9Js8jwck5uV2
bqW+v0/GPMd0JrpKBX5dBeOt31llAWd8Qd5qv1eNASgjufQOnR7SgFl+YPmUajv4
eEBEHObQQ3uBaufT9kJ2QUB45Figa3OcaKpvsyUT6DQ6h8Hjg7axKz4OQnp0olIR
gB6uydVYEpYDRw0Ha0thSiVDh8E6pThujcBDjp3zRlu/lILEizYOHDuD621XQMxK
n4nzJwdC+/2ZzHowwvqvjxwrB827W5rsTIjLZnArkLQn9Sw40gFVY2VOoJt3VBJu
kiXT48c8jaxo8tDs224PMzP8eVRs++EpX4Is8oTfd0LYLXrLCfPWctTUbloGMS8s
cjbwRmqorrGsPCevYXoUg8SMD2S9ZgWt8FuyO6plrlRzPxkuyeLjSzBxhRRrOfro
KBWcMjBXEfZGJ8kpbVrGKxqsgaIoTKRlP6EphKIoRCSWo/RQr1Jf41jOuLvECIpE
U+5TplkNtp+pJtsocjig
=l1oJ
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Aug_2013_17_50_12_+1000_erlgXX7kkHDDeDFu--
