From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the
	drm tree
Date: Wed, 3 Dec 2014 13:43:55 +1100
Message-ID: <20141203134355.6fd6e3b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0199166309=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Stefan =?UTF-8?B?QnLDvG5z?= <stefan.bruens@rwth-aachen.de>
List-Id: linux-next.vger.kernel.org

--===============0199166309==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/F=8_IrDOUM3Z1zR1I3d/u0Y"; protocol="application/pgp-signature"

--Sig_/F=8_IrDOUM3Z1zR1I3d/u0Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in
drivers/gpu/drm/drm_edid.c between commit 18df89fef2d5 ("drm: Decouple
EDID parsing from I2C adapter") from the drm tree and commit
d6885d659037 ("drm/edid: move drm_edid_is_zero to top, make edid
argument const") from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/drm_edid.c
index a7b5a71856a7,2c1d2e49fb6f..000000000000
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@@ -1176,34 -1196,8 +1196,26 @@@ drm_do_probe_ddc_edid(void *data, u8 *b
  	return ret =3D=3D xfers ? 0 : -1;
  }
 =20
- static bool drm_edid_is_zero(u8 *in_edid, int length)
- {
- 	if (memchr_inv(in_edid, 0, length))
- 		return false;
-=20
- 	return true;
- }
-=20
 -static u8 *
 -drm_do_get_edid(struct drm_connector *connector, struct i2c_adapter *adap=
ter)
 +/**
 + * drm_do_get_edid - get EDID data using a custom EDID block read function
 + * @connector: connector we're probing
 + * @get_edid_block: EDID block read function
 + * @data: private data passed to the block read function
 + *
 + * When the I2C adapter connected to the DDC bus is hidden behind a devic=
e that
 + * exposes a different interface to read EDID blocks this function can be=
 used
 + * to get EDID data using a custom block read function.
 + *
 + * As in the general case the DDC bus is accessible by the kernel at the =
I2C
 + * level, drivers must make all reasonable efforts to expose it as an I2C
 + * adapter and use drm_get_edid() instead of abusing this function.
 + *
 + * Return: Pointer to valid EDID or NULL if we couldn't find any.
 + */
 +struct edid *drm_do_get_edid(struct drm_connector *connector,
 +	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
 +			      size_t len),
 +	void *data)
  {
  	int i, j =3D 0, valid_extensions =3D 0;
  	u8 *block, *new;

--Sig_/F=8_IrDOUM3Z1zR1I3d/u0Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUfnjwAAoJEMDTa8Ir7ZwV5J0P/3mpPLenieHjgY4UWyO1tuIV
XhA3RVLqui0w/B81+oAVE0NS/MJTVURqQ36gHu1WWy7XCYU9BaKb8ZWOdqlWrUkR
ooA5waoe78LHb7e2gq4XFaSMh0qnx2W5O7+YRt3fluKMkxa+GgAXuiWnnZ+bg0Bm
gvxUI4hEX4cSXGLl3MwriYLlURG5vCwKyxl+7Q8b7/Eyy4stmWUw28WtuqN6b8yJ
TzfoUBw6u5ZZGsY+56IxrhIaxWD/u7viCCOPa64iPohHloAVUhnmBlgWgujJKHJ8
3aLFSD04+rA+1hCeAOJZslPayjgxjdGlJOAHz23iy1RiksZZwZeCLH9sevhhvIzF
7n61TwnE9FUDIY1XZ2anQV5lGvYHNj3JRcga4SxGZJ9Nc6+NSNpynr/16giXfVq0
4ZqhNoaoufpKUCf0P+npgEsqEM5P2Stxbugiik715ByA3Btn4HuGad04bPrBnjqL
ZK69+RaApA4rZ2Fvj3UD7T+PT6NUIN7gl+WlxZwfi4MZZGZToorIN7SkGFFq7the
ub4xrM7HaYkz2HTMMqnestXUJ8HLJvQnwGXi0LAmSmaoj9VEsQCl7pDn7WoUym+F
c+QrdW+/r16h8SZ8UEleMo67cmMHP8XuPuTtYuXVTSQbQyEtiwPg3wffPVU6RlPY
dHUtJSxXlItt+/r36tYk
=3t23
-----END PGP SIGNATURE-----

--Sig_/F=8_IrDOUM3Z1zR1I3d/u0Y--

--===============0199166309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK

--===============0199166309==--
