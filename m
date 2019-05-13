From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the kselftest tree
Date: Tue, 14 May 2019 01:05:40 +1000
Message-ID: <20190514010540.6fbe70e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/42zB5IixV86pkMF=x7h5+V1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shuah Khan <shuah@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/42zB5IixV86pkMF=x7h5+V1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

In commit

  e64ee1f5dc1a ("selftests: fix bpf build/test workflow regression when KBU=
ILD_OUTPUT is set")

Fixes tag

  Fixes: commit 8ce72dc32578 ("selftests: fix headers_install circular depe=
ndency")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/42zB5IixV86pkMF=x7h5+V1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzZh8QACgkQAVBC80lX
0Gw33Af7BwLykcsFSxaJ4zhM0iYij121ix2a15JOsKMlKLJXEi8IGOd+8vw1CeWQ
z65oEGTieWwIqp0j4YAXiDeRTVKYRV3X0ndcl3zLLW7bz4dKGcK7SRzfrs+nSVOH
y+X/pHke+fQ63bful+d52Os3SSBdjslqq92AxtrJVqIKXkOnDxc2waZqqde/K8Jf
LjlQ7KZ7cMZtLZWq1ZAcWg4LZVMWO7yzhbmnjIWeji+weIwHTYQyBFsLXKwe3ZVz
UhIRDgfJ9WCUvaYai7VrT2jnxCAkxQ0YxKmZGhecfgSv5k04E8bxYQZF9qcnp9zD
5JKQvhknM9OCkD5sM94JmO+MRxrE2Q==
=SyBd
-----END PGP SIGNATURE-----

--Sig_/42zB5IixV86pkMF=x7h5+V1--
