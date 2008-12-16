From: Mike Travis <travis@sgi.com>
Subject: [PATCH 1/1] cpumask: add alloc_cpumask_var_node
Date: Mon, 15 Dec 2008 18:32:51 -0800
Message-ID: <49471353.9070204@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:55086 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751556AbYLPCcy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 21:32:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


Add alloc_cpumask_var_node.  This will be needed in x86 code to
allocate the domain and old_domain cpumasks on the same node as
where the containing irq_cfg struct is allocated.

Additional documentation added to all the alloc_cpumask and free_cpumask
functions.

For submission via linux-next.

Signed-off-by: Mike Travis <travis@sgi.com>
---
 include/linux/cpumask.h |    1 
 lib/cpumask.c           |   60 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

--- linux-2.6-next.orig/include/linux/cpumask.h
+++ linux-2.6-next/include/linux/cpumask.h
@@ -1008,6 +1008,7 @@ static inline size_t cpumask_size(void)
 typedef struct cpumask *cpumask_var_t;
 
 bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags);
+bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags, int node);
 void alloc_bootmem_cpumask_var(cpumask_var_t *mask);
 void free_cpumask_var(cpumask_var_t mask);
 void free_bootmem_cpumask_var(cpumask_var_t mask);
--- linux-2.6-next.orig/lib/cpumask.c
+++ linux-2.6-next/lib/cpumask.c
@@ -76,6 +76,15 @@ int cpumask_any_but(const struct cpumask
 
 /* These are not inline because of header tangles. */
 #ifdef CONFIG_CPUMASK_OFFSTACK
+/**
+ * alloc_cpumask_var - return an allocated struct cpumask
+ * @mask: pointer to cpumask_var_t where the cpumask is returned
+ * @cpu: GFP_ flags
+ *
+ * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
+ * a nop returning a constant 1 (in <linux/cpumask.h>)
+ * Returns TRUE if memory allocation succeeded, FALSE otherwise.
+ */
 bool alloc_cpumask_var(cpumask_var_t *mask, gfp_t flags)
 {
 	if (likely(slab_is_available()))
@@ -98,17 +107,68 @@ bool alloc_cpumask_var(cpumask_var_t *ma
 }
 EXPORT_SYMBOL(alloc_cpumask_var);
 
+/**
+ * alloc_cpumask_var_node - return an allocated struct cpumask on a
+ * specific node.
+ * @mask: pointer to cpumask_var_t where the cpumask is returned
+ * @cpu: GFP_ flags
+ * @node: node to allocate memory on
+ *
+ * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
+ * a nop returning a constant 1 (in <linux/cpumask.h>)
+ * Returns TRUE if memory allocation succeeded, FALSE otherwise.
+ */
+bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags, int node)
+{
+	if (likely(slab_is_available()))
+		*mask = kmalloc_node(cpumask_size(), flags, node);
+	else {
+#ifdef CONFIG_DEBUG_PER_CPU_MAPS
+		printk(KERN_ERR
+			"=> alloc_cpumask_var_node: kmalloc not available!\n");
+		dump_stack();
+#endif
+		*mask = NULL;
+	}
+#ifdef CONFIG_DEBUG_PER_CPU_MAPS
+	if (!*mask) {
+		printk(KERN_ERR "=> alloc_cpumask_var_node: failed!\n");
+		dump_stack();
+	}
+#endif
+	return *mask != NULL;
+}
+EXPORT_SYMBOL(alloc_cpumask_var);
+
+/**
+ * alloc_bootmem_cpumask_var - return an allocated struct cpumask from
+ * the bootmem arena.
+ * @mask: pointer to cpumask_var_t where the cpumask is returned
+ *
+ * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
+ * a nop returning a constant 1 (in <linux/cpumask.h>)
+ * Either returns an allocated (zero-filled) cpumask, or causes the
+ * system to panic.
+ */
 void __init alloc_bootmem_cpumask_var(cpumask_var_t *mask)
 {
 	*mask = alloc_bootmem(cpumask_size());
 }
 
+/**
+ * free_cpumask_var - frees memory allocated for a struct cpumask.
+ * mask: cpumask to free
+ */
 void free_cpumask_var(cpumask_var_t mask)
 {
 	kfree(mask);
 }
 EXPORT_SYMBOL(free_cpumask_var);
 
+/**
+ * free_bootmem_cpumask_var - frees bootmem memory allocated for a struct cpumask.
+ * mask: cpumask to free
+ */
 void __init free_bootmem_cpumask_var(cpumask_var_t mask)
 {
 	free_bootmem((unsigned long)mask, cpumask_size());
