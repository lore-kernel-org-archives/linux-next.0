From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the y2038 tree with the asm-generic
 tree
Date: Thu, 15 Mar 2018 18:44:09 +1100
Message-ID: <20180315184409.73d85ca6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/95N.MK/hsUzFNwT6AbPtzX6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/95N.MK/hsUzFNwT6AbPtzX6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

Today's linux-next merge of the y2038 tree got a conflict in:

  arch/tile/include/asm/compat.h

between commit:

  0373506fe580 ("arch: remove tile port")

from the asm-generic tree and commit:

  f00689038f71 ("include: Move compat_timespec/ timeval to compat_time.h")

from the y2038 tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/95N.MK/hsUzFNwT6AbPtzX6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqqJEkACgkQAVBC80lX
0GzkHwf/feJkFc6M6GujNpLunhosE46bOxDS6g9HR3bbfY2zj9evfOm/sSWMuXk1
WihJI3zYRWutygCoK6kjCAJELwyUCnD7hhpGYqNBMa8oAufHXPYM8ErQy96b24j2
8dFWU/CpESjjE8h+JANuwgWwuMwudCGzIwzorqvrc7ZsfKroVm7WisiZmMI1oYfU
wtqnnV9KBD57tp5iXGMXkiAq8NumIOueS+kY1BbNdwO1bdm5mYJmHb/uCtrvQRyv
s0gaBXq1oWidhYcwWVK3RyLdDZtL9bTc1kguIBzC2S7S8L2JCZOq4S3C1Aj2HB5S
PCd8PuJnMbDkNhz83g+9iIna3e7tHg==
=ZoKL
-----END PGP SIGNATURE-----

--Sig_/95N.MK/hsUzFNwT6AbPtzX6--
