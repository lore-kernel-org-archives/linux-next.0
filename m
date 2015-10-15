From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build failure after merge of the mfd tree
Date: Thu, 15 Oct 2015 14:28:20 +0200
Message-ID: <5895082.5iDhc8pylg@wuerfel>
References: <20151015132602.7816b658@canb.auug.org.au> <7853704.H00KElTCBt@wuerfel> <20151015120407.GA31945@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:55409 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbbJOM2i (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 08:28:38 -0400
In-Reply-To: <20151015120407.GA31945@lst.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Thursday 15 October 2015 14:04:07 Christoph Hellwig wrote:
> On Thu, Oct 15, 2015 at 10:59:32AM +0200, Arnd Bergmann wrote:
> > The patch looks good, should we do something to prevent that from
> > becoming a problem when Linus pulls our branches?
> > 
> > This commit is at the bottom of my asm-generic git tree, so Lee could merge
> > that one commit into his tree and fix up the merge correctly.
> > 
> > However, I also now see that drivers/net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c
> > has the same problem, so maybe it's better to add a temporary file
> > with the old name containing "#include <linux/io-64-nonatomic-lo-hi.h>",
> > which I will remove in the following merge window or as a follow-up.
> 
> I guess we really need that.  Do you want to do a quick fixup or should I send
> a patch?

I've applied this one now.

	Arnd

>From b3d8d0ee6c9781d54d4180c5f1d36a12f0437c86 Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 15 Oct 2015 14:24:45 +0200
Subject: [PATCH] asm-generic: temporarily add back
 asm-generic/io-64-nonatomic-hi-lo.h

New users of this file still start showing up in linux-next, so it's
better to have a migration strategy. All existing users as of 4.3-rc4
are converted to use linux/io-64-nonatomic-hi-lo.h, and after 4.4-rc1
we can change all the new ones that have come in since, and then
remove this file again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: LKP project <lkp@linux.intel.com>

diff --git a/include/asm-generic/io-64-nonatomic-hi-lo.h b/include/asm-generic/io-64-nonatomic-hi-lo.h
new file mode 100644
index 000000000000..32b73abce1b0
--- /dev/null
+++ b/include/asm-generic/io-64-nonatomic-hi-lo.h
@@ -0,0 +1,2 @@
+/* XXX: delete asm-generic/io-64-nonatomic-hi-lo.h after converting new users */
+#include <linux/io-64-nonatomic-hi-lo.h>
