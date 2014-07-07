From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm tree
Date: Mon, 7 Jul 2014 09:22:36 +0100
Message-ID: <20140707082236.GX21766@n2100.arm.linux.org.uk>
References: <20140707112853.7f5a9323@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-1.arm.linux.org.uk ([78.32.30.217]:56882 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750855AbaGGIWr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 Jul 2014 04:22:47 -0400
Content-Disposition: inline
In-Reply-To: <20140707112853.7f5a9323@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On Mon, Jul 07, 2014 at 11:28:53AM +1000, Stephen Rothwell wrote:
> diff --cc arch/arm/mach-mvebu/headsmp-a9.S
> index 7c91ddb6f1f7,da5bb292b91c..000000000000
> --- a/arch/arm/mach-mvebu/headsmp-a9.S
> +++ b/arch/arm/mach-mvebu/headsmp-a9.S
> @@@ -14,8 -14,9 +14,10 @@@
>   
>   #include <linux/linkage.h>
>   #include <linux/init.h>
>  +#include <asm/assembler.h>
>   
> + #include <asm/assembler.h>
> + 

Obviously not quite correct - this looks like an automatic merge, something
that will have to be kept an eye on during the proper merge window.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
