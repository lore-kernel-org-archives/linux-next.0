From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Nov 20
Date: Thu, 20 Nov 2014 06:46:47 -0800
Message-ID: <20141120144647.GA6022@roeck-us.net>
References: <20141120184653.7c7764ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36999 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753977AbaKTOqy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 20 Nov 2014 09:46:54 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1XrT0Y-001nPY-4j
	for linux-next@vger.kernel.org; Thu, 20 Nov 2014 14:46:54 +0000
Content-Disposition: inline
In-Reply-To: <20141120184653.7c7764ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 20, 2014 at 06:46:53PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20141119:
> 
> The asm-generic tree lost its build failure.
> 
> The omap_dss2 tree still had its build failure for which I applied a patch.
> 
> The devicetree tree gained a conflict against the devicetree-current tree.
> 
> Non-merge commits (relative to Linus' tree): 7146
>  7140 files changed, 242712 insertions(+), 180038 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Build results:
	total: 133 pass: 130 fail: 3
Failed builds:
	arm:davinci_all_defconfig
	arm:orion5x_defconfig
	hexagon:defconfig

Qemu test results:
	total: 30 pass: 30 fail: 0

I assume the arm architecture folks will take care of the arm build failures,
so I did not have a look into those. The hexagon build failure is due to a
subtle change in files includes by other include files, resulting in a nested
dependency which is no longer met. That may be tricky to fix.

The qemu x86:nonsmp test only passes because I disabled PCI_MSI for this test.
Claim there is that qemu would not implement some IO_APIC related functionality
which is now mandatory.

Guenter
