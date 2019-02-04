From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the crypto tree
Date: Mon, 4 Feb 2019 11:01:06 +1100
Message-ID: <20190204110106.345c3e21@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1lqagE=XXd0DpGg6hohh3uM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/1lqagE=XXd0DpGg6hohh3uM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

After merging the crypto tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/crypto/qat/qat_common/adf_transport.c: In function 'adf_init_etr_da=
ta':
drivers/crypto/qat/qat_common/adf_transport.c:501:1: warning: label 'err_ba=
nk_debug' defined but not used [-Wunused-label]
 err_bank_debug:
 ^~~~~~~~~~~~~~

Introduced by commit

  f0fcf9ade46a ("crypto: qat - no need to check return value of debugfs_cre=
ate functions")

--=20
Cheers,
Stephen Rothwell

--Sig_/1lqagE=XXd0DpGg6hohh3uM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxXgMIACgkQAVBC80lX
0Gz9PQf+KalnOtLSHQ1AxBFmCNlj1d9Pp/xkZRqGfWaRLFaMWoSRnkK/zgWwdhmO
pGuWRbTTfhh4TK5elG8Za+z8rIgIoSNxip7d9su4wda+KJey8yWbOD2bGLAr2618
lkJXX7+rLo9RKvNlx4HSfDsCU9VN12HVVqYM0ot5FIJqg8c3ucYe+vkdjgLG7PQE
37JctlpAxNC68k3PzplupRnjInrpryWVO4ifWxHsbr7cx0NLISW+XVQ4R8kvH9Ae
TnPZ2mkpqSD4AUFgqdEPoBU8qE1y+8EsXg9IAINou+6F5giHNjTZs443XU2tHOqD
YttzCnhQ8XiDSHriUCPyu7ROseysUg==
=6G/t
-----END PGP SIGNATURE-----

--Sig_/1lqagE=XXd0DpGg6hohh3uM--
