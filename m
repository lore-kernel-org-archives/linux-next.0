From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: build failure after merge of the i2c tree
Date: Thu, 19 May 2011 11:06:22 +0200
Message-ID: <20110519110622.681205cf@endymion.delvare>
References: <20110519132704.9785243e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:24196 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753120Ab1ESJIT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2011 05:08:19 -0400
In-Reply-To: <20110519132704.9785243e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 19 May 2011 13:27:04 +1000, Stephen Rothwell wrote:
> Hi Jean,
> 
> After merging the i2c tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> drivers/built-in.o: In function `i2c_i801_init':
> i2c-i801.c:(.init.text+0x88b9): undefined reference to `check_signature'
> 
> Probably caused by commit fc02951b3293 ("i2c-i801: Don't depend on other
> kernel driver config options").  Reverting that commit fixes the problem,
> so I have done that for today.

Oops, good catch. Fix is:

---
 drivers/i2c/busses/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-2.6.39-rc7.orig/drivers/i2c/busses/Kconfig	2011-05-19 09:02:42.000000000 +0200
+++ linux-2.6.39-rc7/drivers/i2c/busses/Kconfig	2011-05-19 11:03:36.000000000 +0200
@@ -79,6 +79,7 @@ config I2C_AMD8111
 config I2C_I801
 	tristate "Intel 82801 (ICH/PCH)"
 	depends on PCI
+	select CHECK_SIGNATURE if X86 && DMI
 	help
 	  If you say yes to this option, support will be included for the Intel
 	  801 family of mainboard I2C interfaces.  Specifically, the following

I'll fold it in the faulty patch so it should build fine tomorrow.

-- 
Jean Delvare
