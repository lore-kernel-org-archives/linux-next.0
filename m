From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: linux-next: build failure after merge of the sunxi tree
Date: Tue, 7 Mar 2017 22:39:40 +0100
Message-ID: <20170307213940.kcaedlhiua2r4lsq@lukather>
References: <20170307111019.246a9629@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1619843704=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170307111019.246a9629@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, linux-kernel@vger.kernel.org, DRI <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


--===============1619843704==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mcnsnp2mrug3tjf6"
Content-Disposition: inline


--mcnsnp2mrug3tjf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen, Daniel,

On Tue, Mar 07, 2017 at 11:10:19AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the sunxi tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/gpu/drm/sun4i/sun4i_crtc.c: In function 'sun4i_crtc_enable_vblank=
':
> drivers/gpu/drm/sun4i/sun4i_crtc.c:109:31: error: 'struct sun4i_crtc' has=
 no member named 'drv'
>   struct sun4i_drv *drv =3D scrtc->drv;
>                                ^
> drivers/gpu/drm/sun4i/sun4i_crtc.c: In function 'sun4i_crtc_disable_vblan=
k':
> drivers/gpu/drm/sun4i/sun4i_crtc.c:121:31: error: 'struct sun4i_crtc' has=
 no member named 'drv'
>   struct sun4i_drv *drv =3D scrtc->drv;
>                                ^
>=20
> Caused by commit
>=20
>   50480a78e282 ("drm: sun4i: use vblank hooks in struct drm_crtc_funcs")
>=20
> from the drm-misc tree interacting with commit
>=20
>   1b8d109585df ("drm/sun4i: Add backend and tcon pointers to sun4i_crtc")
>=20
> from the sunxi tree.

I just rebased my tree on top of the latest drm-misc tag
(drm-misc-next-2017-03-06). It should compile, and not have merge
conflicts anymore.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mcnsnp2mrug3tjf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYvyiXAAoJEBx+YmzsjxAggsYP/2NolUXsvMvhbEO/7Bnn9/cj
gBQAzqpAhVWM0aIeebvq/Jvd9nY/YEBmsIrmvpVtXwyBGiZ/Ucsqe1JgYAw54qdF
mMbXFooh4S5NiPSAKJeH8uacN+QefM3doSoQuTrQFKEdMB1Wial75D0ZTzJEcQT1
UiKUFcDjt5LOO43uYiWNDHBN1xW6CUBpspO394jrN18GYi3LUhB689OUCEAre27j
yqonYutzVQSVeY/tX3W2X9j9pW04xqVE1tL0I/KLopnhjJ+I1lT6IRi1rxWZ8Edq
0lpgA52MNB2fqhVCBiLuku75P1ACOIn4oN3+lEbngQ4xjA69CBNDSzXyWeKdCNW1
FTXp5Ct/lmfI96IGHvRyiFtfSDTqZ7SzzUpFYtzTkh9jF6qxI1+eH5HoE48aKFfK
vouhC8B58CzaL4JfGtrKNVAQyYAkMpkqQhV1AQkRTHY/S6yzGABB+aOvNdwLd7eb
4GqPUWYUR87RAAmNTsb7l0w0YBa9F0Gseu+s3UkdSRMZ66rtteGLjzqzf75i2LxW
00T7+mjzISBwLMOVkQkeWJ0d/BMWmOYIfkhX8uKgGAnq7WjDRt/fgSK+hkJ47J1Z
MgRp9Ta3PpcUx8d4bmqqwkB5gjeFJZinNj3POOa5f7Bnz2gmQcp7Vmq8aftq+3Ai
XlpXNxc3CWM2+9B4h0JG
=eusP
-----END PGP SIGNATURE-----

--mcnsnp2mrug3tjf6--

--===============1619843704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1619843704==--
