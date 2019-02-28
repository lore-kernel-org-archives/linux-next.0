From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-soc tree with the arm64 tree
Date: Fri, 1 Mar 2019 09:10:36 +1100
Message-ID: <20190301091036.3e97bb49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lVj6wEX+FD+wCcNo7a/JAd4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/lVj6wEX+FD+wCcNo7a/JAd4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm64/Kconfig.platforms

between commit:

  a29c78234942 ("arm64: Kconfig.platforms: fix warning unmet direct depende=
ncies")

from the arm64 tree and commits:

  67b9282387c5 ("arm64: imx8mq: select GPCv2 irqchip driver")
  84a2ab25b12d ("arm64: imx8mq: select PM support")

from the arm-soc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/arm64/Kconfig.platforms
index d4faca775d9c,c5f6a57f16b8..000000000000
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@@ -145,7 -151,11 +151,11 @@@ config ARCH_MVEB
  config ARCH_MXC
  	bool "ARMv8 based NXP i.MX SoC family"
  	select ARM64_ERRATUM_843419
 -	select ARM64_ERRATUM_845719
 +	select ARM64_ERRATUM_845719 if COMPAT
+ 	select IMX_GPCV2
+ 	select IMX_GPCV2_PM_DOMAINS
+ 	select PM
+ 	select PM_GENERIC_DOMAINS
  	help
  	  This enables support for the ARMv8 based SoCs in the
  	  NXP i.MX family.

--Sig_/lVj6wEX+FD+wCcNo7a/JAd4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx4XFwACgkQAVBC80lX
0Gznfgf8DIjovuZDGFZh8hmY2fdHQaQlzKcNA5XA8IkH1VgWOiUJ/jC1S7LrMdfK
zaAnMCoSrzrie9q0DTdzmXWGNJ1DWoGaz2oueMSdsM/BLaGMJl6c6pCGSEyBaQmI
1Qm9R+RDv0XT+4zZwUDXb16zJeuMSEj+wsIohh9Y03RVDbwEn/FYZWxRLqB8IgWs
LNoaMajIk6m5zUTOAJ9NpG1xG8n4eSW2Hj2xqVILF/TRhtdDC5jD6qf+TqZ1/pzT
gAU33Q+HKpS6WF5OopqZlqmzGG3+xQSjG+aj3cxQoO+xu0Hj7rVuxXZ3lOtai+iG
2X0iX+vV4EkEXke6vTtkc7AiV2jXvg==
=p2P5
-----END PGP SIGNATURE-----

--Sig_/lVj6wEX+FD+wCcNo7a/JAd4--
