From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH -next] x86/mrst: force support code to be built
Date: Mon, 15 Nov 2010 13:43:25 +0000
Message-ID: <20101115134325.199ab1f3@lxorguk.ukuu.org.uk>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
	<20101113084437.a9707260.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:35347 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756453Ab0KONpN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Nov 2010 08:45:13 -0500
In-Reply-To: <20101113084437.a9707260.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org

On Sat, 13 Nov 2010 08:44:37 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix mrst.c build: make sure that its called functions are built.
> 
> arch/x86/built-in.o: In function `mrst_reboot':
> mrst.c:(.text+0x2250b): undefined reference to `intel_scu_ipc_simple_command'
> arch/x86/built-in.o: In function `mrst_power_off':
> mrst.c:(.text+0x2252e): undefined reference to `intel_scu_ipc_simple_command'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  arch/x86/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20101112.orig/arch/x86/Kconfig
> +++ linux-next-20101112/arch/x86/Kconfig
> @@ -387,6 +387,7 @@ config X86_MRST
>  	select APB_TIMER
>  	select I2C
>  	select SPI
> +	select X86_PLATFORM_DEVICES

We need the SCU so in fact we really want to select that. I'll send a
patch to Ingo.
