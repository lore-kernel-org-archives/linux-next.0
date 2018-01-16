From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the staging tree
Date: Tue, 16 Jan 2018 13:45:44 +1100
Message-ID: <20180116134544.5f999209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50239 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750807AbeAPCpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 21:45:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/staging/lustre/lnet/selftest/module.c: In function 'lnet_selftest_init':
drivers/staging/lustre/lnet/selftest/module.c:98:10: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
   return rc;
          ^~

Introduced by commit

  6106c0f82481 ("staging: lustre: lnet: convert selftest to use workqueues")

-- 
Cheers,
Stephen Rothwell
