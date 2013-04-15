From: Kim Phillips <kim.phillips@freescale.com>
Subject: Re: [PATCH] powerpc: fix usage of setup_pci_atmu()
Date: Mon, 15 Apr 2013 11:30:17 -0500
Message-ID: <20130415113017.69fd8dacd93264b9c9b54001@freescale.com>
References: <1363201636-7318-1-git-send-email-galak@kernel.crashing.org>
	<5881.1366004521@ale.ozlabs.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]:51416
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755859Ab3DOQeB (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Apr 2013 12:34:01 -0400
In-Reply-To: <5881.1366004521@ale.ozlabs.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: Kumar Gala <galak@kernel.crashing.org>, sfr@canb.auug.org.au, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

On Mon, 15 Apr 2013 15:42:01 +1000
Michael Neuling <mikey@neuling.org> wrote:

> Linux next is currently failing to compile mpc85xx_defconfig with:
>   arch/powerpc/sysdev/fsl_pci.c:944:2: error: too many arguments to function 'setup_pci_atmu'
> 
> This is caused by (from Kumar's next branch):
>   commit 34642bbb3d12121333efcf4ea7dfe66685e403a1
>   Author: Kumar Gala <galak@kernel.crashing.org>
>   powerpc/fsl-pci: Keep PCI SoC controller registers in pci_controller
> 
> Which changed definition of setup_pci_atmu() but didn't update one of
> the callers.  Below fixes this.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> ---
> Kumar: this is for your next tree

Reviewed-by: Kim Phillips <kim.phillips@freescale.com>

Thanks,

Kim
