From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the s390 tree
Date: Sun, 28 Apr 2019 17:07:13 +1000
Message-ID: <20190428170713.770e1bfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0kVjR4O274LwqJPu/Jm+bpT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philipp Rudo <prudo@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/0kVjR4O274LwqJPu/Jm+bpT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2875248b5e1a ("s390/kexec_file: Fix potential segment overlap in ELF load=
er")

Fixes tag

  Fixes: 91a05d9e1d6b ("s390/kexec_file: Add ELF loader")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 8be018827154 ("s390/kexec_file: Add ELF loader")

--=20
Cheers,
Stephen Rothwell

--Sig_/0kVjR4O274LwqJPu/Jm+bpT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzFUSEACgkQAVBC80lX
0GxQoQf/W8KM8sclN38B6l1gUVTRGhez6cbWfWWFqF/YVVoThbRFE/9LLBz4g9LO
enAgykYBtM6hhipGzYZr52Rt4Z1HK73eHbmBLincOb8KZK/YUf6IuVbKdIF6vSjb
X5BHIltPp0g9u/LTptv1ApItLU1uNQgW1Z1ItqpXytkwtw2SSgv7Yv5EEBGL67Gc
fwzEzNOy+st2rU1UaCF9dlzCMFWMDoF5V6dQweEORarFQp+RPQkXva21iv9s+1o+
pgQKFhahGLcpLWVSQTdj1QgO9FZgRv5lc6rygk8MM78lvZG5bMarD/H2f3VGm0os
WYzeVEhwbboKrmY3cU4+O8W8lCrA2g==
=SyRY
-----END PGP SIGNATURE-----

--Sig_/0kVjR4O274LwqJPu/Jm+bpT--
