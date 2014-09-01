From: Mark Brown <broonie@kernel.org>
Subject: linux-next: jdelvare-hwmon tree unfetchable
Date: Mon, 1 Sep 2014 13:28:08 +0100
Message-ID: <20140901132808.c7b08f4ffa7055dc28e6dac7@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__1_Sep_2014_13_28_08_+0100_KjME+lkDJit+TfwM"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__1_Sep_2014_13_28_08_+0100_KjME+lkDJit+TfwM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next merge of the jdelvare-hwmon tree got a conflict with Lin=
us'
tree which appeared to be due to the hwmon quilt series I got from Stephen =
being
based on v3.14-rc3 and subsequent changes from mainline interacting badly w=
ith
it. In addition I'm not able to check the original series since linux-fr.or=
g does
not resolve for me.

I'm really confused by what's going on here so I skipped the tree for today.

Thanks,
Mark

--Signature=_Mon__1_Sep_2014_13_28_08_+0100_KjME+lkDJit+TfwM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUBGZYAAoJELSic+t+oim9DlYP/iywPeIuH//epM30k8t96gKZ
Xr1YR3XRwWZHFPvhOV5+OtB//d1Zoc7/iokJl1kmLfZgHpBtEhyv3ORT1Pp5QLm1
pCoHyYaqQVT7K4BcpB31cyPU0+GTsX1F1fpiNpknmMyfmYd0Ptf2wnsUQ2P4ZTT1
4S7hh4g8NPus0b9IYg2d7KhePm/tWsmbbCx+FLTTKa5aMT27OD/h+N0W4y+s8aUn
GzlcWKDOJc/FZs0ZYxNoK3SjP4g0SzdHmI+Mp617466iEU5b8YNzzLbpDdaQIN6o
mFaoQsb8owqSNGCDvs7VOyj0mHalc3rPip9eM+QBZML/bNcpCgkc0Si7OA2O1yl3
ndG2Vut9MCjUvCNL+u7mr/QdXNv/c2BHw2m8dBeog2ykBhfLAYeuyJdVjXojFgFP
+ez4ku5IrwIvv0E13FB1ZlM+jznIHFRp/nJouVXQv9qusb+Ee7C7TGIQ3hEQn4II
PZM6hFxxuVpqkSv0RyWU6mZchTtYU+YmkRYeJ2V4pIKEh1281PsCexx3QMNw2lkP
twqbMl3O2n5Em3o/f7jwhB24uH0ABPTo5Vzhi1kPt7QvunO/L/Tpp7jGdfIBTrYI
EWlacpbj0tmVwOngpvdEPQ6feTPTsQUETT5V+MR4Y5AZE71vkTBdBZtU/K+3BrX1
VzzxtacF0dWQ1ldzHUiZ
=/f9U
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Sep_2014_13_28_08_+0100_KjME+lkDJit+TfwM--
