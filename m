From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/8] arm64: defconfig: enable EFI_VARS and
 EFI_CAPSULE_LOADER
Date: Wed, 12 Apr 2017 17:14:42 +0100
Message-ID: <20170412161442.GB7153@leverpostej>
References: <1492012980-11650-1-git-send-email-timur@codeaurora.org>
 <1492012980-11650-6-git-send-email-timur@codeaurora.org>
 <a80a1b2f-e5fa-36c7-5175-8a9718584720@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:46372 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752500AbdDLQPG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 12:15:06 -0400
Content-Disposition: inline
In-Reply-To: <a80a1b2f-e5fa-36c7-5175-8a9718584720@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Timur Tabi <timur@codeaurora.org>, linux-arm-kernel@lists.infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, maxime.ripard@free-electrons.com, olof@lixom.net, Wei Xu <xuwei5@hisilicon.com>, ard.biesheuvel@linaro.org, leif.lindholm@arm.com

On Wed, Apr 12, 2017 at 05:13:20PM +0100, Robin Murphy wrote:
> On 12/04/17 17:02, Timur Tabi wrote:
> > Many ARM64 server systems boot via EFI, so enable support for some EFI
> > options to allow applications to interact with EFI.
> > 
> > CONFIG_EFI_VARS enables sysfs support for reading and writing variables
> 
> Isn't efivarfs preferred for that these days, or have I imagined that?
> 
> Robin.

Ard, Leif?

Mark.

> > CONFIG_EFI_CAPSULE_LOADER allows the user to update the EFI firmware.
> > 
> > Signed-off-by: Timur Tabi <timur@codeaurora.org>
> > ---
> >  arch/arm64/configs/defconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 1e5c516..cdc8698 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -485,6 +485,8 @@ CONFIG_PHY_XGENE=y
> >  CONFIG_PHY_TEGRA_XUSB=y
> >  CONFIG_ARM_SCPI_PROTOCOL=y
> >  CONFIG_RASPBERRYPI_FIRMWARE=y
> > +CONFIG_EFI_VARS=y
> > +CONFIG_EFI_CAPSULE_LOADER=y
> >  CONFIG_ACPI=y
> >  CONFIG_EXT2_FS=y
> >  CONFIG_EXT3_FS=y
> > 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
