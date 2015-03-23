From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm-perf tree
Date: Mon, 23 Mar 2015 20:11:41 +0530
Message-ID: <CAM4voanC-ur=A-UJ+Jw4qECUOnd-gZ2V87794tEVWJOqaqDT+g@mail.gmail.com>
References: <20150323113318.0319c248@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f41.google.com ([209.85.192.41]:33995 "EHLO
	mail-qg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752106AbbCWOlr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2015 10:41:47 -0400
In-Reply-To: <20150323113318.0319c248@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Will Deacon <will.deacon@arm.com>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hi Stephen,

On Mon, Mar 23, 2015 at 6:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in
> drivers/bus/Kconfig between commit c9966c98697a ("arm-cci: Split the
> code for PMU vs driver support") from the arm-perf tree and commit
> 13fbf3c8d0f7 ("drivers: bus: Sort Kconfig entries alphabetically") from
> the arm-soc tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Not sure if this has been reported elsewhere, but I am seeing core
boot-up failures on the exynos5420 with next-20150323 due to this.
Your conflict fix is missing the ARM_CCI symbol because of which the
CCI does not get enabled.

Suzuki, can you confirm ?

Regards,
Abhilash
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>
> diff --cc drivers/bus/Kconfig
> index 79e297b1f221,7e9c2674af81..000000000000
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@@ -4,6 -4,21 +4,38 @@@
>
>   menu "Bus devices"
>
>  -config ARM_CCI
>  -      bool "ARM CCI driver support"
> ++config ARM_CCI400_PORT_CTRL
> ++      bool
> +       depends on ARM && OF && CPU_V7
> ++      select ARM_CCI400_COMMON
> +       help
>  -        Driver supporting the CCI cache coherent interconnect for ARM
>  -        platforms.
> ++        Low level power management driver for CCI400 cache coherent
> ++        interconnect for ARM platforms.
> ++
> ++config ARM_CCI400_PMU
> ++      bool "ARM CCI400 PMU support"
> ++      default y
> ++      depends on ARM || ARM64
> ++      depends on HW_PERF_EVENTS
> ++      select ARM_CCI400_COMMON
> ++      help
> ++        Support for PMU events monitoring on the ARM CCI cache coherent
> ++        interconnect.
> ++
> ++        If unsure, say Y
> ++
> ++config ARM_CCI400_COMMON
> ++      bool
> ++      select ARM_CCI
> +
> + config ARM_CCN
> +       bool "ARM CCN driver support"
> +       depends on ARM || ARM64
> +       depends on PERF_EVENTS
> +       help
> +         PMU (perf) driver supporting the ARM CCN (Cache Coherent Network)
> +         interconnect.
> +
>   config BRCMSTB_GISB_ARB
>         bool "Broadcom STB GISB bus arbiter"
>         depends on ARM || MIPS
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
