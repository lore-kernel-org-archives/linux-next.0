From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the etnaviv tree with the drm-misc tree
Date: Mon, 26 Nov 2018 13:58:06 +1100
Message-ID: <20181126135806.22f4ce78@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AwU8QGKYH6YqgLMvrOcdeEz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Fernando Ramos <greenfoo@gluegarage.com>, Linus Walleij <linus.walleij@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>
List-Id: linux-next.vger.kernel.org

--Sig_/AwU8QGKYH6YqgLMvrOcdeEz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

Today's linux-next merge of the etnaviv tree got a conflict in:

  drivers/gpu/drm/etnaviv/etnaviv_drv.c

between commit:

  808bad32ea42 ("drm: replace "drm_dev_unref" function with "drm_dev_put"")

from the drm-misc tree and commit:

  99e294492ef9 ("drm/etnaviv: Replace drm_dev_unref with drm_dev_put")

from the etnaviv tree.

I fixed it up (I used the latter which also renamed a label
appropriatedly) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/AwU8QGKYH6YqgLMvrOcdeEz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7YT4ACgkQAVBC80lX
0GxNVQgAln0putbeCP7FR646d1MrjqPMR88/dTMrBbu6gRrRVDwLucOfAlHi00U2
xjvwP/VXuL7qI9Xr4erdSTohXKjQIZXY8rG8qeEqM2AR0O6M8jYMllUW130H0Gyr
tJ0F3N3JWKQBLZ87NAOYxGEys83WDzhbN+oGeN8UviDc+hFItlOu69uZedbvMxte
3ZmApoWDEp9HWVdQLHXkcJgrEKnZZOMKUvFuP8Xu5+uPEm35h2BJCJQ6gMGfmx3m
25BPa0AXhppySVksPLTRB+BBXLcrffjljbiQLvW2s6WHcDIADHb4G2Q0nAfL7eU2
vNBjUrjkhlLpBkGIYlr92Y9B9XemBw==
=4Ent
-----END PGP SIGNATURE-----

--Sig_/AwU8QGKYH6YqgLMvrOcdeEz--
