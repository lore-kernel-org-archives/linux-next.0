From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-intel-fixes tree
Date: Tue, 9 Jun 2015 11:58:09 +1000
Message-ID: <20150609115809.56917afe@canb.auug.org.au>
References: <20150605054634.E4FA3140218@ozlabs.org> <87sia6a8fr.fsf@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0120270813=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <87sia6a8fr.fsf@intel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: mpe@ellerman.id.au, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

--===============0120270813==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A76WKio4sjBkk3aeupmdM6B"; protocol="application/pgp-signature"

--Sig_/A76WKio4sjBkk3aeupmdM6B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 05 Jun 2015 11:03:20 +0300 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> On Fri, 05 Jun 2015, "mpe@ellerman.id.au" <michael@ozlabs.org> wrote:
> > Hi Dave,
> >
> > Today's linux-next merge of the drm tree got a conflict in
> > drivers/gpu/drm/i915/intel_ringbuffer.c between commit 4f47c99a9be7 ("d=
rm/i915:
> > Move WaBarrierPerformanceFixDisable:skl to skl code from chv code") fro=
m the
> > drm-intel-fixes tree and commit b62adbd1ea1f ("drm/i915/bxt: Move
> > WaForceEnableNonCoherent to Skylake only") from the drm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
>=20
> Our tree seems to have the if blocks the other way round. I don't think
> it matters, but Ville, Damien, chime in if you think it does.

I have switched them around today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/A76WKio4sjBkk3aeupmdM6B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVdkg2AAoJEMDTa8Ir7ZwVZmUP/0OpvU/1pLSEigNrfzSUdDEG
E6I/Vh050q6vS1hyV/liEPQrnHqfqfHzXfcAp+TjOQTvKNT69OHpz57NG64SgiT3
EUhnMNIEBl9cBbuinklzcXaslA6fCZJzY/b6mm5U5SlKuurc/y3ClvI4Am2tIFzh
Wp6FVfzaLzo31UsQIDYbgYUGrCCUYSaUFRNImVxcS4hM/YTeSJtmRBEZcdKcWIdR
b3O24SL/yylvZQCQloaL45dLkFdMdqGSDGrYWZqfeBhJVfhx3+JuboSmdxj4eiRd
IOCL7RY6Ak4IToyvD+MMX0ZeveB9Pqu+Ds7RHiM1OOOoovTpLvkZezCD3BXPA3ns
Dt0IQ2nKsGLpmzXF/sPUBANQYsTxME6UOJ/zrRDWApYquratiJGx1C6j+pQDe95r
USbubwZFWD6P5mqfOcBwib7OxvO4Ou8pzCvu8Wsku/JBFj0OEF766plOV2bXN9w1
3PcaYf/cwhxES6daFXIih1DRS67Rrpcxtyx2P3KX1Q+DiZkjREsjJfWNSNULFy87
M4CYH5ZaTbBLDHNR1xeeGifWh27QWrCHlq8PvTClUO92SuiZ9Is5ufq4WtuHilKp
zrhp1uf1mGiolzRAeE0x0SskgqOSJA+96zkwkjnN5RsbNhw3vxEggMPs56gqCJjw
YP08XDKoGhtufShNZwBA
=yNpN
-----END PGP SIGNATURE-----

--Sig_/A76WKio4sjBkk3aeupmdM6B--

--===============0120270813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0120270813==--
