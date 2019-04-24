From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm tree
Date: Wed, 24 Apr 2019 11:12:59 +1000
Message-ID: <20190424111259.6a1aacce@canb.auug.org.au>
References: <20190424102219.48cfdfe2@canb.auug.org.au>
 <44707352378dcd414b476ec5420db23093fb9351.camel@vmware.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0634015868=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <44707352378dcd414b476ec5420db23093fb9351.camel@vmware.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Deepak Singh Rawat <drawat@vmware.com>
Cc: "airlied@linux.ie" <airlied@linux.ie>, Thomas Hellstrom <thellstrom@vmware.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

--===============0634015868==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6b1gFu/lYiX1QCar6=F2ByB"; protocol="application/pgp-signature"

--Sig_/6b1gFu/lYiX1QCar6=F2ByB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

On Wed, 24 Apr 2019 00:36:19 +0000 Deepak Singh Rawat <drawat@vmware.com> w=
rote:
>
> On Wed, 2019-04-24 at 10:22 +1000, Stephen Rothwell wrote:
> >=20
> > Commit
> >=20
> >   a9f58c456e9d ("drm/vmwgfx: Be more restrictive when dirtying
> > resources") =20
>=20
> Actully the Signed-off-by: is not missing see=20
>=20
> https://cgit.freedesktop.org/drm/drm/commit/drivers/gpu/drm/vmwgfx?id=3Da=
9f58c456e9dde6f272e7be4d6bed607fd7008aa

There is no Signed-off-by from you as the committer (just a
Reviewed-by from you and a Signed-off-by from the author).

> By the way there is the patter "---" before Signed-off-by:(which is
> same as used by patch to separate description from code) and I think
> the script is reading only till that point. I think "---" should not be
> used in patch description.

All the tags should be *before* the "-- " or "---" separator.

--=20
Cheers,
Stephen Rothwell

--Sig_/6b1gFu/lYiX1QCar6=F2ByB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/uBsACgkQAVBC80lX
0GxDLAf/cPG8X8WpOjB/jK8g1cMjxYCtJ1iyRRus2SGyZxijfpkhJMOKqUwLgBtR
YdahlejMFa2aVV9gyh3Xt17N1sDKUzXEfAGfVqd5WHwcLAihWQZuqdl1rN8Vzwer
AfNsvpj+kcO2hoPtHaSDcBnDcaPTS7bir0QMEXJanki/ImuHMgnuKG5S+NHiWzla
g2alLOuImU4qLKCtHsoY2vVKaHyalJpdjwQjLYAiErDbTDskZCzdrvDDbyqcUlKO
g+GPhAIH7dWh+7E7+PNUbNy/GHpkv0dM+OPQOaBrvl21zDOUwo7K1NxjeRh2XtIQ
d54TlWTRTQipsyOF7sonsM5b0VBwtg==
=FWCF
-----END PGP SIGNATURE-----

--Sig_/6b1gFu/lYiX1QCar6=F2ByB--

--===============0634015868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0634015868==--
