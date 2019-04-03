From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the net-next tree
Date: Wed, 3 Apr 2019 15:22:37 +1100
Message-ID: <20190403152237.631a0b3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s62lV97IyNeb3ffEJ54elnK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/s62lV97IyNeb3ffEJ54elnK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vhost tree got a conflict in:

  drivers/net/virtio_net.c

between commit:

  6b16f9ee89b8 ("net: move skb->xmit_more hint to softnet data")

from the net-next tree and commit:

  916faccfe56d ("virtio-net: bql support")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/virtio_net.c
index ba246fc475ae,955b3e76eb8d..000000000000
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@@ -1568,13 -1571,15 +1572,15 @@@ static netdev_tx_t start_xmit(struct sk
  	struct send_queue *sq =3D &vi->sq[qnum];
  	int err;
  	struct netdev_queue *txq =3D netdev_get_tx_queue(dev, qnum);
- 	bool kick =3D !netdev_xmit_more();
 -	bool more =3D skb->xmit_more;
++	bool more =3D netdev_xmit_more();
  	bool use_napi =3D sq->napi.weight;
+ 	unsigned int bytes =3D skb->len;
+ 	bool kick;
 =20
  	/* Free up any pending old buffers before queueing new ones. */
- 	free_old_xmit_skbs(sq, false);
+ 	free_old_xmit_skbs(sq, txq, false);
 =20
- 	if (use_napi && kick)
+ 	if (use_napi && !more)
  		virtqueue_enable_cb_delayed(sq->vq);
 =20
  	/* timestamp packet in software */

--Sig_/s62lV97IyNeb3ffEJ54elnK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlykNQ0ACgkQAVBC80lX
0GzsTQf+Pxa9z5oMKmnyw2PcfDshstSYPMe2ncWXjTfjBSFDsmUJr3w31CCmTLpm
crAnvBdX5PFTqcfQlsGoBcDG6iG9yFGxsB9jA+bSPHOQsUTPkBlG0JSz8pJO5ABj
JFv24q2sLeaQF8xcD0ercsOupZxExfov4PdlAHmoLwNRbaR1oB02S4rhCmg+oRH5
QyEjVF5cbHGGyfQEzV81pWDXrXtXlooHoDzRRgkKIjSVf2NeStwnk1fSK62j1Vtq
RSHZ/aaNujmDBH45igXJgF50PAADMkPT5wvtqGDTaqkehYqqcn6ZZbYupySiCII5
l4dWQGY6M4NYMWXkP1WCJTu/pMPOFg==
=/gvM
-----END PGP SIGNATURE-----

--Sig_/s62lV97IyNeb3ffEJ54elnK--
