From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 9 Apr 2019 16:08:49 +1000
Message-ID: <20190409160849.391d3efa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1372858606=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
List-Id: linux-next.vger.kernel.org

--===============1372858606==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DWKl6TYJOO3DDbnDEbr3Usa"; protocol="application/pgp-signature"

--Sig_/DWKl6TYJOO3DDbnDEbr3Usa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/gpu/drm/cirrus/cirrus.c: In function 'cirrus_fb_blit_rect':
drivers/gpu/drm/cirrus/cirrus.c:310:25: error: implicit declaration of func=
tion '__io_virt'; did you mean '__do_irq'? [-Werror=3Dimplicit-function-dec=
laration]
   drm_fb_memcpy_dstclip(__io_virt(cirrus->vram),
                         ^~~~~~~~~
                         __do_irq
drivers/gpu/drm/cirrus/cirrus.c:310:25: warning: passing argument 1 of 'drm=
_fb_memcpy_dstclip' makes pointer from integer without a cast [-Wint-conver=
sion]
   drm_fb_memcpy_dstclip(__io_virt(cirrus->vram),
                         ^~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/cirrus/cirrus.c:33:
include/drm/drm_format_helper.h:18:34: note: expected 'void *' but argument=
 is of type 'int'
 void drm_fb_memcpy_dstclip(void *dst, void *vaddr, struct drm_framebuffer =
*fb,
                            ~~~~~~^~~
drivers/gpu/drm/cirrus/cirrus.c:314:37: warning: passing argument 1 of 'drm=
_fb_xrgb8888_to_rgb565_dstclip' makes pointer from integer without a cast [=
-Wint-conversion]
   drm_fb_xrgb8888_to_rgb565_dstclip(__io_virt(cirrus->vram),
                                     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/cirrus/cirrus.c:33:
include/drm/drm_format_helper.h:25:46: note: expected 'void *' but argument=
 is of type 'int'
 void drm_fb_xrgb8888_to_rgb565_dstclip(void *dst, unsigned int dst_pitch,
                                        ~~~~~~^~~
drivers/gpu/drm/cirrus/cirrus.c:319:37: warning: passing argument 1 of 'drm=
_fb_xrgb8888_to_rgb888_dstclip' makes pointer from integer without a cast [=
-Wint-conversion]
   drm_fb_xrgb8888_to_rgb888_dstclip(__io_virt(cirrus->vram),
                                     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/cirrus/cirrus.c:33:
include/drm/drm_format_helper.h:28:46: note: expected 'void *' but argument=
 is of type 'int'
 void drm_fb_xrgb8888_to_rgb888_dstclip(void *dst, unsigned int dst_pitch,
                                        ~~~~~~^~~

Caused by commit

  ab3e023b1b4c ("drm/cirrus: rewrite and modernize driver.")

I have marked that driver BROKEN for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DWKl6TYJOO3DDbnDEbr3Usa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlysNvEACgkQAVBC80lX
0GxmWwf/VoRfLiEXUWEl7T/H4C6lWqLfx1fxGJLssggwzz8Pn3eXiGQ8g5Gtys6R
NKjvb9r6IpmHbk/6FXiuE4kU8Qile9cRp0pu5U6NMxnM4eV5d5tG1q5mroDvDr3/
WtG38VgiF9KmiMShsZfjhMxBxmBOccmCazmcnbieMA9rj/xdTOJFrbT4XSO5Yaks
lrRSf8CnH54/TPIvW8lt2r6kZBMNiMdJ7aaxjf7PYI2pxAS7mLaOFqtSZ2AT4pc3
E2woWMwUBsj9IPLea2zzMDJWI5BADD6v7xfJrlKS7NIW8T/jQOXEm2l4+D2RIV1H
kzjXDIanTnHSTIA3Svcj7Zkvy6+3Aw==
=G9CV
-----END PGP SIGNATURE-----

--Sig_/DWKl6TYJOO3DDbnDEbr3Usa--

--===============1372858606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1372858606==--
