From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the coresight tree
Date: Wed, 1 Aug 2018 15:45:25 +1000
Message-ID: <20180801154525.79da6372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EbsZMwJGm/K3bCEM7ON2/IT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/EbsZMwJGm/K3bCEM7ON2/IT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

All but the last 9 commits in the coresight tree have been merged into
the char-misc tree as different commits (they were sent to Greg as a
patch series rather than a merge request).  Can you please rebase your
tree into commit ccff2dfaceac ("coresight: tpiu: Fix disabling timeouts")
from the char-misc tree to avoid further conflicts (and duplication if
you ask Greg to merge your tree rather than take a patch series).

--=20
Cheers,
Stephen Rothwell

--Sig_/EbsZMwJGm/K3bCEM7ON2/IT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlthSPUACgkQAVBC80lX
0GzQiwf9HU/p9258yQpHmB2rfndVNekCGdBQHIuferV1rL18CPlXPCd8vAzGUcnX
Dd3bXHdpFNnNVjticX2QA00C4nuyDTq/OLYXM/e86TdTmIHsbvKA/c91LTly4xg6
z6stxD9q49iizvsIO1ZodSY6RDICFSE4pvEIVPjklOeBFCEs2XoJoJpXgnOgPF19
P9X4QsKZz31zeLurcCzq5aKYy/8bRMM/ck0gmsWW8k6V1dXsJwLgKqzBASQY+hV6
OYYr6EZ3ZxRBMdyv5jZoF/53JtJ29Gn0wgQI+ohdvxOXBlCH9C/2DUMlfT59V2CT
Wdy7QdfunkyNV5UmEBuqnn7Mt7dyeg==
=3+Cb
-----END PGP SIGNATURE-----

--Sig_/EbsZMwJGm/K3bCEM7ON2/IT--
