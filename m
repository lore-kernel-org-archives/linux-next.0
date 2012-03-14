From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in magician_defconfig
Date: Wed, 14 Mar 2012 16:38:20 +0800
Message-ID: <CAN1soZzDRR4XQ34WDL48=j+Ff8t5fsCFaccqZAKOQ1OAPeDXcA@mail.gmail.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
	<1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:35769 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751907Ab2CNIiV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Mar 2012 04:38:21 -0400
Received: by vcqp1 with SMTP id p1so1637529vcq.19
        for <linux-next@vger.kernel.org>; Wed, 14 Mar 2012 01:38:20 -0700 (PDT)
In-Reply-To: <1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: broonie@opensource.wolfsonmicro.com, lost.distance@yahoo.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org

On Fri, Mar 9, 2012 at 5:34 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> commit 737f360d5bef5e01c6cfa755dca0b449a154c1e0 (linux-next)
>
> =A0"regulator: Remove support for supplies specified by struct device=
"
>
> deletes the field from the struct, but this platform was still trying
> to set those fields. =A0Convert them to use the REGULATOR_SUPPLY macr=
o.
>
> arch/arm/mach-pxa/magician.c:581: error: unknown field 'dev' specifie=
d in initializer
> arch/arm/mach-pxa/magician.c:581: warning: initialization from incomp=
atible pointer type
> arch/arm/mach-pxa/magician.c:585: error: unknown field 'dev' specifie=
d in initializer
> arch/arm/mach-pxa/magician.c:585: warning: initialization from incomp=
atible pointer type
>
> arch/arm/mach-pxa/hx4700.c:683: error: unknown field 'dev' specified =
in initializer
> arch/arm/mach-pxa/hx4700.c:683: warning: initialization from incompat=
ible pointer type
> arch/arm/mach-pxa/hx4700.c:687: error: unknown field 'dev' specified =
in initializer
> arch/arm/mach-pxa/hx4700.c:687: warning: initialization from incompat=
ible pointer type
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>
> [v3: fix arg2 in REGULATOR_SUPPLY to have correct names ]
>
> diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
> index f2c23ea..b6a338b 100644
> --- a/arch/arm/mach-pxa/hx4700.c
> +++ b/arch/arm/mach-pxa/hx4700.c
> @@ -679,14 +679,8 @@ static struct platform_device power_supply =3D {
> =A0*/
>
> =A0static struct regulator_consumer_supply bq24022_consumers[] =3D {
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev =3D &gpio_vbus.dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .supply =3D "vbus_draw",
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev =3D &power_supply.dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .supply =3D "ac_draw",
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 REGULATOR_SUPPLY("vbus_draw", "gpio-vbus"),
> + =A0 =A0 =A0 REGULATOR_SUPPLY("ac_draw", "pda-power"),

How do you think about Mark's comments? Use dev_name() at here.
> =A0};
>
> =A0static struct regulator_init_data bq24022_init_data =3D {
> diff --git a/arch/arm/mach-pxa/magician.c b/arch/arm/mach-pxa/magicia=
n.c
> index 3d6baf9..1a18e63 100644
> --- a/arch/arm/mach-pxa/magician.c
> +++ b/arch/arm/mach-pxa/magician.c
> @@ -577,14 +577,8 @@ static struct platform_device power_supply =3D {
> =A0*/
>
> =A0static struct regulator_consumer_supply bq24022_consumers[] =3D {
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev =3D &gpio_vbus.dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .supply =3D "vbus_draw",
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev =3D &power_supply.dev,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .supply =3D "ac_draw",
> - =A0 =A0 =A0 },
> + =A0 =A0 =A0 REGULATOR_SUPPLY("vbus_draw", "gpio-vbus"),
> + =A0 =A0 =A0 REGULATOR_SUPPLY("ac_draw", "pda-power"),
> =A0};
>
> =A0static struct regulator_init_data bq24022_init_data =3D {
> --
> 1.7.9.1
>
