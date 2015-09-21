From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: crisv32 runtime failure in -next due to 'page-flags: define
 behavior SL*B-related flags on compound pages'
Date: Mon, 21 Sep 2015 18:34:35 +0300 (EEST)
Message-ID: <20150921153435.CE98C138@black.fi.intel.com>
References: <55FAEA67.9000102@roeck-us.net>
 <20150918142507.GA30125@node.dhcp.inet.fi>
 <20150918145309.GG32685@axis.com>
 <55FC2A1F.8050207@roeck-us.net>
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:64291 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932164AbbIUPyf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Sep 2015 11:54:35 -0400
In-Reply-To: <55FC2A1F.8050207@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, Minchan Kim <minchan@kernel.org>, linux-cris-kernel@axis.com

Guenter Roeck wrote:
> On 09/18/2015 07:53 AM, Jesper Nilsson wrote:
> > On Fri, Sep 18, 2015 at 05:25:07PM +0300, Kirill A. Shutemov wrote:
> >> On Thu, Sep 17, 2015 at 09:29:27AM -0700, Guenter Roeck wrote:
> >>> Hi,
> >>>
> >>> my crisv32 qemu test fails with next-20150917 as follows.
> >>>
> >>> NET: Registered protocol family 16
> >>> kernel BUG at mm/slab.c:1648!
> >>> Linux 4.3.0-rc1-next-20150917 #1 Wed Sep 16 23:56:59 PDT 2015
> >>> Oops: 0000
> >>>
> >>> [ register dump follows ]
> >>>
> >>> See http://server.roeck-us.net:8010/builders/qemu-crisv32-next/builds/83/steps/qemubuildcommand/logs/stdio
> >>> for a complete log.
> >>
> >> Is there a chance to get proper backtrace?
> >
> > Yes, it should be possible with CONFIG_KALLSYMS=y in the kconfig.
> >
> 
> Good to know. I added it to my configuration.
> 
> Here it is:
> 
> kernel BUG at mm/slab.c:1648!

I still don't understand what's going on :(
Could you try with this instrumentation:

diff --git a/mm/slab.c b/mm/slab.c
index ce9c6531e6f7..10035d1a06d3 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -1645,7 +1645,11 @@ static void kmem_freepages(struct kmem_cache *cachep, struct page *page)
                sub_zone_page_state(page_zone(page),
                                NR_SLAB_UNRECLAIMABLE, nr_freed);
 
-       BUG_ON(!PageSlab(page));
+       if (!PageSlab(page)) {
+               dump_page(page, "page");
+               dump_page(compound_head(page), "compound_head(page)");
+               BUG();
+       }
        __ClearPageSlabPfmemalloc(page);
        __ClearPageSlab(page);
        page_mapcount_reset(page);
-- 
 Kirill A. Shutemov
