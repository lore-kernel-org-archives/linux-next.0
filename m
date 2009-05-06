From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: manual merge of the i2c tree with the arm-current
 tree
Date: Wed, 6 May 2009 10:31:38 +0200
Message-ID: <20090506103138.79525cd0@hyperion.delvare>
References: <20090506131031.83f1b04d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:34044 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751619AbZEFIbp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2009 04:31:45 -0400
In-Reply-To: <20090506131031.83f1b04d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Nicolas Pitre <nico@cam.org>, Wolfram Sang <w.sang@pengutronix.de>, Russell King <rmk@arm.linux.org.uk>, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

On Wed, 6 May 2009 13:10:31 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the i2c tree got a conflict in
> arch/arm/configs/kirkwood_defconfig arch/arm/configs/mv78xx0_defconfig
> arch/arm/configs/orion5x_defconfig between various commits from the
> arm-current tree and commit c637675d24618d8e0afe344096a1ad96986c4f50
> ("i2c/chips: Move max6875 to drivers/misc/eeprom") from the i2c tree.
> 
> The latter patch changes many defconfig files. Please don't do that -
> especially for those defconfigs that do not select the config options you
> are changing (which is the vast majority).  This just creates conflicts
> for no purpose at all.

I don't know exactly how defconfigs are handled, but I can imagine that
the responsible developer is running "make oldconfig" on the system in
question from times to times and copying the result back to the
defconfig file. The purpose of updating defconfig files is to make
configuration option renames transparent.

I can't see why defconfigs which select the option on question are
different from defconfigs not selecting it in this respect. In both
cases, if we don't update the file, a subsequent "make oldconfig" will
ask about the "new" option.

Or is there a specific procedure to update defconfig files which
answers "no" to all questions by default?

> It looks like the only defconfigs that may have needed updating are:
> 
> arch/mips/configs/bigsur_defconfig
> arch/mips/configs/mtx1_defconfig
> arch/powerpc/configs/ppc6xx_defconfig
> 
> I have dropped the changes to all the others (165 of them).  Please
> update the patch.

I have done so, sorry for the trouble.

-- 
Jean Delvare
