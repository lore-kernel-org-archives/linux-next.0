From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Fri, 12 Oct 2018 13:14:44 +1100
Message-ID: <20181012131444.605564b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ezwu5_G0L7Bz8/2204BEODX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/ezwu5_G0L7Bz8/2204BEODX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/mm/pgtable.c

between commit:

  184d47f0fd36 ("x86/mm: Avoid VLA in pgd_alloc()")

from Linus' tree and commit:

  1be3f247c288 ("x86/mm: Avoid VLA in pgd_alloc()")

from the tip tree.

I fixed it up (I used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/ezwu5_G0L7Bz8/2204BEODX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvAA5QACgkQAVBC80lX
0GwR5Af9F75MRgtsrz9Y+fOsgP1yq5zOeKFdXDVKnSBRrqMAfEZGPdIwsmJHEU+E
YiJ7q941M8UnYWnocIa/UrwgYxV9wRuj3p8zXX7O4gj4OmcJyAWYkj+C8SJ0qpGi
WypKz+WUetVgdGdYzGukFR0ch6kcMSjD6r3Fce91HPpNBRAAkAClak+uyUagGUgy
ZLjDsrJGvAiLPGnM9qaixRZ3IctCYUoi6CL4p/RR60KM+4+FQca2M3J+Yla7epJS
sr8EIHUn9utVWoN9L4YwqdQ53Y7uGeofYhoJnFWN1/Mty8es9cqkq1HY2fiseviL
ERD1Frt6mdt7BpWXLPpUMm50CXyC2g==
=2yu+
-----END PGP SIGNATURE-----

--Sig_/ezwu5_G0L7Bz8/2204BEODX--
