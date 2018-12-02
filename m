From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the reset tree with the arm-soc tree
Date: Mon, 3 Dec 2018 09:26:26 +1100
Message-ID: <20181203092626.7f1ab2f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6+JRWsYlHtqSZBx10FeT+8L"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgUMOp?= =?UTF-8?B?cm9u?= <peron.clem@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6+JRWsYlHtqSZBx10FeT+8L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Today's linux-next merge of the reset tree got a conflict in:

  arch/arm/mach-socfpga/socfpga.c

between commit:

  8f6f8c77fc4d ("reset: socfpga: add an early reset driver for SoCFPGA")

from the arm-soc tree and commit:

  48e2bab90d8e ("ARM: socfpga: Clean unused functions")

from the reset tree.

Note that it is generally a bad idea to declare extern functions in c
files ... the declaration should be in some header file that is included
by the files containing the definition and usage.  That would
have also removed the need for the forward declaration in
drivers/reset/reset-socfpga.c.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm/mach-socfpga/socfpga.c
index 5fb6f79059a8,cc64576c102b..000000000000
--- a/arch/arm/mach-socfpga/socfpga.c
+++ b/arch/arm/mach-socfpga/socfpga.c
@@@ -32,7 -32,9 +32,9 @@@ void __iomem *rst_manager_base_addr
  void __iomem *sdr_ctl_base_addr;
  unsigned long socfpga_cpu1start_addr;
 =20
+ extern void __init socfpga_reset_init(void);
+=20
 -void __init socfpga_sysmgr_init(void)
 +static void __init socfpga_sysmgr_init(void)
  {
  	struct device_node *np;
 =20

--Sig_/6+JRWsYlHtqSZBx10FeT+8L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwEXBIACgkQAVBC80lX
0GwlFwf/ZvuY4YXQnBH4c26EhsKjK5qLAR1or+i2kALicm5U3PfoIbwJHkq6wmL+
BzutVSJYd+a1LMVdbOV3ayY4bu4In5GuSmsKC35vBqGF9TY8ORZde1hZalIcsG5A
AMQEr7bbhnTWC+L0RFx6lE3NLShh4VzGLAXlT7sxTzlR7sEUYMexIhFFpPQSgMII
neYawUX2PROpF/+9BbVMKhxIDS0Lgsm8Y6ujiTbeCqoHGrobTnY5R0lTBUV8NL18
hOYUGrSPO38E3t8aC1K6jwHFGb1fWJ1cc4HK1Vn/H92HEuP12boqZjbClNfMOMek
bbcxbNO75piJCDp+O5ndgyzKKKD3og==
=F0UW
-----END PGP SIGNATURE-----

--Sig_/6+JRWsYlHtqSZBx10FeT+8L--
