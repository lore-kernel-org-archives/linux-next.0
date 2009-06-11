From: Pekka J Enberg <penberg@cs.helsinki.fi>
Subject: Re: next-20090611: SLUB: Unable to allocate memory on node -1
Date: Thu, 11 Jun 2009 16:22:02 +0300 (EEST)
Message-ID: <Pine.LNX.4.64.0906111621240.13984@melkki.cs.Helsinki.FI>
References: <a4423d670906110603s42bf0287p848b00c2cc786cc1@mail.gmail.com>
 <84144f020906110612t3102efdev39e77b6429013176@mail.gmail.com>
 <a4423d670906110615q10579f17u5b870fc4b1cd977@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756184AbZFKNW1@vger.kernel.org>
In-Reply-To: <a4423d670906110615q10579f17u5b870fc4b1cd977@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mel Gorman <mel@csn.ul.ie>
List-Id: linux-next.vger.kernel.org

On Thu, 11 Jun 2009, Alexander Beregalov wrote:
> > There should be a stack trace here printed out by the page allocator.
> > Can you post that too?
> 
> I do not see it:

Aah, it's a false positive. The following patch ought to fix it.

			Pekka

>From d3b9557331bf4b73b80632b15eed062bf30683ac Mon Sep 17 00:00:00 2001
From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Thu, 11 Jun 2009 16:18:09 +0300
Subject: [PATCH] SLUB: Don't print out OOM warning for __GFP_NOFAIL

We must check for __GFP_NOFAIL like the page allocator does; otherwise we end
up with false positives. While at it, add the printk_ratelimit() check in SLUB
as well.

Cc: Alexander Beregalov <a.beregalov@gmail.com>
Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
---
 mm/slub.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index c0d5341..4d7cabf 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1631,7 +1631,8 @@ new_slab:
 		c->page = new;
 		goto load_freelist;
 	}
-	slab_out_of_memory(s, gfpflags, node);
+	if (!(gfpflags & __GFP_NOWARN) && printk_ratelimit())
+		slab_out_of_memory(s, gfpflags, node);
 	return NULL;
 debug:
 	if (!alloc_debug_processing(s, c->page, object, addr))
-- 
1.6.0.4
