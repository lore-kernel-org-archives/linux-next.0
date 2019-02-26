From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with Linus' tree
Date: Tue, 26 Feb 2019 15:24:17 +1100
Message-ID: <20190226152417.29e1f3ed@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/or3Yj8eI6cD4fmdn5sj9.mo"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandru Ardelean <alexandru.ardelean@analog.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/or3Yj8eI6cD4fmdn5sj9.mo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

Today's linux-next merge of the slave-dma tree got a conflict in:

  drivers/dma/dmatest.c

between commit:

  6454368a804c ("dmaengine: dmatest: Abort test in case of mapping error")

from Linus' tree and commit:

  361deb7243d2 ("dmaengine: dmatest: wrap src & dst data into a struct")

from the slave-dma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/dmatest.c
index 6511928b4cdf,50221d467d86..000000000000
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@@ -708,12 -726,14 +726,12 @@@ static int dmatest_func(void *data
 =20
  			um->addr[i] =3D dma_map_page(dev->dev, pg, pg_off,
  						   um->len, DMA_TO_DEVICE);
- 			srcs[i] =3D um->addr[i] + src_off;
+ 			srcs[i] =3D um->addr[i] + src->off;
  			ret =3D dma_mapping_error(dev->dev, um->addr[i]);
  			if (ret) {
 -				dmaengine_unmap_put(um);
  				result("src mapping error", total_tests,
- 				       src_off, dst_off, len, ret);
+ 				       src->off, dst->off, len, ret);
 -				failed_tests++;
 -				continue;
 +				goto error_unmap_continue;
  			}
  			um->to_cnt++;
  		}
@@@ -728,9 -748,11 +746,9 @@@
  					       DMA_BIDIRECTIONAL);
  			ret =3D dma_mapping_error(dev->dev, dsts[i]);
  			if (ret) {
 -				dmaengine_unmap_put(um);
  				result("dst mapping error", total_tests,
- 				       src_off, dst_off, len, ret);
+ 				       src->off, dst->off, len, ret);
 -				failed_tests++;
 -				continue;
 +				goto error_unmap_continue;
  			}
  			um->bidi_cnt++;
  		}
@@@ -758,10 -780,12 +776,10 @@@
  		}
 =20
  		if (!tx) {
- 			result("prep error", total_tests, src_off,
- 			       dst_off, len, ret);
 -			dmaengine_unmap_put(um);
+ 			result("prep error", total_tests, src->off,
+ 			       dst->off, len, ret);
  			msleep(100);
 -			failed_tests++;
 -			continue;
 +			goto error_unmap_continue;
  		}
 =20
  		done->done =3D false;
@@@ -770,10 -794,12 +788,10 @@@
  		cookie =3D tx->tx_submit(tx);
 =20
  		if (dma_submit_error(cookie)) {
- 			result("submit error", total_tests, src_off,
- 			       dst_off, len, ret);
 -			dmaengine_unmap_put(um);
+ 			result("submit error", total_tests, src->off,
+ 			       dst->off, len, ret);
  			msleep(100);
 -			failed_tests++;
 -			continue;
 +			goto error_unmap_continue;
  		}
  		dma_async_issue_pending(chan);
 =20
@@@ -782,23 -808,25 +800,23 @@@
 =20
  		status =3D dma_async_is_tx_complete(chan, cookie, NULL, NULL);
 =20
 -		dmaengine_unmap_put(um);
 -
  		if (!done->done) {
- 			result("test timed out", total_tests, src_off, dst_off,
+ 			result("test timed out", total_tests, src->off, dst->off,
  			       len, 0);
 -			failed_tests++;
 -			continue;
 +			goto error_unmap_continue;
  		} else if (status !=3D DMA_COMPLETE) {
  			result(status =3D=3D DMA_ERROR ?
  			       "completion error status" :
- 			       "completion busy status", total_tests, src_off,
- 			       dst_off, len, ret);
+ 			       "completion busy status", total_tests, src->off,
+ 			       dst->off, len, ret);
 -			failed_tests++;
 -			continue;
 +			goto error_unmap_continue;
  		}
 =20
 +		dmaengine_unmap_put(um);
 +
  		if (params->noverify) {
- 			verbose_result("test passed", total_tests, src_off,
- 				       dst_off, len, 0);
+ 			verbose_result("test passed", total_tests, src->off,
+ 				       dst->off, len, 0);
  			continue;
  		}
 =20
@@@ -833,15 -861,9 +851,15 @@@
  			       len, error_count);
  			failed_tests++;
  		} else {
- 			verbose_result("test passed", total_tests, src_off,
- 				       dst_off, len, 0);
+ 			verbose_result("test passed", total_tests, src->off,
+ 				       dst->off, len, 0);
  		}
 +
 +		continue;
 +
 +error_unmap_continue:
 +		dmaengine_unmap_put(um);
 +		failed_tests++;
  	}
  	ktime =3D ktime_sub(ktime_get(), ktime);
  	ktime =3D ktime_sub(ktime, comparetime);

--Sig_/or3Yj8eI6cD4fmdn5sj9.mo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx0v3EACgkQAVBC80lX
0GzuVAf9HZmOLMLMwBBosxqdXQaqZ8obSDn4PUDPv7MebxfSJVVXSmrVCLAosFcJ
iasZTl5C9Ul7uPU7Zrt7ndbZsfnuLgHGhEywyQMSPvOW0xiknUoVGVReoZxtgUSN
oxwy7Tl26WhqjfR6Ph6rERoAXhh2EL7EghGxMHbkZ8fZLBWUm1Rav6G8olFzxJ4u
yA+hNVwht+AtdMZzg4ZPb4MKtw631qFa8opNyA4wx46bEY5cCkrY9o6SRoT6X0kN
sWdLAO+4zkHxLq9Ci7caAm50LCLBUeJx1LElUbHpTvdvuXuJm5vNbQgAj4S5ayUh
cy+gK5cWMy8m/hz3HldJULtZeONjpQ==
=vDkp
-----END PGP SIGNATURE-----

--Sig_/or3Yj8eI6cD4fmdn5sj9.mo--
