From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Mon, 20 Aug 2018 08:16:18 +1000
Message-ID: <20180820081618.1338cd47@canb.auug.org.au>
References: <20180820081323.23a47af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9Guif6RW=SifqoZH+9=HrwM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820081323.23a47af3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9Guif6RW=SifqoZH+9=HrwM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Aug 2018 08:13:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc64_defconfig) produced these
> warnings:
>=20
...
>=20
> Presumably caused by my update to gcc 8.2.0.

And this from the x86_64 allmodconfig build:

scripts/unifdef.c: In function 'Mpass':
scripts/unifdef.c:453:28: warning: 'strncpy' output truncated before termin=
ating nul copying 4 bytes from a string of the same length [-Wstringop-trun=
cation]
 static void Mpass (void) { strncpy(keyword, "if  ", 4); Pelif(); }
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~

--=20
Cheers,
Stephen Rothwell

--Sig_/9Guif6RW=SifqoZH+9=HrwM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt57DIACgkQAVBC80lX
0GwNfQf+K07qdPYpBe/JqgsTFLM1DkDt/Yh4ojmyyjpYP6+s28meOItV3+y9dVXQ
q3mMSSmCXo0s6ZmzWZduy8QTWgqeGpMivOleesjiz3miG3IT3uZXz0URcUy6ewTP
MduAC6q4kEemRAtWmbn9HUDDVhBRq/b+hM7hiOluEETlWvwHVKRzhhUDGiawzRHy
RDyo+rCpLhBFb27A/FSVvcd48qFgRX4LlS7T54OG59vHPy9nbWWcf/+yRFGSOF/+
W6gRj2Px7+nSYvapjli1Otbi+AVhZmDOPYWMN+q7BBG/GjyBAhALOvu7cEWL49BK
WYgJ433vXlT1+qmxl0KsLyZ8ae2blw==
=H6HO
-----END PGP SIGNATURE-----

--Sig_/9Guif6RW=SifqoZH+9=HrwM--
