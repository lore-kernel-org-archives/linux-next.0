From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the device-mapper tree
Date: Mon, 6 Jul 2015 09:27:31 +1000
Message-ID: <20150706092731.4a871578@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/N1mVZxyvYT7_PoXiWObhOfi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Thornber <ejt@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/N1mVZxyvYT7_PoXiWObhOfi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/md/dm-thin.c: In function '__pool_destroy':
drivers/md/dm-thin.c:2780:2: error: implicit declaration of function 'vfree=
' [-Werror=3Dimplicit-function-declaration]
  vfree(pool->cell_sort_array);
  ^
drivers/md/dm-thin.c: In function 'pool_create':
drivers/md/dm-thin.c:2893:2: error: implicit declaration of function 'vmall=
oc' [-Werror=3Dimplicit-function-declaration]
  pool->cell_sort_array =3D vmalloc(sizeof(*pool->cell_sort_array) * CELL_S=
ORT_ARRAY_SIZE);
  ^
drivers/md/dm-thin.c:2893:24: warning: assignment makes pointer from intege=
r without a cast
  pool->cell_sort_array =3D vmalloc(sizeof(*pool->cell_sort_array) * CELL_S=
ORT_ARRAY_SIZE);
                        ^

Caused by commit

  94212d3b6054 ("dm thin: allocate the cell_sort_array dynamically")

Forgot to include vmalloc.h

I have used the device-mapper from next-20150703 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/N1mVZxyvYT7_PoXiWObhOfi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVmb1tAAoJEMDTa8Ir7ZwVT8wP/i0CiyXTRPvJ2zsTCAxzQy0B
3KxzcqDcok7278LSTZaTd7f1p983m0G4SgyKxQ4KP1hDJoAfmQ1LBvCGEAaStfai
LcdgTb+jD3HQx0ClswwsiWDuyoxLdfms53NvcyviTZ1+aj8LyxUObGgsPhauQhP4
+yTWnbL8ub7o1T25KDQeRa4Vc3UY3WyRafvarb7wYHvo7hlakkabPiLDv9htwdvy
lP3juYlan+aEpDV/n6/2jP4Uth17odjCiqBKXsNKY8VS5CWWlcYO0tKOmViqyldK
wFJ7nEEr8Wf0qMpmNhUbYXwcfoSHy2vGQxtPZpBletpyt3xVuXluUr7oO/gj9IJz
1i1NCMKpkfeuAn+sB1kScJT6dukXVP3gHo8q+W4LESFDCfzGai9IHu0VG+4UWUuH
/YM8OclfiuMbKSVzLN1rOvivd4MODQDrI2MqXA5Kk6XiqU7s5A7QjQDMVE8RubRd
psmY1AUYv0Qo4/m+e1tv6qwITlSBiaIQrNOBe6VEceko3LzurFBwtrX3BEN2oFg+
pvBwwpiN6KKkt9AC3CKcGzRZHxRyw4O/LqLxdqJ19/l08ymDGfD2P0Ztn4AmrfO4
YzWW3nsxudS4a6rz87sqpjOhSCbAEsqI+HPzrbNevLYGjd41XThzDOVl5oxX2SQ/
9Efme6voKwo2VVd/stsg
=oxYR
-----END PGP SIGNATURE-----

--Sig_/N1mVZxyvYT7_PoXiWObhOfi--
