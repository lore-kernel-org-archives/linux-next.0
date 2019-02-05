From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the userns tree
Date: Wed, 6 Feb 2019 07:33:30 +1100
Message-ID: <20190206073330.6e266351@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.XmtDfTHFPVJPln7pP_BSQQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.XmtDfTHFPVJPln7pP_BSQQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

In commit

  a692933a8769 ("signal: Always attempt to allocate siginfo for SIGSTOP")

Fixes tag

  Fixes: 6dfc88977e42 ("[PATCH] shared thread signals")

has these problem(s):

  - Target SHA1 does not exist

--=20
Cheers,
Stephen Rothwell

--Sig_/.XmtDfTHFPVJPln7pP_BSQQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxZ8xoACgkQAVBC80lX
0GyQKAf+LCmWkYnBIlYmuKadHA0p5/oo/jWmRSneiFqT0LBp8G6MWJo/0eluWf3z
iabt+r9zKztDHsmNKfE2R+av7efxE5O8Yk2Ji577KphxFFrArnz2dKL7CxzwvwgA
XvxSLRNfas7qkYEIbXJFatzgHNKF6E5XEMQomFjT1kbZ8lZg1xf+uGvu7Xkg6ppV
/M8HSC3sHd4a4Ztr3Esb5UhSkdvHTjboWj8z9V6M20a6Na6PP7VmcSwHeoQa7Cuo
8wPU5/QYzwgZv6MuxIOt1r0O79aeSBhHv8rJZlg98HAMCXttNeHMSBzAp59m2atA
vColgmyvpz7G+DIeC95eW9hj6I79pA==
=+8Oj
-----END PGP SIGNATURE-----

--Sig_/.XmtDfTHFPVJPln7pP_BSQQ--
