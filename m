From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the fbdev tree
Date: Fri, 29 Jun 2018 11:07:44 +1000
Message-ID: <20180629110744.29b54355@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0016655611=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0016655611==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/FzGKjTKmCinIQZX16HKmEJ."; protocol="application/pgp-signature"

--Sig_/FzGKjTKmCinIQZX16HKmEJ.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartlomiej,

After merging the fbdev tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "dummycon_unregister_output_notifier" [drivers/video/fbdev/core/fb.k=
o] undefined!
ERROR: "dummycon_register_output_notifier" [drivers/video/fbdev/core/fb.ko]=
 undefined!

Caused by commit

  83d83bebf401 ("console/fbcon: Add support for deferred console takeover")

I have reverted that commit for today.

I note that this commit is in the drm-misc tree as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/FzGKjTKmCinIQZX16HKmEJ.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1hmAACgkQAVBC80lX
0GyypQgAhNAhIQAYmTGEs5+Y0H5vz92mBk4+b4wnXWPFCV5oyDw1SVxC9ampJ5br
WjFViE7jAmVP86DQ05J4vX88tZHTQEAXMOwJOKwFFTZxQ5+dxOihuy8jd62YiU5W
OWayRsQJVovr4fGByVf6Chas9zrB6lL5yQphE57IO8DEReg22YE5vH4d7vwB/q9x
4tq7mAR8wQR+5gjPJNlOYWWZN6kObAIWHTxH7jEz/Oe+KM8ARLiyK0QYw8Do1ZqH
2woQdmJfFzT9gR1xBH3nD42l5HelE4vt37/kvI+bp1rBkCnTGVUSTJeQ5Bct2Pib
3z67UldMvPG6N0dclvu3/+mJUVnv+g==
=mzU9
-----END PGP SIGNATURE-----

--Sig_/FzGKjTKmCinIQZX16HKmEJ.--

--===============0016655611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0016655611==--
