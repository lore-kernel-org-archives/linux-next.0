From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the vfs tree
Date: Thu, 2 May 2019 20:25:15 +1000
Message-ID: <20190502202515.22f72e48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ulH.JuB/uS1=Eg7Pvri=9W1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ulH.JuB/uS1=Eg7Pvri=9W1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

In commit

  4e9036042fed ("ufs: fix braino in ufs_get_inode_gid() for solaris UFS fla=
vour")

Fixes tag

  Fixes: 252e211e90ce

has these problem(s):

  - missing subject

Did you mean

Fixes: 252e211e90ce ("Add in SunOS 4.1.x compatible mode for UFS")

--=20
Cheers,
Stephen Rothwell

--Sig_/ulH.JuB/uS1=Eg7Pvri=9W1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzKxYsACgkQAVBC80lX
0Gw4AggAlK4m/cnMIbRK9g7eVyWYyLZ7cuBvVD34bhMkYgl1nPA0JquX5lQtOeU/
Mb+Pl7fJteE9bURcq27eRC2W4aJWu7/B4uhpwA8D94aHfS8ttHk2xBBY4HXsmwsU
s4RYjG9qmpZZ6giMr1YqB9hWzF+HjMQNuuqfms5ZcPhSUYa30sBQtVHmN2gWIrAo
UFdL83cadlHfmxl3XPcjXsqxp8wGKxc0iJ6F6O0slkXfEjhwth9QKW2fzoGplBx8
yZOTTGXGo+uFSrZBrTbrWUbN0KTp7mtY3JqungkZ2Fd1IKITPRzXYRR061rUHYQ1
k76GxELmJ0hTQev9J4sSIb7O8ksMaA==
=SwSu
-----END PGP SIGNATURE-----

--Sig_/ulH.JuB/uS1=Eg7Pvri=9W1--
