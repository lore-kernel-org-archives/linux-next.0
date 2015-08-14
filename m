From: Thierry Reding <treding@nvidia.com>
Subject: Re: linux-next: build warnings after merge of the
	drm-misc tree
Date: Fri, 14 Aug 2015 14:51:20 +0200
Message-ID: <20150814125119.GC22537@ulmo.nvidia.com>
References: <20150814153532.78cd6e88@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1512942750=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20150814153532.78cd6e88@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

--===============1512942750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kXdP64Ggrk/fb43R"
Content-Disposition: inline

--kXdP64Ggrk/fb43R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2015 at 03:35:32PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
>=20
> drivers/gpu/drm/exynos/exynos_drm_drv.c:290:2: warning: initialization fr=
om incompatible pointer type
>   .get_vblank_counter =3D drm_vblank_count,
>   ^
> drivers/gpu/drm/exynos/exynos_drm_drv.c:290:2: warning: (near initializat=
ion for 'exynos_drm_driver.get_vblank_counter')
> drivers/gpu/drm/rcar-du/rcar_du_drv.c:262:2: warning: initialization from=
 incompatible pointer type
>   .get_vblank_counter =3D drm_vblank_count,
>   ^
> drivers/gpu/drm/rcar-du/rcar_du_drv.c:262:2: warning: (near initializatio=
n for 'rcar_du_driver.get_vblank_counter')
> drivers/gpu/drm/msm/msm_drv.c:981:2: warning: initialization from incompa=
tible pointer type
>   .get_vblank_counter =3D drm_vblank_count,
>   ^
> drivers/gpu/drm/msm/msm_drv.c:981:2: warning: (near initialization for 'm=
sm_driver.get_vblank_counter')
>=20
> Introduced by commit
>=20
>   b90180b057f7 ("drm/irq: More pipe/crtc consistency cleanups")

Yes, that patch turned out to be incomplete. Daniel suggested to remove
it from drm-misc for now and I'll address this fully in a larger patch
for 4.4.

Thierry

--kXdP64Ggrk/fb43R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVzeREAAoJEN0jrNd/PrOhubwP/3xXjvj2Nn6KYt+uT7kBqqjl
Aoci1Dee6Be4rv3RMhbVVUlM+Fpsu2TA7nHcTAaLP8YmlBBHRtGeJMdmXlU2VHEj
FEW90+BHbl+yMAfBBd/q1hUSllc8N6ZbEiw2dKuHJxZar4I85/UZymJmJBH8v02F
X8eJRCtn/xFnFwDT1Gm3znAlxswiP/uyueauW1AU/m3SC2vwVu7XtudKsWR0RzfY
NeYNqvgSyJXRiQu+IeCdipMtBPxfR+xN5bv5qlHTjcYC8ExoA15kZob5Od5M1z2U
oksJcrlWVnFyOILI4GonQo+EzhPPrBb+u4ZzSOJpcBrVOpCycWXzAPklChwAfdWU
L9rGghlFneGCF7WZO40B/qW35gHZaMXx5E+cqeKxiaXtlInwDTTSr5v0xhuMoggX
D1R/g26oybnYCR0Mr8Fj0baVHmiEQNImufOqiipPtupwRaYFM+/k4Er7PjtsqUDP
UjY+A7kEhDeUb15EMX0LsIiRTIGDZ8NpMBu6AN4NUR2e+Lnj0qUdpKH6zLzzlrjf
rgmBkUPl4hY+1ugBZgzZw2X3jfsCEuOBnHae6VnFGYhZ6DTKy97kUU2eaXtBnZJr
Gj8mgWNjErQyrTpbScez9Ppn7FNkFexZ2QcmJUkzUMYLp0AsxfcLU7AyJeVPVbSB
8hU5LFsP7E7hK0X91alP
=Giak
-----END PGP SIGNATURE-----

--kXdP64Ggrk/fb43R--

--===============1512942750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZngK

--===============1512942750==--
