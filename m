From: Pekka J Enberg <penberg@cs.helsinki.fi>
Subject: Re: [Powerpc/SLQB] Next June 06 : BUG during scsi initialization
Date: Sun, 7 Jun 2009 11:06:00 +0300 (EEST)
Message-ID: <Pine.LNX.4.64.0906071105030.11309@melkki.cs.Helsinki.FI>
References: <20090511161442.3e9d9cb9.sfr@canb.auug.org.au> <4A081002.4050802@in.ibm.com>
 <4A2909E8.6000507@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:47002 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753866AbZFGIF7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 7 Jun 2009 04:05:59 -0400
In-Reply-To: <4A2909E8.6000507@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Nick Piggin <npiggin@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Hi Sachin,

On Fri, 5 Jun 2009, Sachin Sant wrote:
> I can still recreate this bug on a Power 6 hardware with today's next tree.
> I can recreate this problem at will.
> Let me know if i can help in debugging this problem.

Can you please reproduce the issue with this debugging patch applied and 
post the result?

			Pekka

>From 27189e1e1d2890e98cb029bd1121c86b8c53ecd9 Mon Sep 17 00:00:00 2001
From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Sun, 7 Jun 2009 11:03:50 +0300
Subject: [PATCH] slqb: debugging

Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
---
 mm/slqb.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/mm/slqb.c b/mm/slqb.c
index 29bb005..dce39d4 100644
--- a/mm/slqb.c
+++ b/mm/slqb.c
@@ -1382,6 +1382,8 @@ static noinline void *__slab_alloc_page(struct kmem_cache *s,
 		l = &c->list;
 		page->list = l;
 
+		printk(KERN_INFO "%s: cpu=%d, cache_cpu=%p, cache_list=%p\n", __func__, cpu, c, l);
+
 		spin_lock(&l->page_lock);
 		l->nr_slabs++;
 		l->nr_partial++;
@@ -1393,11 +1395,15 @@ static noinline void *__slab_alloc_page(struct kmem_cache *s,
 	} else {
 #ifdef CONFIG_NUMA
 		struct kmem_cache_node *n;
+		int nid;
 
-		n = s->node_slab[slqb_page_to_nid(page)];
+		nid = slqb_page_to_nid(page);
+		n = s->node_slab[nid];
 		l = &n->list;
 		page->list = l;
 
+		printk(KERN_INFO "%s: nid=%d, cache_node=%p, cache_list=%p\n", __func__, nid, n, l);
+
 		spin_lock(&n->list_lock);
 		spin_lock(&l->page_lock);
 		l->nr_slabs++;
@@ -2028,6 +2034,8 @@ static void free_kmem_cache_nodes(struct kmem_cache *s)
 	for_each_node_state(node, N_NORMAL_MEMORY) {
 		struct kmem_cache_node *n;
 
+		printk(KERN_INFO "%s: cache=%s, node=%d\n", __func__, s->name, node);
+
 		n = s->node_slab[node];
 		if (n) {
 			kmem_cache_free(&kmem_node_cache, n);
@@ -2043,8 +2051,11 @@ static int alloc_kmem_cache_nodes(struct kmem_cache *s)
 	for_each_node_state(node, N_NORMAL_MEMORY) {
 		struct kmem_cache_node *n;
 
+		printk(KERN_INFO "%s: cache=%s, node=%d\n", __func__, s->name, node);
+
 		n = kmem_cache_alloc_node(&kmem_node_cache, GFP_KERNEL, node);
 		if (!n) {
+			printk(KERN_INFO "%s: %s: kmem_cache_alloc_node() failed for node %d\n", __func__, s->name, node);
 			free_kmem_cache_nodes(s);
 			return 0;
 		}
-- 
1.5.6.4

> 
