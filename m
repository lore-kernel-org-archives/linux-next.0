From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Date: Wed, 27 Mar 2019 22:31:29 +1100
Message-ID: <20190327223129.53ce82d6@canb.auug.org.au>
References: <20190327135904.7830c60c@canb.auug.org.au>
 <155368485987.8699.12849690159482129286@jlahtine-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1459195343=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <155368485987.8699.12849690159482129286@jlahtine-desk.ger.corp.intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-Id: linux-next.vger.kernel.org

--===============1459195343==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HEkKaYgDvwlsgpZofC+D=3+"; protocol="application/pgp-signature"

--Sig_/HEkKaYgDvwlsgpZofC+D=3+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joonas,

On Wed, 27 Mar 2019 13:07:40 +0200 Joonas Lahtinen <joonas.lahtinen@linux.i=
ntel.com> wrote:
>
> Quoting Stephen Rothwell (2019-03-27 04:59:04)
> >=20
> > After merging the drm-intel tree, today's linux-next build (i386
> > defconfig) failed like this: =20
>=20
> We had a CI reporting mishap, where a failed 32-bit build resulted in
> a misleading success e-mail being sent.

It happens.

> The tree is now fixed and we'll investigate the problem to avoid such
> a false report in the future.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/HEkKaYgDvwlsgpZofC+D=3+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlybXxEACgkQAVBC80lX
0GzmKQf/Y3drSHltVV8A5o+ooBYdz9JFigcnRBqrrS7FF/CGGOhNAz/oB63jIRdo
c3nodtXz9EBRs0ceY3oGVmswoc+RlTwqn5VfPawDP1wYSL10gaUhvzlNHnKFgNZu
3mCu6hSKYn7l5wmQuBRjWlXJCu1zKy/Jg6DpeYhrl2GwPgCJgbyQUsH4m4vmq7FN
WoTgkoBg6wETaPQrghgTkpo4dAhZ1abkxGa35ePwsM3GIDlh+IHrqVQYh4SHgsCu
C4dixJocZYBrM2h/l3FIV/sQVAXmHvv07QQmZz4yb1MB6T1lBzzgYnn+0Qpc0j3g
jI8lvBLjONBIPLpRmQEdRKjZ1/L9Rg==
=3dkF
-----END PGP SIGNATURE-----

--Sig_/HEkKaYgDvwlsgpZofC+D=3+--

--===============1459195343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1459195343==--
