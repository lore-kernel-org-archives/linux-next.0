From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the y2038 tree
Date: Fri, 16 Mar 2018 13:25:29 +1100
Message-ID: <20180316132529.45126501@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5ZRLpJR4xNCkH3bZP8CRY14"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, heiko.carstens@de.ibm.com
List-Id: linux-next.vger.kernel.org

--Sig_/5ZRLpJR4xNCkH3bZP8CRY14
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

After merging the y2038 tree, today's linux-next build (s390 allnoconfig)
failed like this:

In file included from include/linux/elf.h:5:0,
                 from include/linux/module.h:15,
                 from init/main.c:16:
arch/s390/include/asm/elf.h:138:1: error: unknown type name 's390_compat_re=
gs'

Caused by commit

  f00689038f71 ("include: Move compat_timespec/ timeval to compat_time.h")

--=20
Cheers,
Stephen Rothwell

--Sig_/5ZRLpJR4xNCkH3bZP8CRY14
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqrKxkACgkQAVBC80lX
0GxGUAf/TO6OACPRD1h7hm/aoE0a6NqBesrxMP9hsw0GE2WLQvKaZiBSf+vpNZSs
BwjWtuXTZw6v0pjMs2xy1beNgtGR0mimIi292Xm9s5HpWnjnsypBURjWfJInvUv6
3Z6FKdHlV5CGmptieivPQCLVf6WVrnQeAojZLrwJKfAixwbvM1J7c8myFDadIXea
y5imG7hZZuliGz++nr9dsvoDnt2xL5MyltGb411J3e48h0gSNFolhfy/fxHAccLm
GAkTL5f0WWR5Uqq/tWi+Z8XvQ5JO2gvKc70ktsbuC80p3nVomhEI4ykaxUIUrFSl
CP/706sRfWj9ByWxgGN/KP8XclZP/Q==
=4ztu
-----END PGP SIGNATURE-----

--Sig_/5ZRLpJR4xNCkH3bZP8CRY14--
