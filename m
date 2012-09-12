From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tegra tree with the usb tree
Date: Wed, 12 Sep 2012 16:38:09 +1000
Message-ID: <20120912163809.bc39832f08b77a0c85dd4289@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__12_Sep_2012_16_38_09_+1000_P3o3/i7st8mDg=Ac"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:40404 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726Ab2ILGiT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Sep 2012 02:38:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Venu Byravarasu <vbyravarasu@nvidia.com>, Greg KH <greg@kroah.com>, Felipe Balbi <balbi@ti.com>

--Signature=_Wed__12_Sep_2012_16_38_09_+1000_P3o3/i7st8mDg=Ac
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got a conflict in
drivers/usb/phy/tegra_usb_phy.c between commit 1ba8216f0bc0 ("usb: move
phy driver from mach-tegra to drivers/usb") from the usb tree and commit
b0e51927b1e5 ("ARM: tegra: remove useless includes of <mach/*.h>") from
the tegra tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/usb/phy/tegra_usb_phy.c
index 4739903,34ffebb..0000000
--- a/drivers/usb/phy/tegra_usb_phy.c
+++ b/drivers/usb/phy/tegra_usb_phy.c
@@@ -28,8 -30,7 +28,7 @@@
  #include <linux/usb/otg.h>
  #include <linux/usb/ulpi.h>
  #include <asm/mach-types.h>
- #include <mach/gpio-tegra.h>
 -#include <mach/usb_phy.h>
 +#include <linux/usb/tegra_usb_phy.h>
  #include <mach/iomap.h>
 =20
  #define ULPI_VIEWPORT		0x170

--Signature=_Wed__12_Sep_2012_16_38_09_+1000_P3o3/i7st8mDg=Ac
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQUC3RAAoJEECxmPOUX5FEYGMP/jTx5SmWyQJ7M6XHeV1r2WEn
AJHvMOScf1G5CdjgzXtBjvurKifvCVwi+IpoI0Dx6rF6C9MK8MIjo2QnLMOOUqaG
UtY3n58jLoPFF4Vac097Pwp7jLfBKxH8HjtOwjA8iRB4C/tI179tNSx7iLDIGquF
sQb1Ki5yqXjZFV5pg6fmSAJRAkwFDu2TuZWpcF6im/AAv1ylVvlJVYzYf1QMKANp
p7XMeLwF9pDX7g+CuhT4mlk/i0UJ12FwOYruO9DCrfXWI05Kq8v5DMy/LmpZ7qf/
qMlu1MKufPlL7BsCkhxlQ21eU/DBjct8+pGtQwMqO/arDdocJJuGaqyHKzjGe6cI
odULnsdOVXiZXGdw7Pn/OxbmycFQMf+irgIvKaYNP4cY43AgM65dfv8HLrUGz+Dp
ELWB/2NdLVCeVKGhwr/qIqkM+zrA99/RktfiKeEXgxEOKUMY4YH1yURTGCHot6aH
lD01LrAyike7bCc1xLwJFeHGFxQxMOKikV06xXUV/6/zAzbNFiY7iFCBlxXL2Irm
ps545YBVHLSwyJ1ifFiFBUJu7QdInPWWPEPLUE5ff7b9rwdlYgFFRelLA96ZwNQX
iN9ZliExLZpPaOzwWi0+B6M+rg2JoXXfySK0IMZO0ygSv/sDwL1EwZ9/KVqG+Jkn
7sWx4rZ7r0S7TGsBMJyp
=4BUu
-----END PGP SIGNATURE-----

--Signature=_Wed__12_Sep_2012_16_38_09_+1000_P3o3/i7st8mDg=Ac--
