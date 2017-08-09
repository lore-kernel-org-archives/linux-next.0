From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the md tree
Date: Wed, 9 Aug 2017 13:14:40 +1000
Message-ID: <20170809131440.00ff9b04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56067 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752265AbdHIDOm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Aug 2017 23:14:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Song Liu <songliubraving@fb.com>

Hi Shaohua,

After merging the md tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/md/raid5-cache.c: In function 'r5c_journal_mode_show':
drivers/md/raid5-cache.c:2535:2: warning: ignoring return value of 'mddev_lock', declared with attribute warn_unused_result [-Wunused-result]
  mddev_lock(mddev);
  ^

Introduced by commit

  7f7abe0ec5bb ("md/r5cache: call mddev_lock/unlock() in r5c_journal_mode_show")

-- 
Cheers,
Stephen Rothwell
