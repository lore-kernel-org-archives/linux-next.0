From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 19 May 2017 14:44:32 +1000
Message-ID: <20170519144432.0191fdf8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53133 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750728AbdESEoh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 May 2017 00:44:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

mm/vmstat.c: In function 'pagetypeinfo_showblockcount_print':
mm/vmstat.c:1230:8: warning: 'page' may be used uninitialized in this function [-Wmaybe-uninitialized]
   if (!memmap_valid_within(pfn, page, zone))
        ^

Introduced by commit

  36c7473b3c85 ("mm, vmstat: skip reporting offline pages in pagetypeinfo")

That really doesn't look good.

-- 
Cheers,
Stephen Rothwell
