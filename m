From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Tue, 22 Nov 2016 16:48:14 +1100
Message-ID: <20161122164814.5468d854@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750942AbcKVFsR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Nov 2016 00:48:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Len Brown <len.brown@intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, Arnd Bergmann <arnd@arndb.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/idle/Kconfig
  drivers/idle/i7300_idle.c

between commits:

  f2f31bb3f50b ("idle / i7300: Add CONFIG_PCI dependency")
  ccd29e2ed6bc ("i7300_idle: avoid theoretical uninitialized data usage")
  881ef1847b2d ("i7300_idle: fix typo in parameter description")

from the pm tree and commit:

  b65ce83f2a60 ("i7300_idle: Remove this driver")

from the tip tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
