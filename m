From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the netfilter tree with Linus' tree
Date: Fri, 10 May 2019 08:34:35 +1000
Message-ID: <20190510083435.68faecf5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h7S8YNgI927TIl05dJJy0b6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Brett Mastbergen <bmastbergen@untangle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/h7S8YNgI927TIl05dJJy0b6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the netfilter tree got a conflict in:

  include/uapi/linux/netfilter/nf_tables.h

between commit:

  3087c3f7c23b ("netfilter: nft_ct: Add ct id support")

from Linus' tree and commit:

  c6c9c0596c21 ("netfilter: nf_tables: remove NFT_CT_TIMEOUT")

from the netfilter tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/linux/netfilter/nf_tables.h
index f0cf7b0f4f35,92bb1e2b2425..000000000000
--- a/include/uapi/linux/netfilter/nf_tables.h
+++ b/include/uapi/linux/netfilter/nf_tables.h
@@@ -966,8 -966,6 +966,7 @@@ enum nft_socket_keys=20
   * @NFT_CT_DST_IP: conntrack layer 3 protocol destination (IPv4 address)
   * @NFT_CT_SRC_IP6: conntrack layer 3 protocol source (IPv6 address)
   * @NFT_CT_DST_IP6: conntrack layer 3 protocol destination (IPv6 address)
-  * @NFT_CT_TIMEOUT: connection tracking timeout policy assigned to conntr=
ack
 + * @NFT_CT_ID: conntrack id
   */
  enum nft_ct_keys {
  	NFT_CT_STATE,
@@@ -993,8 -991,6 +992,7 @@@
  	NFT_CT_DST_IP,
  	NFT_CT_SRC_IP6,
  	NFT_CT_DST_IP6,
- 	NFT_CT_TIMEOUT,
 +	NFT_CT_ID,
  	__NFT_CT_MAX
  };
  #define NFT_CT_MAX		(__NFT_CT_MAX - 1)

--Sig_/h7S8YNgI927TIl05dJJy0b6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzUqvsACgkQAVBC80lX
0GxnZAf/SdTlpbKzDuxhI5RBK2yQNcTv6GgKfwVURQRdDOIjqr4jpzkRcd3zbVCh
mFX+mAR1xmJ13MeSZ1Cis7o58GfkZuNV/i3GxKl4l7GSEtU6gAscrqqXnZ66wdd/
oAlNyJLpmIpsL/rs9E5MWK/ZavrsYU4eQLLzqZvO63wx8zTYlhvyVpr3IF2pCyjb
wUZgxUz4i1blraY756ULGw1G/vWHbWmbZEVbTubXzugYgqTfZqi1xSA3BjYM6Hvs
yRRj1AZ4qOlhzyFe2UwUHXWJv+TgECO9iBpELW7IsUOsNqJaAZnQZ6WH5WxF9IwC
FD/5SCnPAXGFHY6/CQf4Fu9wwdjuPA==
=sJiz
-----END PGP SIGNATURE-----

--Sig_/h7S8YNgI927TIl05dJJy0b6--
