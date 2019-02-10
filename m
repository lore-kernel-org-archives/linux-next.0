From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the driver-core tree
Date: Mon, 11 Feb 2019 07:40:52 +1100
Message-ID: <20190211074052.2407f1e3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ps1P.gUG60/254K9ykgcdjL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ps1P.gUG60/254K9ykgcdjL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

In commit

  344c0152d878 ("selftests: firmware: fix verify_reqs() return value")

Fixes tag

  Fixes: a6a9be9270c87 ("selftests: firmware: return Kselftest Skip code fo=
r for skipped tests")

has these problem(s):

  - Subject does not match target commit subject

--=20
Cheers,
Stephen Rothwell

--Sig_/ps1P.gUG60/254K9ykgcdjL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxgjFQACgkQAVBC80lX
0Gz+nAf8D4fIP6zBxOZsEomgnMm+/a2i+lwePkI4DfK1ATEr289BUhzCXrsrtE8B
nXwkqE6Lpxj2i1EOPUnN9ulcblAQ1vzeHa7LzVxjBTsJ+cEbCT32AinRTDKE5prU
842GLxKelU514N5gVgvjOQBQrfGuJWwM64JTLzI24SqoyqS9F2otJ68dEPT6lR3J
8AgiuT+fICcTSctQnJFTFZk8TNEGxnHdQEW9HkmU4GRFnD0sX7E/A0+6ftFXmf5m
J0Fck+ZpQtUNI7bKAQA0v6vxBcDwpdlhXjWE0QS+yx7wV2jT4n/ngi0aLLn/ARUW
HU7K33E5ISCV6x4OS/vdiw72FgGlkQ==
=Kjc7
-----END PGP SIGNATURE-----

--Sig_/ps1P.gUG60/254K9ykgcdjL--
