From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: input tree build failure
Date: Sun, 24 Jan 2010 22:46:03 -0800
Message-ID: <20100125064602.GA22833@core.coreip.homeip.net>
References: <20100125165219.cd0b869d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-px0-f182.google.com ([209.85.216.182]:50981 "EHLO
	mail-px0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752695Ab0AYGqJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2010 01:46:09 -0500
Content-Disposition: inline
In-Reply-To: <20100125165219.cd0b869d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>, John Linn <john.linn@xilinx.com>

On Mon, Jan 25, 2010 at 04:52:19PM +1100, Stephen Rothwell wrote:
> Hi Dmitry,
> 
> Today's linux-next build (powerpc ppc44x_defconfig) failed like this:
> 
> drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_probe':
> drivers/input/serio/xilinx_ps2.c:273: error: incompatible type for argument 1 of 'resource_size'
> include/linux/ioport.h:132: note: expected 'const struct resource *' but argument is of type 'struct resource'
> drivers/input/serio/xilinx_ps2.c: In function 'xps2_of_remove':
> drivers/input/serio/xilinx_ps2.c:347: error: incompatible type for argument 1 of 'resource_size'
> include/linux/ioport.h:132: note: expected 'const struct resource *' but argument is of type 'struct resource'
> 
> Please at least build test this stuff ...
> 
> Caused by commit cc7bbfa322b48be82b1c86a104433d4ac349da79 ("Input:
> xilinx_ps2 - use resource_size").
> 
> I have reverted that commit for today.
> 

Argh, sorry about that. I adjusted the commit; John, Tobias, please
verify (next branch in my tree).

Thanks.

-- 
Dmitry
