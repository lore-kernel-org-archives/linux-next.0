From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 9 Jul 2018 10:28:47 +1000
Message-ID: <20180709102847.214c31d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6Y7hqhR_ZAi=/8EfbWwa6n9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anton Mikaev <amikaev@aquantia.com>, Igor Russkikh <igor.russkikh@aquantia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/6Y7hqhR_ZAi=/8EfbWwa6n9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/aquantia/atlantic/aq_hw.h

between commit:

  94b3b542303f ("net: aquantia: vlan unicast address list correct handling")

from the net tree and commit:

  c1af5427954b ("net: aquantia: Ethtool based ring size configuration")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/ethernet/aquantia/atlantic/aq_hw.h
index 2c6ebd91a9f2,1a51152029c3..000000000000
--- a/drivers/net/ethernet/aquantia/atlantic/aq_hw.h
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_hw.h
@@@ -98,8 -100,9 +100,11 @@@ struct aq_stats_s=20
  #define AQ_HW_MEDIA_TYPE_TP    1U
  #define AQ_HW_MEDIA_TYPE_FIBRE 2U
 =20
 +#define AQ_HW_MULTICAST_ADDRESS_MAX     32U
 +
+ #define AQ_HW_TXD_MULTIPLE 8U
+ #define AQ_HW_RXD_MULTIPLE 8U
+=20
  struct aq_hw_s {
  	atomic_t flags;
  	u8 rbl_enabled:1;

--Sig_/6Y7hqhR_ZAi=/8EfbWwa6n9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltCrD8ACgkQAVBC80lX
0Gw2mAf8DaLNprLEBug2cwtVjrJvqe5vJ6CxF3lCr0QPX0jVYhM0invbbtsvuoXE
b9y1ieWTPb+4Y9huDg8hpf2kPfHQqYh2VhGUmU37d3XfbmPmKpN7DqQDDzr16mzU
adNMHeGZGo4YeAzDFvkofIfK8nSbp+yQ6OJjzzgv5I3LR0tn4NvKjOf2SZQvALVk
ksI0wywhTMq/WQVqQO/AmCEa3KiVCRSJiiGxypgJJiiiFyCELXwMDkQQqiIpqtuw
LfvXDzOszvi5RnTRsXuZbWxrh8rXJs8BPVb+hWYl6wONkYrQ8OJ1xI2Ddm8flAJl
mZskpyeEWB536A4w60DmBCfvwP+Ckg==
=sI/h
-----END PGP SIGNATURE-----

--Sig_/6Y7hqhR_ZAi=/8EfbWwa6n9--
