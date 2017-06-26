From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm tree
Date: Mon, 26 Jun 2017 16:30:12 +1000
Message-ID: <20170626163012.67294296@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751035AbdFZGaP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Jun 2017 02:30:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Yang <richard.weiyang@gmail.com>

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

mm/memory_hotplug.c: In function 'move_pfn_range_to_zone':
mm/memory_hotplug.c:891:16: warning: unused variable 'i' [-Wunused-variable]
  unsigned long i;
                ^

Introduced by commit

  7fb537987bb3 ("mm/memory_hotplug: remove duplicate call for set_page_links")

-- 
Cheers,
Stephen Rothwell
