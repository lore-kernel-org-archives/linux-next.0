From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the clockevents tree with the
 arm-soc tree
Date: Wed, 27 Jul 2016 08:08:45 +1000
Message-ID: <20160727080845.12b58ebe@canb.auug.org.au>
References: <20160707141226.2b9c1e15@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46188 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752549AbcGZWIs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2016 18:08:48 -0400
In-Reply-To: <20160707141226.2b9c1e15@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Linus <torvalds@linux-foundation.org>

Hi All,

On Thu, 7 Jul 2016 14:12:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Daniel,
> 
> Today's linux-next merge of the clockevents tree got a conflict in:
> 
>   arch/arm/Kconfig
> 
> between commit:
> 
>   c86f51737f8d ("ARM: clps711x: Switch to MULTIPLATFORM")
> 
> from the arm-soc tree and commit:
> 
>   250e46aa3bb3 ("clocksource/drivers/clps_711x: Add the COMPILE_TEST option")
> 
> from the clockevents tree.
> 
> I fixed it up (I used the arm-soc version of this file and then added
> the following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Jul 2016 13:59:06 +1000
> Subject: [PATCH] clocksource/drivers/clps_711x: fixup for "ARM: clps711x: Switch to MULTIPLATFORM"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/arm/mach-clps711x/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-clps711x/Kconfig b/arch/arm/mach-clps711x/Kconfig
> index 3b56197ccfd0..dc7c6edeab39 100644
> --- a/arch/arm/mach-clps711x/Kconfig
> +++ b/arch/arm/mach-clps711x/Kconfig
> @@ -3,8 +3,8 @@ menuconfig ARCH_CLPS711X
>  	depends on ARCH_MULTI_V4T
>  	select ARCH_REQUIRE_GPIOLIB
>  	select AUTO_ZRELADDR
> -	select CLKSRC_MMIO
>  	select CLKSRC_OF
> +	select CLPS711X_TIMER
>  	select COMMON_CLK
>  	select CPU_ARM720T
>  	select GENERIC_CLOCKEVENTS
> -- 
> 2.8.1

Since Linus has merged most of the tip tree now, this merge fixup is
required when (part of) the arm-soc tree is moerged with Linus' tree.
-- 
Cheers,
Stephen Rothwell
