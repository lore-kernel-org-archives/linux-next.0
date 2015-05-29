From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the clk tree with the imx-mxs tree
Date: Fri, 29 May 2015 20:45:53 +1000
Message-ID: <20150529204553.3198ba2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/10XH093XHZnTmgvwZYSH/_T"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45412 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754472AbbE2KqA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 May 2015 06:46:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bintian Wang <bintian.wang@huawei.com>

--Sig_/10XH093XHZnTmgvwZYSH/_T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in
drivers/clk/Makefile between commit 33156149fc4a ("ARM: imx: move clock
drivers into drivers/clk") from the imx-mxs tree and commit
b1691707eccd ("clk: hi6220: Clock driver support for Hisilicon hi6220
SoC") from the clk tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/clk/Makefile
index 96e9778ac9bd,772909d1a612..000000000000
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@@ -47,11 -47,9 +47,10 @@@ obj-$(CONFIG_COMMON_CLK_PWM)		+=3D clk-pw
  obj-$(CONFIG_COMMON_CLK_AT91)		+=3D at91/
  obj-$(CONFIG_ARCH_BCM_MOBILE)		+=3D bcm/
  obj-$(CONFIG_ARCH_BERLIN)		+=3D berlin/
- obj-$(CONFIG_ARCH_HI3xxx)		+=3D hisilicon/
- obj-$(CONFIG_ARCH_HIP04)		+=3D hisilicon/
- obj-$(CONFIG_ARCH_HIX5HD2)		+=3D hisilicon/
+ obj-$(CONFIG_ARCH_HISI)			+=3D hisilicon/
 +obj-$(CONFIG_ARCH_MXC)			+=3D imx/
  obj-$(CONFIG_COMMON_CLK_KEYSTONE)	+=3D keystone/
+ obj-$(CONFIG_ARCH_MEDIATEK)		+=3D mediatek/
  ifeq ($(CONFIG_COMMON_CLK), y)
  obj-$(CONFIG_ARCH_MMP)			+=3D mmp/
  endif

--Sig_/10XH093XHZnTmgvwZYSH/_T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVaENmAAoJEMDTa8Ir7ZwVwZwP+wbxuNIRiSYMgYcC/5wF6dNw
UHgDTryGAZ7oAf1e3bQXtEDOscGesnZChR0xcS3m03TYXYV6iBWyvM2sYK0GEuxx
H2tC5Poft5xAJmxigpa9OTPd7zXvzNFSvQn9YGsAZaSSPajAZvvyE6RIW8ryY42o
8LRpRA1HYyx03mIJq1WKBkBe3FyyrDGaSOBzVRtaZU3OZKah88by2pYJYP6M3wMg
HrlG/BqgXwwL9oQR9H6oOrSOhpXAfsqKiSpYS94fYVaP7YwNMnPNgAbi5bZDJuxj
Na6SbZ4KERoMGtRZXZbaFYULNYB7JMXF/8hfqhvGV9NneCF0D9c8wcPqo4nimQ2M
J3b/wGx+zUwZ9Vl/Nm5ZucJ3ZyKqDxtXokXh4LU6GpO6OjqXrnBTpdMwOU/heWC/
vQdKSbrtsAM7UXBYtbgEwcMBOzPPXm+71S9bClx9bwl7xyqdbL7sTVf96q1PnM7o
8kuS5XHbkice//urLt6Ngr3RO++DSAbnq2wxGOLaMchkHLw+sxM4qSja8HSz7t4+
DPoINDw4adMdjalmas315Ht7LtgeIQoH6zA4B3TxD+MG0vlzZQI4n3+x+4SxL5mX
2LvhsJo9IPaKdmYpaduhhPaxGtNrLf7UiTerzNZuwrCenttfUDk5bJijYCxBnwtB
C2mDFYEkB4JI2PGuaMn5
=w7YZ
-----END PGP SIGNATURE-----

--Sig_/10XH093XHZnTmgvwZYSH/_T--
