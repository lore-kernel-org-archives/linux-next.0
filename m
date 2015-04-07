From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Tue, 7 Apr 2015 19:28:08 +1000
Message-ID: <20150407192808.375a5d91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RPqE8/yvPmRrt/J37AMKdy_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Xuelin Shi <xuelin.shi@freescale.com>
List-Id: linux-next.vger.kernel.org

--Sig_/RPqE8/yvPmRrt/J37AMKdy_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in
drivers/dma/Kconfig between commit ad80da658bbc ("dmaengine: Driver
support for FSL RaidEngine device") from the slave-dma tree and commit
2b49e0c56741 ("dmaengine: append hsu DMA driver") from the tty tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/dma/Kconfig
index 38ece743f61d,074ffad334a7..000000000000
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@@ -112,17 -125,8 +112,19 @@@ config FSL_DM
  	  EloPlus is on mpc85xx and mpc86xx and Pxxx parts, and the Elo3 is on
  	  some Txxx and Bxxx parts.
 =20
 +config FSL_RAID
 +        tristate "Freescale RAID engine Support"
 +        depends on FSL_SOC && !ASYNC_TX_ENABLE_CHANNEL_SWITCH
 +        select DMA_ENGINE
 +        select DMA_ENGINE_RAID
 +        ---help---
 +          Enable support for Freescale RAID Engine. RAID Engine is
 +          available on some QorIQ SoCs (like P5020/P5040). It has
 +          the capability to offload memcpy, xor and pq computation
 +	  for raid5/6.
 +
+ source "drivers/dma/hsu/Kconfig"
+=20
  config MPC512X_DMA
  	tristate "Freescale MPC512x built-in DMA engine support"
  	depends on PPC_MPC512x || PPC_MPC831x

--Sig_/RPqE8/yvPmRrt/J37AMKdy_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVI6MtAAoJEMDTa8Ir7ZwVUqMP/199UDTdsCXN7172n/+6rmOc
oLKpI7bXZvkeayg7VAjdlOQ9RsVBHiCnIJ4ylj3i6MaY5vXKS+JSs+Lc1wQxf7fq
8ARVA/eNVKN2WHBBh6LUr35jUO45gMHFMJJZTAHMtFUNT9r/oRbS9JW1PXrgb3uW
ZPLujk3TnymmRYO3FdjoNCQgKEOcvHMG8Ix1CGNmiKUXkRv233SnL62zIuo56+S3
EKWElU0mY9nkOgVKKSIlugBupSWCcBHS3uhg+sqAxsdD0SvSme9OpZDsJBtkCkkd
IARWviq0OK8ErFDkJt0dKU+o9YaOtMib59WmRJSSH9QQQA9qJ6DcujiT+tm+jXpg
rNb4R+WWjGtC3Wb0S2H4HYhDVdBV7WeIMFAP3qF7zpSbKdAfgm0WpOX194qsYpU7
6IzoqDk9awHI1NVutcJziEOmBcjcHACqR9UPButB3K1hJJZPhBGCSxqTDlZFLQs4
qbjXGq7NWSNpKxz4vt5ilmbdgU+n2PmqjcpVQIUHtvlB+bs+FrZq60AeY9uxgfA4
fGWVaEukOhElmKnuZ9uKXuhWz3To9OQ6lEs+H+XI2IDDHJT4DRh6WvN6NNa0DYwx
uOaHKbJauV86mvHpUm8oWE8hp5cVgpEdZwjWX2gP518ROm2vlLJwbaRCT6QtcT5a
QWKtckONOITabZftrfVC
=XeHc
-----END PGP SIGNATURE-----

--Sig_/RPqE8/yvPmRrt/J37AMKdy_--
