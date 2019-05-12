From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the thermal-soc tree
Date: Sun, 12 May 2019 11:06:03 +1000
Message-ID: <20190512110603.767286b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/URt6mAOff+2C4Lc0Y_moRZ6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/URt6mAOff+2C4Lc0Y_moRZ6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

In commit

  201f0534b335 ("thermal: rcar_gen3_thermal: fix interrupt type")

Fixes tag

  Fixes: 7d4b269776ec6 ("enable hardware interrupts for trip points")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/URt6mAOff+2C4Lc0Y_moRZ6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzXcXsACgkQAVBC80lX
0GyEJggAoHu7bgeOYAMmFkS17O/82MTuiOP9Mx1tspbvJ0SGLshJ56fkGc1zFoIN
dMuw4vZXcV917W2daahGgcYXNGwQ1aATTPU6lOwzuyDZOB6tXUz52FpEWhv7bIxx
DuOdxIC3Vm1r2Jlcs4rlfStE2uhsYlog7WN/hvpb0GZ7xgNuwQFvxCkybWripA6R
MNEdFGtmDNkKVYHXYPpGxxmOVb5GggDVOP37m/FQQ48ADmObFnc4r/vY2VqmC0Zi
DQie1zS10lDEY0W00IgBowhtDARXKNrocHVoRubi8PI0v6EPPrzwLZ4uqawH71SD
E+hAH+JPgmmG19ZAY5/6pMuo3MOeIQ==
=rny1
-----END PGP SIGNATURE-----

--Sig_/URt6mAOff+2C4Lc0Y_moRZ6--
