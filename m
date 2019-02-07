From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the opp tree with the cpufreq-arm tree
Date: Thu, 7 Feb 2019 11:47:26 +1100
Message-ID: <20190207114726.741da653@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nV2JY/799zyzBbiIdh3+g1k"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Taniya Das <tdas@codeaurora.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nV2JY/799zyzBbiIdh3+g1k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Viresh,

Today's linux-next merge of the opp tree got a conflict in:

  drivers/cpufreq/qcom-cpufreq-hw.c

between commit:

  5471b2c9bd08 ("cpufreq: qcom: Read voltage LUT and populate OPP")

from the cpufreq-arm tree and commit:

  597457d7e054 ("cpufreq: qcom-hw: Register an Energy Model")

from the opp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/cpufreq/qcom-cpufreq-hw.c
index 15f31e8c09c2,a16b9dca7ea3..000000000000
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@@ -224,13 -205,8 +224,15 @@@ static int qcom_cpufreq_hw_cpu_init(str
  		goto error;
  	}
 =20
 +	ret =3D dev_pm_opp_get_opp_count(cpu_dev);
 +	if (ret <=3D 0) {
 +		dev_err(cpu_dev, "Failed to add OPPs\n");
 +		ret =3D -ENODEV;
 +		goto error;
 +	}
 +
+ 	dev_pm_opp_of_register_em(policy->cpus);
+=20
  	policy->fast_switch_possible =3D true;
 =20
  	return 0;

--Sig_/nV2JY/799zyzBbiIdh3+g1k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxbgB4ACgkQAVBC80lX
0GzyXQf/TTJt2einDltTe1wTkY7UAEDMMKYZblGBnjigwEerH+Efyj6vfNzuhZRM
rqmKONIVCyxhMeJj5r2WXhjB7bmuwk6HpMDaK4v+S1ZKBDbwkzLT67ZbAaaIPKiB
jw++xPFL0cHIMH1H2qDbX99I04Q5uv4VFKoaVkC8JTM16ZF9Qsim9No0/uvNBCOp
SHDnV/XC15Ne7Q+SjcJQeFkOLrrBq3SgWzMOqrZSYoklVm6ETBRNdfTjI2/wqxSB
ZdThB2bhECDElj7s6Zc4DxJSQqUlQdERW2WooyHTUZ9Lko+hqUKv1zCqiboZt2W8
LrtT+Ehwn0K2BKryKfhWxc5dGMPeUw==
=lCoA
-----END PGP SIGNATURE-----

--Sig_/nV2JY/799zyzBbiIdh3+g1k--
