From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Fri, 12 Oct 2018 10:45:01 +1100
Message-ID: <20181012104501.063dcc4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0DFU4xM79nqYEe4lM7o4//4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arthur Kiyanovski <akiyano@amazon.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0DFU4xM79nqYEe4lM7o4//4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/amazon/ena/ena_eth_com.c

between commit:

  248ab77342d0 ("net: ena: fix auto casting to boolean")

from the net tree and commit:

  cb36bb36e1f1 ("net: ena: use CSUM_CHECKED device indication to report skb=
's checksum status")

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

diff --cc drivers/net/ethernet/amazon/ena/ena_eth_com.c
index 2b3ff0c20155,6f8e15b9b3cf..000000000000
--- a/drivers/net/ethernet/amazon/ena/ena_eth_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
@@@ -245,11 -349,14 +349,14 @@@ static inline void ena_com_rx_set_flags
  		(cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L4_PROTO_IDX_MASK) >>
  		ENA_ETH_IO_RX_CDESC_BASE_L4_PROTO_IDX_SHIFT;
  	ena_rx_ctx->l3_csum_err =3D
 -		(cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_MASK) >>
 -		ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_SHIFT;
 +		!!((cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_MASK) >>
 +		ENA_ETH_IO_RX_CDESC_BASE_L3_CSUM_ERR_SHIFT);
  	ena_rx_ctx->l4_csum_err =3D
 -		(cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_MASK) >>
 -		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_SHIFT;
 +		!!((cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_MASK) >>
 +		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_ERR_SHIFT);
+ 	ena_rx_ctx->l4_csum_checked =3D
+ 		!!((cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_CHECKED_MASK) >>
+ 		ENA_ETH_IO_RX_CDESC_BASE_L4_CSUM_CHECKED_SHIFT);
  	ena_rx_ctx->hash =3D cdesc->hash;
  	ena_rx_ctx->frag =3D
  		(cdesc->status & ENA_ETH_IO_RX_CDESC_BASE_IPV4_FRAG_MASK) >>

--Sig_/0DFU4xM79nqYEe4lM7o4//4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu/4H0ACgkQAVBC80lX
0GykpAf/a6LXMoIH0u5WKc6AlljvaZ+VCJzRrsYeRAZXiw95LHgL6UXYbjKcQEZR
nDpAk1i7NTyauY97uQZ29tcOjBTnNZyxvwh7wTu9LNhDF0HvNT0IDvgiH0XM6wiy
eiRQLjvKIRzR2IBHgdawBGeGdJS3WXXsFDhBanT6ojAnJ/mr8N5HX8lPwP6CC/Am
ykuibzW4TfaeEO/IsaixwR9XoZEsOaZG7+5MsKmb1QlUADVfZAwe3/lz8ER1QT6F
KzMWUwYvdl5F3YHPj17EBjCtIAv0sSB1tavHDVvPFE2hgp8JJjWIHdjZWCYX7/o3
OOmmEgMKHHlQ4n+AlFftiWUnprjbtg==
=7hS8
-----END PGP SIGNATURE-----

--Sig_/0DFU4xM79nqYEe4lM7o4//4--
