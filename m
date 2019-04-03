From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the selinux tree
Date: Wed, 3 Apr 2019 12:22:12 +1100
Message-ID: <20190403122212.68a9964d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.g=JCJivCxaE/shpzUYX4f2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ondrej Mosnacek <omosnace@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.g=JCJivCxaE/shpzUYX4f2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

After merging the selinux tree, today's linux-next build (x86_64
allmodconfig) failed like this:

x86_64-linux-gnu-ld: security/selinux/hooks.o: in function `selinux_kernfs_=
init_security':
hooks.c:(.text+0x8f7d): undefined reference to `kernfs_xattr_get'
x86_64-linux-gnu-ld: hooks.c:(.text+0x8ff5): undefined reference to `kernfs=
_xattr_get'
x86_64-linux-gnu-ld: hooks.c:(.text+0x91b5): undefined reference to `kernfs=
_xattr_set'

Caused by commit

  1991af34fa26 ("kernfs: fix xattr name handling in LSM helpers")

I have used the selinux tree from next-20190402 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.g=JCJivCxaE/shpzUYX4f2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlykCsQACgkQAVBC80lX
0GwEVQgAlC/wjvYSDyGUYtJRZbx6sIge9cGzDmDOL8YGwXASQ61xI6erEEhOGDn5
xMI9t0LPERB3iHeZLw+FmAifrf/+Nmoh1fGImeodTw4ActpYyj0/0LgpFw4wpi9z
c+6oaldu/iL+m907tLPmFHtrounNGK/yWRXvLyVExNrCgzAyMWO9m8Rvhj/usc4w
X7YXnllZLOhXKOuFfYs31dQrT3USsfAUu08V/I3dm/J7/BUJFAud9XomcU5e89db
7B/AzJLJH8YClXBkIuyRmx4PT0fCynJaVEIXhEz9hzUd75SyGX35+yYszu5F1xHR
PaVur/L9U/ZIwDlkVrM9srFb0XD+TA==
=VreI
-----END PGP SIGNATURE-----

--Sig_/.g=JCJivCxaE/shpzUYX4f2--
