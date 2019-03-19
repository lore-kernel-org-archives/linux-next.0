From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the leds tree
Date: Tue, 19 Mar 2019 13:58:33 +1100
Message-ID: <20190319135833.64ad30b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o2dvWC9DrisrNsricRIrHid"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kangjie Lu <kjlu@umn.edu>
List-Id: linux-next.vger.kernel.org

--Sig_/o2dvWC9DrisrNsricRIrHid
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the leds tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/leds/leds-pca9532.c: In function 'pca9532_probe':
drivers/leds/leds-pca9532.c:536:11: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
   devid =3D (int)of_id->data;
           ^

Introduced by commit

  6b788fae618c ("leds: fix a potential NULL pointer dereference")

--=20
Cheers,
Stephen Rothwell

--Sig_/o2dvWC9DrisrNsricRIrHid
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQWtkACgkQAVBC80lX
0GzDDQf8CyTqf8Wutu88gxXhsR80cbHvKXmFwz9Akd1oCwDGEQi6lCEHAnjjg9KN
37Q5bMojkFLVxHYOL0j5DJilQZ6nHd6OEzabnA8wKHzSTrPWF+NL2Yh6u0ruFaIZ
nUd8zGuI2S0mdCUDF+k3dVaFusfRH8Aj/q/RcTRdoEfoL+QmwWWT8rWcjPWDJ/EO
67cm9tlPykueWvj1//jlds9rgMrq0rlG9bIsP3sAUcXxItMeOB/8LXtcTTW93FiB
+klXweaweZFbMaV5QzfQmdKbLpjZkccSwtaRg8GX81rbytM7VxfMQUf5oQ+oDQv1
lZCGFd24C3zBHl3ndjmgzH0YbFDTVg==
=p/x6
-----END PGP SIGNATURE-----

--Sig_/o2dvWC9DrisrNsricRIrHid--
