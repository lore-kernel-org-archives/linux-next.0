From: Liam Girdwood <lg@opensource.wolfsonmicro.com>
Subject: Re: linux-next:  voltage tree build failure
Date: Mon, 14 Jul 2008 14:48:56 +0100
Message-ID: <1216043336.27680.63.camel@localhost.localdomain>
References: <20080714233530.f0edf140.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35366 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754133AbYGNNs6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Jul 2008 09:48:58 -0400
In-Reply-To: <20080714233530.f0edf140.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Philipp Zabel <philipp.zabel@gmail.com>

On Mon, 2008-07-14 at 23:35 +1000, Stephen Rothwell wrote:
> Hi Liam,
> 
> Today's linux-next build (arm versatile_defconfig) failed like this:
> 
> drivers/regulator/Kconfig:59: can't open file "drivers/regulator/wm8350/Kconfig"
> 
> Commit 03ec18c8752a9b12006ffff23a5582b4482073ce ("regulator: TI bq24022
> Li-Ion Charger driver") added some includes to drivers/regulator/Kconfig
> of things that don't exist ...
> 
> Unfortunately, this broke all arm builds.

Philipp noticed earlier and it's now fixed. It's stuff that does exist
on my system so I should probably git clean -f -d next time I build
(before commit).

Thanks

Liam
