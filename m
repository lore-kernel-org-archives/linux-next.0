From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the drm-intel tree
Date: Mon, 8 Jul 2013 14:31:33 +1000
Message-ID: <20130708143133.c4529d22bf65c9a2742c2b22@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2018902725=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, Xiong Zhang <xiong.y.zhang@intel.com>
List-Id: linux-next.vger.kernel.org

--===============2018902725==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__8_Jul_2013_14_31_33_+1000_K7kqIWKd9cCIcwx0"

--Signature=_Mon__8_Jul_2013_14_31_33_+1000_K7kqIWKd9cCIcwx0
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
drivers/gpu/drm/i915/i915_gem.c between commit 857d0a9a6e9e ("drm/i915:
Correct obj->mm_list link to dev_priv->dev_priv->mm.inactive_list") from
the drm-intel tree and commit
"drivers-convert-shrinkers-to-new-count-scan-api-fix" from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_gem.c
index 8e57029,e743c27..0000000
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@@ -4605,13 -4605,13 +4605,13 @@@ i915_gem_inactive_count(struct shrinke
  		unlock =3D false;
  	}
 =20
- 	cnt =3D 0;
+ 	count =3D 0;
  	list_for_each_entry(obj, &dev_priv->mm.unbound_list, global_list)
  		if (obj->pages_pin_count =3D=3D 0)
- 			cnt +=3D obj->base.size >> PAGE_SHIFT;
+ 			count +=3D obj->base.size >> PAGE_SHIFT;
 -	list_for_each_entry(obj, &dev_priv->mm.inactive_list, global_list)
 +	list_for_each_entry(obj, &dev_priv->mm.inactive_list, mm_list)
  		if (obj->pin_count =3D=3D 0 && obj->pages_pin_count =3D=3D 0)
- 			cnt +=3D obj->base.size >> PAGE_SHIFT;
+ 			count +=3D obj->base.size >> PAGE_SHIFT;
 =20
  	if (unlock)
  		mutex_unlock(&dev->struct_mutex);

--Signature=_Mon__8_Jul_2013_14_31_33_+1000_K7kqIWKd9cCIcwx0
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJR2kClAAoJEECxmPOUX5FEgT8P/A2BucaIYsWGLHfUk3zwoHg6
2ehFvbV/nruM3OeP+HdnhkG874qNzfwmwfDBNAursYVPH8KBKATtbhpFdZLzsLyx
sxdJ/yQI9pEJEpaRTGOPLf/ITk2f4J/j2t+31f5ctJ5ZQkOfTevOU2fyQ+OQ3W4b
PgZhTfoS9Q97V9LVxCIL9HKPIOJl5Id5NiLeH5wZGKTIGUE2IPdDGz2BM0zdRpgn
ULePV06Z7XYPOTSKFZkjaS1hnUMDWYp1iXQIDh8W2x9bFgn3KTFe4jvcC/dC87eO
AZfBEZxt2w3jUiV+ZnEU5lwjyodgstLExnnLmpvllJyQH90Y3B3ATHKAU5hfbULE
GEfYHkXiBLGBH5ZDcmmat044a0PKvDoJUGCCO20B0nhcv9IiTSnlPb3sRtLTZl5S
9PBz2Em9JRx4Zwt7UPLgM31528lBv+mTlzRFrUhtbXNpVJXwNf8FXd/ZHJ1vw3Sm
i/Z7ejPrYVXB6HLOsIyt8drZlGzPms+meSW359M5LCKxicfoZ0p3dnTyy8qIxP7m
BxUcLtZy/4d8qj7v3r3Ass4DwtM00EnKFhlb1y7p3GkD9LAXf+F9uuAq1sUeEDov
2vlZ791IAfy4RNsik/TcthD6FXrJwQcamIzEl7Ke57alVKnpv2n4wXnlSKW7sSCf
5oqzI9tX1vDKm2Zw3Fqd
=D82Q
-----END PGP SIGNATURE-----

--Signature=_Mon__8_Jul_2013_14_31_33_+1000_K7kqIWKd9cCIcwx0--

--===============2018902725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2018902725==--
