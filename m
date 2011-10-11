From: "Ujfalusi, Peter" <peter.ujfalusi@ti.com>
Subject: Re: linux-next: manual merge of the sound tree with the arm-soc tree
Date: Tue, 11 Oct 2011 09:15:02 +0300
Message-ID: <CAPo=G1yMZm-gcVsqL3V7o-y=+cFfeQxVup27_48wdtV0_LTnkQ@mail.gmail.com>
References: <20111011154304.f7fefc4f7f86b4b10348578c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog111.obsmtp.com ([74.125.149.205]:43409 "EHLO
	na3sys009aog111.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751175Ab1JKGPE convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Oct 2011 02:15:04 -0400
In-Reply-To: <20111011154304.f7fefc4f7f86b4b10348578c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@ti.com>, Misael Lopez Cruz <misael.lopez@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Tony Lindgren <tony@atomide.com>, Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

On Tue, Oct 11, 2011 at 7:43 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Takashi,
>
> Today's linux-next merge of the sound tree got a conflict in
> arch/arm/plat-omap/devices.c between commit 40246e0003f0 ("ARM: OMAP:
> mcbsp: Move out omap_mcbsp_register_board_cfg from plat-omap/devices"=
)
> from the arm-soc tree and commit d231f5cbac9e ("OMAP: McPDM: Convert
> McPDM device to omap_device") from the sound tree.
>
> Just overlapping removals. =A0I fixed it up (see below) and can carry=
 the
> fix as necessary.

Thanks, the McBSP change came via linux-omap while we had the McPDM
changes coming via sound tree.

>
> Mark, Liam: =A0That sound tree commit has a few Signed-off-by lines w=
ith no
> email addresses.

I can not track their new contact information. They used to work for TI=
, and I
have been advised to give them credit for their work on this area.
I could have added no longer valid email addresses...

--=20
P=E9ter

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
>
> diff --cc arch/arm/plat-omap/devices.c
> index acd132c,40eca9b..0000000
> --- a/arch/arm/plat-omap/devices.c
> +++ b/arch/arm/plat-omap/devices.c
> @@@ -24,44 -24,56 +24,11 @@@
> =A0#include <plat/tc.h>
> =A0#include <plat/board.h>
> =A0#include <plat/mmc.h>
> =A0-#include <mach/gpio.h>
> =A0#include <plat/menelaus.h>
> =A0-#include <plat/mcbsp.h>
> =A0#include <plat/omap44xx.h>
>
> - #if defined(CONFIG_SND_OMAP_SOC_MCPDM) || \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 defined(CONFIG_SND_OMAP_SOC_MCPDM_MODUL=
E)
> -
> - static struct resource mcpdm_resources[] =3D {
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mcpdm_me=
m",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0 =A0 =A0 =A0 =A0=3D OMAP44XX_=
MCPDM_BASE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0 =A0 =A0 =A0 =A0=3D OMAP44X=
X_MCPDM_BASE + SZ_4K,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IORESOURC=
E_MEM,
> - =A0 =A0 =A0 },
> - =A0 =A0 =A0 {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mcpdm_ir=
q",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0 =A0 =A0 =A0 =A0=3D OMAP44XX_=
IRQ_MCPDM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0 =A0 =A0 =A0 =A0=3D OMAP44X=
X_IRQ_MCPDM,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D IORESOURC=
E_IRQ,
> - =A0 =A0 =A0 },
> - };
> -
> - static struct platform_device omap_mcpdm_device =3D {
> - =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "omap-mcpdm",
> - =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> - =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(mcpdm_resources),
> - =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D mcpdm_resources,
> - };
> -
> - static void omap_init_mcpdm(void)
> - {
> - =A0 =A0 =A0 (void) platform_device_register(&omap_mcpdm_device);
> - }
> - #else
> - static inline void omap_init_mcpdm(void) {}
> - #endif
> -
> =A0/*----------------------------------------------------------------=
---------*/
>
> =A0-#if defined(CONFIG_OMAP_MCBSP) || defined(CONFIG_OMAP_MCBSP_MODUL=
E)
> =A0-
> =A0-static struct platform_device **omap_mcbsp_devices;
> =A0-
> =A0-void omap_mcbsp_register_board_cfg(struct resource *res, int res_=
count,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct omap_mcbsp_pla=
tform_data *config, int size)
> =A0-{
> =A0- =A0 =A0 =A0int i;
> =A0-
> =A0- =A0 =A0 =A0omap_mcbsp_devices =3D kzalloc(size * sizeof(struct p=
latform_device *),
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 GFP_KERNEL);
> =A0- =A0 =A0 =A0if (!omap_mcbsp_devices) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "Could not register M=
cBSP devices\n");
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0- =A0 =A0 =A0}
> =A0-
> =A0- =A0 =A0 =A0for (i =3D 0; i < size; i++) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0struct platform_device *new_mcbsp;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0int ret;
> =A0-
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0new_mcbsp =3D platform_device_alloc("=
omap-mcbsp", i + 1);
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!new_mcbsp)
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0platform_device_add_resources(new_mcb=
sp, &res[i * res_count],
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0res_count);
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0new_mcbsp->dev.platform_data =3D &con=
fig[i];
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D platform_device_add(new_mcbsp=
);
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0platform_device_put(n=
ew_mcbsp);
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_mcbsp_devices[i] =3D new_mcbsp;
> =A0- =A0 =A0 =A0}
> =A0-}
> =A0-
> =A0-#else
> =A0-void omap_mcbsp_register_board_cfg(struct resource *res, int res_=
count,
> =A0- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct omap_mcbsp_pla=
tform_data *config, int size)
> =A0-{ =A0}
> =A0-#endif
> =A0-
> =A0-/*---------------------------------------------------------------=
----------*/
> =A0-
> =A0#if defined(CONFIG_MMC_OMAP) || defined(CONFIG_MMC_OMAP_MODULE) ||=
 \
> =A0 =A0 =A0 =A0defined(CONFIG_MMC_OMAP_HS) || defined(CONFIG_MMC_OMAP=
_HS_MODULE)
>
>
