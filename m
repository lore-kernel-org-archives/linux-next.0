From: Yinghai Lu <yinghai@kernel.org>
Subject: Re: memblock compile warnings
Date: Fri, 25 Feb 2011 19:04:09 -0800
Message-ID: <4D686DA9.4020907@kernel.org>
References: <20110225132204.GA7469@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:29803 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750869Ab1BZDFa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2011 22:05:30 -0500
In-Reply-To: <20110225132204.GA7469@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: "H. Peter Anvin" <hpa@linux.intel.com>, linux-next@vger.kernel.org

On 02/25/2011 05:22 AM, Heiko Carstens wrote:
> Hi Yinghai,
> 
> your memblock code triggers generated these warnings on s390:
> 
> mm/page_alloc.c:3623:22: warning: 'last_active_region_index_in_nid' defined but not used
> mm/page_alloc.c:3638:22: warning: 'previous_active_region_index_in_nid' defined but not used
> 

please check

[PATCH] mm: Move early_node_map[] reverse scan under HAVE_MEMBLOCK

Heiko found recent memblock change triggers generated these warnings on s390:

mm/page_alloc.c:3623:22: warning: 'last_active_region_index_in_nid' defined but not used
mm/page_alloc.c:3638:22: warning: 'previous_active_region_index_in_nid' defined but not used

Need to move those two function with find_memory_core_early(), the only user.

Reported-by: Heiko Carstens <heiko.carstens@de.ibm.com>
Signed-off-by: Yinghai Lu <yinghai@kernel.org>

---
 mm/page_alloc.c |   64 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

Index: linux-2.6/mm/page_alloc.c
===================================================================
--- linux-2.6.orig/mm/page_alloc.c
+++ linux-2.6/mm/page_alloc.c
@@ -3616,34 +3616,6 @@ static int __meminit next_active_region_
 	return -1;
 }
 
-/*
- * Basic iterator support. Return the last range of PFNs for a node
- * Note: nid == MAX_NUMNODES returns last region regardless of node
- */
-static int __meminit last_active_region_index_in_nid(int nid)
-{
-	int i;
-
-	for (i = nr_nodemap_entries - 1; i >= 0; i--)
-		if (nid == MAX_NUMNODES || early_node_map[i].nid == nid)
-			return i;
-
-	return -1;
-}
-
-/*
- * Basic iterator support. Return the previous active range of PFNs for a node
- * Note: nid == MAX_NUMNODES returns next region regardless of node
- */
-static int __meminit previous_active_region_index_in_nid(int index, int nid)
-{
-	for (index = index - 1; index >= 0; index--)
-		if (nid == MAX_NUMNODES || early_node_map[index].nid == nid)
-			return index;
-
-	return -1;
-}
-
 #ifndef CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID
 /*
  * Required by SPARSEMEM. Given a PFN, return what node the PFN is on.
@@ -3695,10 +3667,6 @@ bool __meminit early_pfn_in_nid(unsigned
 	for (i = first_active_region_index_in_nid(nid); i != -1; \
 				i = next_active_region_index_in_nid(i, nid))
 
-#define for_each_active_range_index_in_nid_reverse(i, nid) \
-	for (i = last_active_region_index_in_nid(nid); i != -1; \
-				i = previous_active_region_index_in_nid(i, nid))
-
 /**
  * free_bootmem_with_active_regions - Call free_bootmem_node for each active range
  * @nid: The node to free memory on. If MAX_NUMNODES, all nodes are freed.
@@ -3731,6 +3699,38 @@ void __init free_bootmem_with_active_reg
 }
 
 #ifdef CONFIG_HAVE_MEMBLOCK
+/*
+ * Basic iterator support. Return the last range of PFNs for a node
+ * Note: nid == MAX_NUMNODES returns last region regardless of node
+ */
+static int __meminit last_active_region_index_in_nid(int nid)
+{
+	int i;
+
+	for (i = nr_nodemap_entries - 1; i >= 0; i--)
+		if (nid == MAX_NUMNODES || early_node_map[i].nid == nid)
+			return i;
+
+	return -1;
+}
+
+/*
+ * Basic iterator support. Return the previous active range of PFNs for a node
+ * Note: nid == MAX_NUMNODES returns next region regardless of node
+ */
+static int __meminit previous_active_region_index_in_nid(int index, int nid)
+{
+	for (index = index - 1; index >= 0; index--)
+		if (nid == MAX_NUMNODES || early_node_map[index].nid == nid)
+			return index;
+
+	return -1;
+}
+
+#define for_each_active_range_index_in_nid_reverse(i, nid) \
+	for (i = last_active_region_index_in_nid(nid); i != -1; \
+				i = previous_active_region_index_in_nid(i, nid))
+
 u64 __init find_memory_core_early(int nid, u64 size, u64 align,
 					u64 goal, u64 limit)
 {
