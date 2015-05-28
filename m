From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rr-fixes tree
Date: Thu, 28 May 2015 11:51:37 +1000
Message-ID: <20150528115137.1bb01b04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UMVuB4DPwqiC1HbkbRuarxN"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60025 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751398AbbE1Bvp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2015 21:51:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/UMVuB4DPwqiC1HbkbRuarxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr-fixes tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/net/ethernet/mellanox/mlx4/en_tx.c: In function 'mlx4_en_create_tx_=
ring':
drivers/net/ethernet/mellanox/mlx4/en_tx.c:147:3: error: implicit declarati=
on of function 'cpumask_set_cpu_local_first' [-Werror=3Dimplicit-function-d=
eclaration]
   cpumask_set_cpu_local_first(queue_index,
   ^

Caused by commit 8829fd02186d ("cpumask_set_cpu_local_first =3D>
cpumask_local_spread, lament").

I have used the version of the rr-fixes tree from next-20150527 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/UMVuB4DPwqiC1HbkbRuarxN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVZnSvAAoJEMDTa8Ir7ZwVhv4QAIDcWCAcGSGA21He+bBlf+PB
B2TDB0mLEtMqNkuAO7X0sE+3NAeViWHKySXAco/vcqF9pkcEkjcXJvt1i9OHUZDd
ekgVo+WvMOdBDjVZ4ISu53pDHG0M1BQsj8ob4JL/2Dux5RjwV7sbMIO5TqREhLiG
AyZrHh1STE6Hn9Ule5V+AtzFI3y2Sayya1n70M1AxZ8uk+oDM+Xx6UCu/AsmiWsb
f+Vr25aMAiypu3nlWRLevqvJSCiBcypGO9Bvo3aGZcarlkrUFNbLBxOWrAko+KxI
1jYND5/gEHwQrB7C++AZ7dB/TT2Yw0M16QiaMy4hI0G/vroi+pPGpKzhm2wEeyr2
c5CzJcIhG76f0m3CRYFEXs6x/P4NkCS9vfPjFr581NY5l6CePm6AVjyY+bGxsCJ9
2aHS6K88+Wpk6p2sfJDoyZo50kF98wVJAfoTVDmbiQku9CbML+UVUs+scCcJHBNs
4lhglZ+FT6OGAQYLYuruMOLsnvSEVW/z+xksh+uj7u8y6gTOJyTb8g0BgpQPcNug
v6cdgRwWGH/4V+8uicb3/hdLJJev901RWaxNsXcbweHiTEYIAuV4znUmZWf0ONJ1
bXl6X5eOO6O96ho1n30Azb9k4fKwXCVMKeGPjoXh+DcRQM60kZ0H6ahp9QhkQ8Iv
okHyuaj/lTH6GFnQXvYG
=5Dfd
-----END PGP SIGNATURE-----

--Sig_/UMVuB4DPwqiC1HbkbRuarxN--
