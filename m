From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in magician_defconfig
Date: Fri, 9 Mar 2012 02:47:24 +0000 (GMT)
Message-ID: <1331261244.65321.YahooMailClassic@web29007.mail.ird.yahoo.com>
References: <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nm14.bullet.mail.ird.yahoo.com ([77.238.189.67]:31918 "HELO
	nm14.bullet.mail.ird.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751526Ab2CICr0 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Mar 2012 21:47:26 -0500
In-Reply-To: <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: broonie@opensource.wolfsonmicro.com, haojian.zhuang@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks Paul.

The hx4700 patch works for me on linux-3.3.0-rc6.
I'm not able to test the magician patch.

Tested-by: Paul Parsons <lost.distance@yahoo.com>

--- On Thu, 8/3/12, Paul Gortmaker <paul.gortmaker@windriver.com> wrote=
:
> commit
> 737f360d5bef5e01c6cfa755dca0b449a154c1e0 (linux-next)
>=20
> =A0 "regulator: Remove support for supplies specified by
> struct device"
>=20
> deletes the field from the struct, but this platform was
> still trying
> to set those fields.=A0 Convert them to use the
> REGULATOR_SUPPLY macro.
>=20
> arch/arm/mach-pxa/magician.c:581: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/magician.c:581: warning: initialization
> from incompatible pointer type
> arch/arm/mach-pxa/magician.c:585: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/magician.c:585: warning: initialization
> from incompatible pointer type
>=20
> arch/arm/mach-pxa/hx4700.c:683: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/hx4700.c:683: warning: initialization from
> incompatible pointer type
> arch/arm/mach-pxa/hx4700.c:687: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/hx4700.c:687: warning: initialization from
> incompatible pointer type
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>=20
> [v3: fix arg2 in REGULATOR_SUPPLY to have correct names ]
>=20
> diff --git a/arch/arm/mach-pxa/hx4700.c
> b/arch/arm/mach-pxa/hx4700.c
> index f2c23ea..b6a338b 100644
> --- a/arch/arm/mach-pxa/hx4700.c
> +++ b/arch/arm/mach-pxa/hx4700.c
> @@ -679,14 +679,8 @@ static struct platform_device
> power_supply =3D {
> =A0 */
> =20
>  static struct regulator_consumer_supply bq24022_consumers[]
> =3D {
> -=A0=A0=A0 {
> -=A0=A0=A0 =A0=A0=A0 .dev =3D
> &gpio_vbus.dev,
> -=A0=A0=A0 =A0=A0=A0 .supply =3D
> "vbus_draw",
> -=A0=A0=A0 },
> -=A0=A0=A0 {
> -=A0=A0=A0 =A0=A0=A0 .dev =3D
> &power_supply.dev,
> -=A0=A0=A0 =A0=A0=A0 .supply =3D "ac_draw",
> -=A0=A0=A0 },
> +=A0=A0=A0 REGULATOR_SUPPLY("vbus_draw",
> "gpio-vbus"),
> +=A0=A0=A0 REGULATOR_SUPPLY("ac_draw",
> "pda-power"),
>  };
> =20
>  static struct regulator_init_data bq24022_init_data =3D {
> diff --git a/arch/arm/mach-pxa/magician.c
> b/arch/arm/mach-pxa/magician.c
> index 3d6baf9..1a18e63 100644
> --- a/arch/arm/mach-pxa/magician.c
> +++ b/arch/arm/mach-pxa/magician.c
> @@ -577,14 +577,8 @@ static struct platform_device
> power_supply =3D {
> =A0 */
> =20
>  static struct regulator_consumer_supply bq24022_consumers[]
> =3D {
> -=A0=A0=A0 {
> -=A0=A0=A0 =A0=A0=A0 .dev =3D
> &gpio_vbus.dev,
> -=A0=A0=A0 =A0=A0=A0 .supply =3D
> "vbus_draw",
> -=A0=A0=A0 },
> -=A0=A0=A0 {
> -=A0=A0=A0 =A0=A0=A0 .dev =3D
> &power_supply.dev,
> -=A0=A0=A0 =A0=A0=A0 .supply =3D "ac_draw",
> -=A0=A0=A0 },
> +=A0=A0=A0 REGULATOR_SUPPLY("vbus_draw",
> "gpio-vbus"),
> +=A0=A0=A0 REGULATOR_SUPPLY("ac_draw",
> "pda-power"),
>  };
> =20
>  static struct regulator_init_data bq24022_init_data =3D {
> --=20
> 1.7.9.1
>=20
>=20
