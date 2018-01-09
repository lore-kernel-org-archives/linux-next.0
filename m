From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the tip tree
Date: Tue, 9 Jan 2018 16:02:44 +1100
Message-ID: <20180109160244.1f3811eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54605 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755464AbeAIFCr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Jan 2018 00:02:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andi Kleen <ak@linux.intel.com>, "Darren Hart (VMware)" <dvhart@infradead.org>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  arch/x86/platform/intel-mid/device_libs/platform_bt.c

between commit:

  9d0513d82f1a ("x86/platform/intel-mid: Revert "Make 'bt_sfi_data' const"")

from the tip tree and patch:

  "arch/x86/platform/intel-mid/device_libs/platform_bt.c: fix const confusion"

from the akpm tree.

I fixed it up (I dropped the akpm tree patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
