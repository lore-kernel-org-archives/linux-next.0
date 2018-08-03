From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pstore tree
Date: Fri, 3 Aug 2018 11:00:23 +1000
Message-ID: <20180803110002.5942ff15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wUzUYpsI4p=0c9YoFKPjbP4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geliang Tang <geliangtang@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wUzUYpsI4p=0c9YoFKPjbP4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

After merging the pstore tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/pstore/platform.o: In function `zbufsize_zstd':
platform.c:(.text+0x172): undefined reference to `ZSTD_compressBound'

Caused by commit

  48ed452ca6ad ("pstore: add zstd compression support")

I have used the pstore tree from next-20180802 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wUzUYpsI4p=0c9YoFKPjbP4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltjqScACgkQAVBC80lX
0GwALggApkQBA0vfK+wsVfRM9m83qorsSaDjALq5RnGLPD776TpCOb7y21jPYC3A
uS1W0iR/wjEJt7hELJ5kyJGxaz3sxcIQivshWIFlU6daaWA2rjAv2UizlKcSi3Xv
Esd0NESoKYoeKLmEpZefNlSbR3SqYiRDSNINLE9ntyL/IWkoKWT/Ui6LrgNXS9Cx
8q1cYFXRJa+Aiblrpv7xF6qmzBNJG6Ju0hk2Axg0doNOee/wu9o1deZ2rrH0CVd5
Iv3R7hurkO1oighix6H1kTYG00wo7fmbiCS/acV+qDkAhUaKKF+DiqxJv7rTCgDo
YFJWP2UcdGbe1tTCwRFEKwRuEZx1yg==
=/Fyh
-----END PGP SIGNATURE-----

--Sig_/wUzUYpsI4p=0c9YoFKPjbP4--
