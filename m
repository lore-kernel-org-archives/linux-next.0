From: Jimi Xenidis <jimix@pobox.com>
Subject: Re: [PATCH] powerpc/of: add OF_DYNAMIC for chroma
Date: Mon, 20 Feb 2012 08:12:27 -0600
Message-ID: <5A594805-C5CE-46E7-A15F-DF86E6FE6C42@pobox.com>
References: <5145.1329691681@neuling.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:55529 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519Ab2BTOMc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Feb 2012 09:12:32 -0500
Received: by ggnh1 with SMTP id h1so2556933ggn.19
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2012 06:12:32 -0800 (PST)
In-Reply-To: <5145.1329691681@neuling.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: grant.likely@secretlab.ca, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org, benh@kernel.crashing.org


On Feb 19, 2012, at 4:48 PM, Michael Neuling wrote:

> linux next-20120217 compiling ppc64e_defconfig fails with:
> 
> arch/powerpc/platforms/wsp/h8.c: In function 'wsp_h8_getaddr':
> arch/powerpc/platforms/wsp/h8.c:116: error: implicit declaration of function 'of_detach_node'
> 
> The below fixes this by selecting the new OF_DYNAMIC when PPC_CHROMA.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Acked-by: Jimi Xenidis <jimix@pobox.com>

> 
> diff --git a/arch/powerpc/platforms/wsp/Kconfig b/arch/powerpc/platforms/wsp/Kconfig
> index 57d22a2..79d2225 100644
> --- a/arch/powerpc/platforms/wsp/Kconfig
> +++ b/arch/powerpc/platforms/wsp/Kconfig
> @@ -25,6 +25,7 @@ config PPC_CHROMA
> 	bool "PowerEN PCIe Chroma Card"
> 	select EPAPR_BOOT
> 	select PPC_WSP
> +	select OF_DYNAMIC
> 	default y
> 
> endmenu
