From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Tue, 9 Apr 2019 11:34:10 +1000
Message-ID: <20190409113410.3d2a8afc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2134623265=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: linux-next.vger.kernel.org

--===============2134623265==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TrW1RSpeAuZFW0sWw8mGVis"; protocol="application/pgp-signature"

--Sig_/TrW1RSpeAuZFW0sWw8mGVis
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/cirrus/cirrus_drv.h
  drivers/gpu/drm/cirrus/cirrus_ttm.c

between commits:

  aa8e2435b3d4 ("drm/ttm: Define a single DRM_FILE_PAGE_OFFSET constant")
  7d1500f9fbfc ("drm/ttm: Remove file_page_offset parameter from ttm_bo_dev=
ice_init()")
  bed2dd84212e ("drm/ttm: Quick-test mmap offset in ttm_bo_mmap()")

from the drm tree and commit:

  ab3e023b1b4c ("drm/cirrus: rewrite and modernize driver.")

from the drm-misc tree.

I fixed it up (I just removed the files) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/TrW1RSpeAuZFW0sWw8mGVis
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyr9pIACgkQAVBC80lX
0Gx8OAf+P9Ywia+FIV6m/bOqBgRyK5oUg4qTRQW89r0wv8sOHU1ThW1w7ZDn5CJx
WvhZNV4K7nzvt3RIzR0dJBDO4dF5KeK384AZI3KwNQlWhPXB8I+pnH0d6g8i/PlY
af9JaTvJ2nopcQ8zc/6TqkUcIMMb6GDgHeta7PfbZok3UaaSy0x/wGTWZR4UBSZh
2mFZ8o7dtiYGBHR0uUFlVl5/C2HQvti6Unsosk/IaEZ5r5CMJ2Wq7hGsb9cd9PBd
7/ym6BzYSTgb1nqR6rFJSGQ0zyUlUIi6kZVym9MS2xbfkmjPEJr/1DkEC1oQL3/U
oaebP3oVAdSiYj6lGEdNc3Xxzoymqg==
=iCRq
-----END PGP SIGNATURE-----

--Sig_/TrW1RSpeAuZFW0sWw8mGVis--

--===============2134623265==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2134623265==--
