From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the imx-mxs tree
Date: Mon, 1 Jun 2015 11:41:34 +1000
Message-ID: <20150601114134.34e60286@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jpZZ3.NJMXdsKK25DcG+uho"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37526 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758221AbbFABlg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 21:41:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ralf Baechle <ralf@linux-mips.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@imgtec.com>

--Sig_/jpZZ3.NJMXdsKK25DcG+uho
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

Today's linux-next merge of the mips tree got a conflict in
drivers/clk/Makefile between commit 33156149fc4a ("ARM: imx: move clock
drivers into drivers/clk") from the imx-mxs tree and commit
66ab9263a018 ("clk: ingenic: add driver for Ingenic SoC CGU clocks")
from the mips tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clk/Makefile
index 96e9778ac9bd,cc773271b919..000000000000
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@@ -50,7 -50,7 +50,8 @@@ obj-$(CONFIG_ARCH_BERLIN)		+=3D berlin
  obj-$(CONFIG_ARCH_HI3xxx)		+=3D hisilicon/
  obj-$(CONFIG_ARCH_HIP04)		+=3D hisilicon/
  obj-$(CONFIG_ARCH_HIX5HD2)		+=3D hisilicon/
 +obj-$(CONFIG_ARCH_MXC)			+=3D imx/
+ obj-$(CONFIG_MACH_INGENIC)		+=3D ingenic/
  obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+=3D keystone/
  ifeq ($(CONFIG_COMMON_CLK), y)
  obj-$(CONFIG_ARCH_MMP)			+=3D mmp/

--Sig_/jpZZ3.NJMXdsKK25DcG+uho
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa7hOAAoJEMDTa8Ir7ZwVOVkP/07O9n3GfY3THY5kUKDGCeQr
v1n8Hd0OM5+1T9ltKOnGTwrBtTMObsqXgvNgr4Nfqv8BEYW+rVEEq6FDXHKRyt+6
gigKzBbFJQqJPd6qE9OKE1KLHhYCj1MUnIpsZ7yMHr8imgLnphL8DuhRAT+PrCPE
xCbCkto7bI/X98oEBgGbcsH/8LslD9WhW50O0Q1hejXDU8XyBBgk6tggvTnoCary
PB182OtJgP4ztZrYziCd/SS0Yj+N/Nolc7hnM280u/fmFwHPQFZBNv9hmA8CEoo7
OaLaxdI5HWyLf6yRcKcOnIAe9vFEUSQ9zpLmRyk/gmlYG+7vtj+XjzdCp4aJI4i+
TweNr+lB2UFubbWXPOZcjiKTvXCk0wwjcVEBm+EFLoFc5RW93+UbE8toCZRCqhf/
zwP9Xrh8SGGlW1TJquLLiwkAaJtgLUGg81JCOZby4TNEK777mw5zI5/6NpRPFlQ9
YTPid+exbnDMbKXKg1DQN7UwSOR8CEVyldaXxfwChYY0+/2D5vEu9AHeE0DrKgQ5
0KMYSbpboA7fZDAfIl9xAdJ30qNOZYoOCNeyn8m6Uzv57ErNMJenor3fJNc4bqPA
13myzPpWVu4UwVyVCI2oeqezzJ1tKGeVMaEGMU6y7bMYNx5xJxONpXEVTJ8G39h6
JQKjRlV626A7mC57V/EE
=Kagp
-----END PGP SIGNATURE-----

--Sig_/jpZZ3.NJMXdsKK25DcG+uho--
