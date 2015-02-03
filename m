From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Feb 3 (arc:defconfig build failure)
Date: Tue, 3 Feb 2015 10:42:18 -0800
Message-ID: <20150203184218.GA20822@roeck-us.net>
References: <20150203182010.73624992@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35724 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965948AbbBCSmZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Feb 2015 13:42:25 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YIiQb-000NvJ-Kp
	for linux-next@vger.kernel.org; Tue, 03 Feb 2015 18:42:25 +0000
Content-Disposition: inline
In-Reply-To: <20150203182010.73624992@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>, Peter Hurley <peter@hurleysoftware.com>

On Tue, Feb 03, 2015 at 06:20:10PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150202:
> 
> The target-updates tree gained a conflict against Linus' tree.
> 
> The clk tree gained conflicts against the arm-soc tree.
> 
> Non-merge commits (relative to Linus' tree): 7173
>  7143 files changed, 301126 insertions(+), 167764 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Building arc:defconfig ... failed
--------------
Error log:

drivers/built-in.o: In function `of_setup_earlycon':
(.init.text+0xb3e): undefined reference to `arc_early_base_baud'
drivers/built-in.o: In function `setup_earlycon':
(.init.text+0xcd0): undefined reference to `arc_early_base_baud'
make: *** [vmlinux] Error 1

This is due to "ARC: Dynamically determine BASE_BAUD from DeviceTree".
arc:defconfig does not define CONFIG_SERIAL_8250 and thus also not
CONFIG_SERIAL_8250_CONSOLE, but it looks like it is mandatory
after this patch.

Guenter
