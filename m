From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs work in the device-mapper tree
Date: Wed, 16 Jan 2019 08:02:51 +1100
Message-ID: <20190116080251.17ba9771@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sn9ifLak1VTNRq8BPCH/Gzg"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Joe Thornber <ejt@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sn9ifLak1VTNRq8BPCH/Gzg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

[I am experimenting with checking the Fixes tags in commits in linux-next.
Please let me know if you think I am being too strict.]

Hi all,

Commit

  fc4d02aa0331 ("dm thin: fix passdown_double_checking_shared_status()")

has a malformed Fixes tag:

  Fixes: 00a0ea33b49 ("dm thin: do not queue freed thin mapping for next st=
age processing")

It should show at least 12 digits of the SHA1.

--=20
Cheers,
Stephen Rothwell

--Sig_/sn9ifLak1VTNRq8BPCH/Gzg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+SnsACgkQAVBC80lX
0Gzhngf+PIayDhdeOyHBaz8uQS+ropz3F12wSk7JJrfzG++9DVSaKi62A7Gch7Rw
/EWGgW/Fg/i7FFymiQfC/pzlNGcL8dj8kmQN5ITfygHBztO+HbifblDPjnq1mP3O
w7yxHgFWrbVskfW+Q3BsyMH5KCuUfxmKKsgpR5Yw+64kthggYjjc1P43RZAh1RZF
YBfX4EMmix1LGiAR4/I7SMjMOyY2rDtIT0nPNhHEDd3mZq5RjqP5bFB88VHeqAmA
Mk6rIXprVLsR72X10abQne4ZDRae14JoLirokAPss/+swgOEUAHT9JRe3YAlkwep
SEWFwHOFvU4hccN0XUN4sbi1LpjN+w==
=5Utl
-----END PGP SIGNATURE-----

--Sig_/sn9ifLak1VTNRq8BPCH/Gzg--
