From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the thermal tree with the kbuild
 tree
Date: Thu, 3 Jan 2019 09:19:55 +1100
Message-ID: <20190103091912.4fe2b2da@canb.auug.org.au>
References: <20181217105715.5da0b389@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BgvhUMfKshEZZG4L3ULlMrk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217105715.5da0b389@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/BgvhUMfKshEZZG4L3ULlMrk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Dec 2018 10:57:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the thermal tree got a conflict in:
>=20
>   drivers/thermal/Kconfig
>=20
> between commit:
>=20
>   17815cc6622c ("treewide: surround Kconfig file paths with double quotes=
")
>=20
> from the kbuild tree and commit:
>=20
>   3e8c4d31f8ed ("drivers: thermal: Move various drivers for intel platfor=
ms into a subdir")
>=20
> from the thermal tree.
>=20
> I fixed it up (I used the thermal tree version of this file and added
> the following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 17 Dec 2018 10:54:07 +1100
> Subject: [PATCH] drivers: thermal: fixup for Kconfig string parsing tight=
ening up
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thermal/intel/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
> index 9c06d4ad7c97..2e013eeb4a1d 100644
> --- a/drivers/thermal/intel/Kconfig
> +++ b/drivers/thermal/intel/Kconfig
> @@ -55,7 +55,7 @@ config INTEL_QUARK_DTS_THERMAL
>  	  underlying BIOS/Firmware.
> =20
>  menu "ACPI INT340X thermal drivers"
> -source drivers/thermal/intel/int340x_thermal/Kconfig
> +source "drivers/thermal/intel/int340x_thermal/Kconfig"
>  endmenu
> =20
>  config INTEL_BXT_PMIC_THERMAL
> --=20
> 2.19.1

I am still applying that patch every day.  It could be applied directly
to the thermal tree as it does not depend on the kbuild tree change.

--=20
Cheers,
Stephen Rothwell

--Sig_/BgvhUMfKshEZZG4L3ULlMrk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwtOQwACgkQAVBC80lX
0Gx1OAf/TnTyVR9QqpMLlR8PR2m18JuT6gAY+ejftGfFN9bERusH+XSxdyYReseT
/MQaZ6AVejaYMRo6LzLN8qZd3sgJDu86GAjNlhg9wLpzUJqYXrrkmnjvb2wcNhgw
tyQQ/OQHZtdArkMvpEO9kfQHNhU9LaI5NowSuOo+wdO1vcvBofiguD5Q7IwKKWQs
dxYaH4aHiw70su1QYF8zzmDUwf8PpadaKQoLir01QoTE2/ZxqK1qzLsu89nmY6yz
TsdqRdZjA1om5NaBUY7V4k6jRHK3r3W0bmU/f6HoP4lv3nQHj1OnZXMUShSmYg34
Ydl4GDN9HoDWWgU83JwOMd3U48wmNw==
=B1RX
-----END PGP SIGNATURE-----

--Sig_/BgvhUMfKshEZZG4L3ULlMrk--
