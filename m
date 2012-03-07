From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH v2] ARM: pxa: fix regulator related build fail in
 magician_defconfig
Date: Wed, 7 Mar 2012 01:46:54 +0000 (GMT)
Message-ID: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
References: <1331066978-24774-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1331066978-24774-1-git-send-email-paul.gortmaker@windriver.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@opensource.wolfsonmicro.com, haojian.zhuang@gmail.com
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

--- On Tue, 6/3/12, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> commit
> 737f360d5bef5e01c6cfa755dca0b449a154c1e0 (linux-next)
> =

> =A0 "regulator: Remove support for supplies specified by
> struct device"
> =

> deletes the field from the struct, but this platform was
> still trying
> to set those fields.=A0 Convert them to use the
> REGULATOR_SUPPLY macro
> so as to fix this failure:
> =

> arch/arm/mach-pxa/magician.c:581: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/magician.c:581: warning: initialization
> from incompatible pointer type
> arch/arm/mach-pxa/magician.c:585: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/magician.c:585: warning: initialization
> from incompatible pointer type
> =

> arch/arm/mach-pxa/hx4700.c:683: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/hx4700.c:683: warning: initialization from
> incompatible pointer type
> arch/arm/mach-pxa/hx4700.c:687: error: unknown field 'dev'
> specified in initializer
> arch/arm/mach-pxa/hx4700.c:687: warning: initialization from
> incompatible pointer type
> =

> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> =

> [v2: convert to using REGULATOR_SUPPLY instead of just
> deleting the
>  instances of setting the .dev field ]
> =

> diff --git a/arch/arm/mach-pxa/hx4700.c
> b/arch/arm/mach-pxa/hx4700.c
> index f2c23ea..53c3366 100644
> --- a/arch/arm/mach-pxa/hx4700.c
> +++ b/arch/arm/mach-pxa/hx4700.c
> @@ -679,14 +679,8 @@ static struct platform_device
> power_supply =3D {
> =A0 */
>  =

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
> "gpio_vbus"),
> +=A0=A0=A0 REGULATOR_SUPPLY("ac_draw",
> "power_supply"),
>  };

The above hx4700 patch yields the following warnings:

_regulator_get: gpio-vbus supply vbus_draw not found, using dummy regulator
_regulator_get: pda-power supply ac_draw not found, using dummy regulator

I suggest the following lines instead:

	REGULATOR_SUPPLY("vbus_draw", "gpio-vbus"),
	REGULATOR_SUPPLY("ac_draw", "pda-power"),
