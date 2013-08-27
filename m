From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the regulator tree with the pm tree
Date: Tue, 27 Aug 2013 15:37:54 +1000
Message-ID: <20130827153754.a28ce27a424e4cbeab503079@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__27_Aug_2013_15_37_54_+1000_E5qAAE6vV7i5Swd2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__27_Aug_2013_15_37_54_+1000_E5qAAE6vV7i5Swd2
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regulator tree got a conflict in
drivers/cpufreq/cpufreq-cpu0.c between commit f837a9b5ab05 ("cpufreq:
cpufreq-cpu0: remove device tree parsing for cpu nodes") from the  tree
and commit 7d748971c0c0 ("cpufreq: cpufreq-cpu0: Use
devm_regulator_get_optional()") from the regulator tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/cpufreq/cpufreq-cpu0.c
index bad620e,e9dedb2..0000000
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@@ -174,18 -174,30 +174,18 @@@ static struct cpufreq_driver cpu0_cpufr
 =20
  static int cpu0_cpufreq_probe(struct platform_device *pdev)
  {
 -	struct device_node *np, *parent;
 +	struct device_node *np;
  	int ret;
 =20
 -	parent =3D of_find_node_by_path("/cpus");
 -	if (!parent) {
 -		pr_err("failed to find OF /cpus\n");
 -		return -ENOENT;
 -	}
 -
 -	for_each_child_of_node(parent, np) {
 -		if (of_get_property(np, "operating-points", NULL))
 -			break;
 -	}
 +	cpu_dev =3D &pdev->dev;
 =20
 +	np =3D of_node_get(cpu_dev->of_node);
  	if (!np) {
  		pr_err("failed to find cpu0 node\n");
 -		ret =3D -ENOENT;
 -		goto out_put_parent;
 +		return -ENOENT;
  	}
 =20
- 	cpu_reg =3D devm_regulator_get(cpu_dev, "cpu0");
 -	cpu_dev =3D &pdev->dev;
 -	cpu_dev->of_node =3D np;
 -
+ 	cpu_reg =3D devm_regulator_get_optional(cpu_dev, "cpu0");
  	if (IS_ERR(cpu_reg)) {
  		/*
  		 * If cpu0 regulator supply node is present, but regulator is

--Signature=_Tue__27_Aug_2013_15_37_54_+1000_E5qAAE6vV7i5Swd2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSHDs3AAoJEECxmPOUX5FETU4P/i6CxKU7/WAm8s4Csi/igLu3
Adcp8dY7KVzthEEQMNOacV3tBptJWa+gqC5e9nuDfp+b6FCA5cT1scDQLkEQ5TUo
uhrG8v78/Gf3cG84SLyxqAbPxbz0WFT8GWEkChzNDai8g9wMYD1i+jgyn4PCUC0J
900bl4ZSkKJQnQBfvUVrYTWFNsKultWJnu5LNe2s7VINEhCegWC/CTAhhkdGGlU+
UjF3BWpgLoG7ecxMjpg/xb8ihBOTkT+A4jOina9aEMhM96n1VL4OASk2sA03achv
xqAUFTJs6MEZozFzlYR+lc/9bEb5Ipj1Cbp0uNFpHV3I8Nuz6EPwCmzm8p5LJKv/
/fdy9BNViRsJF79d+WE5bRgsuHDAdUEeXiym0XLmM6n9XJqM7RSY/m8/RebuNH9t
ECRDpZwxa3Gh3Kj/lcDjlS+FUoRpIdl4Sc5XliKwusAkvsnzjpPM3UivNf9NQEZ1
RJVu5lUl9RgVBB2zp+DzVtEtsAKE5u9QvVqXH+5+oRV0YChB4YXYjG90Wv0Y2RdQ
a8jl21EhB/LlFktD2XKBoUj/WySSUdJDq+KO7P4PGcxsQkP1vBDW6a42Lr9bONHx
/8ZjwOpHiZNc+f3IHMeLEugNmxjaISkIKXRYGA+H/BN7LYE6Bxjb7/TBIKb7eSLV
i56LkZs93wmwf/Jrw/4p
=jSbf
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Aug_2013_15_37_54_+1000_E5qAAE6vV7i5Swd2--
