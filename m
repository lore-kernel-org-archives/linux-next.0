From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 29 Mar 2019 14:26:05 +1100
Message-ID: <20190329142605.5e3263d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lqN/RN1Ku3WGTkBHw0ryw3."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arvind Sankar <niveditas98@gmail.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lqN/RN1Ku3WGTkBHw0ryw3.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  dabb8338be53 ("igb: Fix WARN_ONCE on runtime suspend")

Fixes tag

  Fixes: fb29f76cc566 ("igb: Fix an issue that PME is not enabled during ru=
ntime suspend")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

Fixes: 1fb3a7a75e2e ("igb: Fix an issue that PME is not enabled during runt=
ime suspend")

--=20
Cheers,
Stephen Rothwell

--Sig_/lqN/RN1Ku3WGTkBHw0ryw3.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlydkE0ACgkQAVBC80lX
0Gy4/Af/e6yxaiyo9oxVuL1RhYbi6EMqhrimp+RbSCsBWX94YPwzuS0yNXwlWtbM
0ET36YT/RTiU98NzmOM/NWc5eF/fBSl5/8L4Z3GXyZ6LptAJUYZL6+Q9pZNYaEew
yIdjgs45997Pdo43k0DZfBcP2MalivBex2IOHbtK68BmLRsx2/ILDKgIV3OvVw19
of4HcbtOjawCd/JtQYC9yugHU6H2F1aJwUmSX6ys422eomFYuqSs7oREZqeYElMn
NtqORTA6qi1jowTChsQANBZGvurADayVN/U203Rp6Kwtcxzc1/vJ5lpyizKW4lzS
F2epdR2v0LjLyMbTELaG17SwVk9c2g==
=EmW4
-----END PGP SIGNATURE-----

--Sig_/lqN/RN1Ku3WGTkBHw0ryw3.--
