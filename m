From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Wed, 30 May 2018 11:29:42 +1000
Message-ID: <20180530112942.2cfc2251@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ezt8wi.HWin5WsXSitODAqj"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/ezt8wi.HWin5WsXSitODAqj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

make was continually spawning test compiles.

I used the kbuild tree from next-20180529 for today.

A (partial) strace seemed to show that it was testing for compiler flags
(some more than once).

--=20
Cheers,
Stephen Rothwell

--Sig_/ezt8wi.HWin5WsXSitODAqj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsN/oYACgkQAVBC80lX
0Gwj7QgAisO4aksHIvPCu7NasI8joEAxTcwWmnEvnBe9miNLq4lvfmFc1XhVKsZR
sms5E1YvwdyN4UlLNgbKyVwqm7W6tykoFjdozsT6zpvCXyQT8mRFjDpxNjySEEsW
/dwzh7OmPjtzwSs25HFvN53/WfAgP/v9jl2EP8BR1wMJELZjCeXrGCkdC6n4uEVQ
RG20hzUkRDikRWw3VErDbOAMnekjeG2hq3pImTYA/pL9nHUJGsVHcMksk8dqqjnH
P0G9dCCs0T4CIkGBoT9Vhf8AQI993ODFQMTfK4p+wFNZzNBYkuDjVC3jd/LD7Byg
uBHbGhACh5Ph6DeJVTR2A8EvPp9vTQ==
=whsx
-----END PGP SIGNATURE-----

--Sig_/ezt8wi.HWin5WsXSitODAqj--
