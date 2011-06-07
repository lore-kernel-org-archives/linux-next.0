From: H Hartley Sweeten <hartleys@visionengravers.com>
Subject: RE: linux-next: manual merge of the gpio tree with the slave-dma
 tree
Date: Tue, 7 Jun 2011 11:17:26 -0500
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F3820B7E0F@AUSP01VMBX24.collaborationhost.net>
References: <20110607125723.8e591e42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail131.messagelabs.com ([216.82.242.99]:33543 "EHLO
	mail131.messagelabs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753222Ab1FGQRb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jun 2011 12:17:31 -0400
In-Reply-To: <20110607125723.8e591e42.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Grant Likely <grant.likely@secretlab.ca>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mika Westerberg <mika.westerberg@iki.fi>, Vinod Koul <vinod.koul@intel.com>

On Monday, June 06, 2011 7:57 PM, Stephen Rothwell wrote:
> Hi Grant,
> 
> Today's linux-next merge of the gpio tree got a conflict in
> arch/arm/mach-ep93xx/Makefile between commit 8e4a93008db7 ("ep93xx:
> remove the old M2P DMA code") from the slave-dma tree and commit
> c6b52c13de44 ("gpio/ep93xx: move driver to drivers/gpio") from the gpio
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc arch/arm/mach-ep93xx/Makefile
> index 21e721a,6b7c41d..0000000
> --- a/arch/arm/mach-ep93xx/Makefile
> +++ b/arch/arm/mach-ep93xx/Makefile
> @@@ -1,7 -1,7 +1,7 @@@
>   #
>   # Makefile for the linux kernel.
>   #
> - obj-y			:= core.o clock.o gpio.o
>  -obj-y			:= core.o clock.o dma-m2p.o
> ++obj-y			:= core.o clock.o
>   obj-m			:=
>   obj-n			:=
>   obj-			:=

Stephen,

This is, of course, the correct fix.  If you want it:

Acked-by: H Hartley Sweeten <hsweeten@visionengravers.com>

Thanks!