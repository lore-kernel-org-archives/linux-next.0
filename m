From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the crypto tree
Date: Tue, 16 Apr 2019 07:23:42 +1000
Message-ID: <20190416072342.739863fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ool2hkG9X7ID6towcfBR+ki"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Ool2hkG9X7ID6towcfBR+ki
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

In commit

  2e53582d158e ("crypto: mxc-scc - Remove broken driver")

Fixes tag

  Fixes: d293b640ebd ("crypto: mxc-scc - add basic driver for the...")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Ool2hkG9X7ID6towcfBR+ki
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly09l4ACgkQAVBC80lX
0GwNhQf/eBe5yA87ymp4gH6AjgNh8CiDDkmIiUWofYlc5QH3gFzwcsHNTOdyRotd
umzVoJ1fEi7v4tNuDjT5Cae8EAYWLRCZ+C10EsdG4+XqH/3tMS+F0cbyZxY06dYj
ut/oRSYMSmY09pnHJq4MonmgEi0ysIrH+UDtgrssg3zzoiQhropkXOpaki8vp5Ks
/k3zmseS7jwaKWdoUTOo/Z0HRD18j25/dajhXQMeW9Sra2GSL/Ps2+cV9lGKp6FS
k3bN/vIOkkCJb8Cie+LptjBNIjMz1j6K2XK/Q5pNKKxQ5/LfQ224d143s+LgrbBh
P5OcnlXfZ31JwCr7Qf1YTm52gam6mg==
=DAxh
-----END PGP SIGNATURE-----

--Sig_/Ool2hkG9X7ID6towcfBR+ki--
