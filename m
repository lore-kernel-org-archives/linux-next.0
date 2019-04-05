From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the
 drm-misc tree
Date: Fri, 5 Apr 2019 17:03:49 +1100
Message-ID: <20190405170349.687cd08c@canb.auug.org.au>
References: <20190405155550.5648e84e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0505758065=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190405155550.5648e84e@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
List-Id: linux-next.vger.kernel.org

--===============0505758065==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B_7E1h8ne1BDtkR9dSqkofC"; protocol="application/pgp-signature"

--Sig_/B_7E1h8ne1BDtkR9dSqkofC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 5 Apr 2019 15:55:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> kernel/dma/contiguous.c:19:10: fatal error: asm/dma-contiguous.h: No such=
 file or directory
>  #include <asm/dma-contiguous.h>
>           ^~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   4f2a8f5898ec ("drm: Add ASPEED GFX driver")
>=20
> I have disabled that driver for today (by making it depend on BROKEN).

I noticed that this is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B_7E1h8ne1BDtkR9dSqkofC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlym78UACgkQAVBC80lX
0GwNTQgAnYfBPX73VFrHb2Z6GE/xGiXWT4e9EEWJmt8vk0UqXKDDh723AXzGaFwa
crVoEsk0odWA1RHMt1GIYPs56CjTO066IDNAgp7QvJmtHJ58PpCHSJGzDRZdq9Mu
TVyRQ591Ti4xCerOkGSvNyxiwyyK2vy6DI8VGJ4q1jeX+UykQpBWy6hwgAFCEuoh
SolLEEuWKps1ZP21w3CgnU8ol0MEGUHXEbjj/Xb1Llf2Z0xXg/U7zpSOI349ODAq
9KJIfTEO3F/MJmQLpdTQ7YyZ0hBHwEm9evWHNIY6i8D+wSteQ+Efx7ZNtgbam+fd
Bu+7MsJkr/N4CPz4S+0ofhhPadDmDg==
=dPAB
-----END PGP SIGNATURE-----

--Sig_/B_7E1h8ne1BDtkR9dSqkofC--

--===============0505758065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0505758065==--
