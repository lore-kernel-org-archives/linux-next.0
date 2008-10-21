From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the proc tree
Date: Tue, 21 Oct 2008 18:02:20 +1100
Message-ID: <20081021180220.8e84ce12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36795 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751685AbYJUIjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 04:39:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Rik van Riel <riel@redhat.com>

Hi Alexey,

Today's linux-next merge of the proc tree got a conflict in mm/hugetlb.c
between commit 4f98a2fee8acdb4ac84545df98cccecfd130f8db ("vmscan: split
LRU lists into anon & file sets") from Linus' tree and commit
d8ad172f12c10f974821247773a8b82ba7965ae4 ("proc: switch /proc/meminfo to
seq_file") from the proc tree.

Just a context change.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/hugetlb.c
index ce8cbb2,85ade11..0000000
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@@ -1455,15 -1456,15 +1456,15 @@@ int hugetlb_overcommit_handler(struct c
  
  #endif /* CONFIG_SYSCTL */
  
- int hugetlb_report_meminfo(char *buf)
+ void hugetlb_report_meminfo(struct seq_file *m)
  {
  	struct hstate *h = &default_hstate;
- 	return sprintf(buf,
+ 	seq_printf(m,
 -			"HugePages_Total: %5lu\n"
 -			"HugePages_Free:  %5lu\n"
 -			"HugePages_Rsvd:  %5lu\n"
 -			"HugePages_Surp:  %5lu\n"
 -			"Hugepagesize:    %5lu kB\n",
 +			"HugePages_Total:   %5lu\n"
 +			"HugePages_Free:    %5lu\n"
 +			"HugePages_Rsvd:    %5lu\n"
 +			"HugePages_Surp:    %5lu\n"
 +			"Hugepagesize:   %8lu kB\n",
  			h->nr_huge_pages,
  			h->free_huge_pages,
  			h->resv_huge_pages,
