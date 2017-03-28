From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the md tree
Date: Tue, 28 Mar 2017 15:40:22 +1100
Message-ID: <20170328154022.4aad73b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46111 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750830AbdC1Ekf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Mar 2017 00:40:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>

Hi Shaohua,

After merging the md tree, today's linux-next build (powerpc
pseries_le_defconfig) produced this warning:

drivers/md/raid1.c: In function 'raid1d':
drivers/md/raid1.c:2172:9: warning: 'page_len$' may be used uninitialized in this function [-Wmaybe-uninitialized]
     if (memcmp(page_address(ppages[j]),
         ^
drivers/md/raid1.c:2160:7: note: 'page_len$' was declared here
   int page_len[RESYNC_PAGES];
       ^

Introduced by commit

  60928a91b0b3 ("md: raid1: use bio helper in process_checks()")

-- 
Cheers,
Stephen Rothwell
