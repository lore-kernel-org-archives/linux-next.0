From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the samsung tree with the arm-soc tree
Date: Thu, 31 Jan 2013 01:48:01 +1100
Message-ID: <20130131014801.09c81e1826a2fb234de85550@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5126921959378123459=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--===============5126921959378123459==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__31_Jan_2013_01_48_01_+1100_N7=F5Od0N6S7fxsV"

--Signature=_Thu__31_Jan_2013_01_48_01_+1100_N7=F5Od0N6S7fxsV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kukjin,

Today's linux-next merge of the samsung tree got a conflict in
drivers/gpio/gpio-samsung.c between commits f69254328793 ("ARM: dts: Fix
compatible value of pinctrl module on EXYNOS5440") and b533c8685b16
("ARM: dts: fix compatible value for exynos pinctrl") from the arm-soc
tree and commit bda7f6d4e198 ("gpio: samsung: skip gpiolib registration
if pinctrl support is enabled for exynos5250") from the samsung tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpio/gpio-samsung.c
index b2016ed,0d46db6..0000000
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@@ -3023,9 -3023,9 +3022,10 @@@ static __init int samsung_gpiolib_init(
  	*/
  	struct device_node *pctrl_np;
  	static const struct of_device_id exynos_pinctrl_ids[] =3D {
 -		{ .compatible =3D "samsung,pinctrl-exynos4210", },
 -		{ .compatible =3D "samsung,pinctrl-exynos4x12", },
 -		{ .compatible =3D "samsung,pinctrl-exynos5250", },
 +		{ .compatible =3D "samsung,exynos4210-pinctrl", },
 +		{ .compatible =3D "samsung,exynos4x12-pinctrl", },
++		{ .compatible =3D "samsung,exynos5250-pinctrl", },
 +		{ .compatible =3D "samsung,exynos5440-pinctrl", },
  	};
  	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
  		if (pctrl_np && of_device_is_available(pctrl_np))

--Signature=_Thu__31_Jan_2013_01_48_01_+1100_N7=F5Od0N6S7fxsV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRCTKhAAoJEECxmPOUX5FEF4kP/Rxq6WCtEf7StTEzbLJtm62o
qN4tsmjKIqhb2G+DsS7QY3DwR1qRo0/fmKCOu6td2gkX1iiTeKSeu2LN1a5aA3NM
7CjFU/TGkIWiryurn9bdq2KP27AzLw61KbqZjeYzLdpzvdQTtPJKXid2nZtWK2bh
IBWSEhUfCnG+iz0A87V7DDkVu8oXgTNSa+QJ8qcfKlrN+ZcNNTiz8Pu26l2Jn8Jc
VtoPHEtRTqzjCixxjyrsyqeWGXEg7nkjxgj2mSvmcN555c1i0r5SJwqgOzae/bJW
56RHVSo3XPA88/UE2DfiQUrGWFjfLJenMeLKiSKsMxq48CHUlthQ4/M53P+AFdvs
2anCoAc1snkcxHpJ3+1Ud82a1laK1YtCCjS2MG+4AqevxVmOjuiSpwdmliWu7UP6
1I7JccxtGkXoIm0ZwHy3OTq75j8Q3XsJH3ZTXV7RJXLewJ1ZqM4IVAotgynkl1W9
iAdms2oHyi/R/sjOWapyWiNalUXEehpeAgNazQfNlzwwoU6VsNpJK9LvSPJoFrfx
ya+KV3aXvy746/miUIlvXU31S9pnNKE0Tr18h/0o3JAtVzZ7o0s7sHQiyLYUMqEJ
00Rn1EFllJ6TJc0IBVHnw0tiqPcc5DDqLIycNsV2t6w/+fN9OsJb9e7Es3RIo0CF
bICxYmOAYYa5PwoTTIpH
=8CTF
-----END PGP SIGNATURE-----

--Signature=_Thu__31_Jan_2013_01_48_01_+1100_N7=F5Od0N6S7fxsV--


--===============5126921959378123459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5126921959378123459==--
