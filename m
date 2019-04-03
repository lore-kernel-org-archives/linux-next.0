From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Date: Wed, 3 Apr 2019 14:56:09 +1100
Message-ID: <20190403145609.6eda97b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gxB=TXMfBxrY66HzfwAUM+9"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bo YU <tsu.yubo@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/gxB=TXMfBxrY66HzfwAUM+9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/fastrpc.c

between commit:

  01b76c32e3f3 ("misc: fastrpc: add checked value for dma_set_mask")

from the char-misc.current tree and commit:

  977e6c8d1d18 ("misc: fastrpc: use correct spinlock variant")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/fastrpc.c
index 36d0d5c9cfba,c4cc8e53243d..000000000000
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@@ -1184,7 -1314,7 +1314,8 @@@ static int fastrpc_cb_probe(struct plat
  	struct fastrpc_session_ctx *sess;
  	struct device *dev =3D &pdev->dev;
  	int i, sessions =3D 0;
 +	int rc;
+ 	unsigned long flags;
 =20
  	cctx =3D dev_get_drvdata(dev->parent);
  	if (!cctx)
@@@ -1213,12 -1343,8 +1344,12 @@@
  		}
  	}
  	cctx->sesscount++;
- 	spin_unlock(&cctx->lock);
+ 	spin_unlock_irqrestore(&cctx->lock, flags);
 -	dma_set_mask(dev, DMA_BIT_MASK(32));
 +	rc =3D dma_set_mask(dev, DMA_BIT_MASK(32));
 +	if (rc) {
 +		dev_err(dev, "32-bit DMA enable failed\n");
 +		return rc;
 +	}
 =20
  	return 0;
  }

--Sig_/gxB=TXMfBxrY66HzfwAUM+9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlykLtkACgkQAVBC80lX
0GyKbwf9ErnX9S9iWSwFKLKN1YP9PUcc+x1F8fi7P6yYSRo57abnbzak42lY2FiF
oRFJtyoScgTDcT9MAEH3krTrd+kMuH9jnxrY02tgJKvwARdnl7DSg9NgsmuT5xEC
NKf593+S0/O9Ci0EBblKs9qeoMUqa9omRD3H9i29JSkBrge5bqL8X31mECnMrrYE
Vvos26+JDiV394tFlWuYcrzPEEBSmXC8ZXC+axFWYgQ4T9o5PZzcGfO7GDkEYGqO
kMMqP1VLsYS4CC5QQQrtEYoN/L7d58iJeQHTTVBYyNmD/HtdH+uVHZ8/q2cDZYZA
UXCAjlDwy5kVIIVOOnt7s5yn/FlLag==
=iI9P
-----END PGP SIGNATURE-----

--Sig_/gxB=TXMfBxrY66HzfwAUM+9--
