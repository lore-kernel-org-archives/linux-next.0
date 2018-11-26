From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the slave-dma tree
Date: Mon, 26 Nov 2018 16:59:03 +1100
Message-ID: <20181126165903.33b1d872@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ksmqb21AMh4WREzYD+BsDzZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Ksmqb21AMh4WREzYD+BsDzZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/dma/coh901318.c: In function 'coh901318_config':
drivers/dma/coh901318.c:1805:16: warning: unused variable 'flags' [-Wunused=
-variable]
  unsigned long flags;
                ^~~~~

Introduced by commit

  627469e4445b ("dmaengine: coh901318: Fix a double-lock bug")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ksmqb21AMh4WREzYD+BsDzZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7i6cACgkQAVBC80lX
0Gw0tQf8Csjahcy+/StWF7NgyoZVKwUbq0BQDqz4+Hqa16/eJU8E/1N6EyqiFeWt
jzmZskqG75+4uhAWlB3WGmKYr+1XT06VxXPtYo2ryvcjgFR2IE9YWJmn2WR6Wxvy
I9muX7t7gaYX3IzuWFGdb94GA7B54xo2I9tX3lYGmZ6d/GaUF3rIiIo9yFzHIzFq
yHWsAfcp0fZcQJI2n5Y6Uh+/m+bJwUxMiqTZi73Pqb4aESiYWbJTJV/RRdzMsjKO
SjJvofKxNoozsbbaU01HOcKxm/joXP2Ah6INhjD+sgY7fqFwbRunqSgAaV2+AeGg
cWINGha+Rk20N3e7BQX80067MJ5N3g==
=aFRh
-----END PGP SIGNATURE-----

--Sig_/Ksmqb21AMh4WREzYD+BsDzZ--
