From: Tang Chen <tangchen@cn.fujitsu.com>
Subject: [PATCH v2 1/1] page_alloc: Bootmem limit with movablecore_map
Date: Mon, 21 Jan 2013 15:25:33 +0800
Message-ID: <1358753133-23355-1-git-send-email-tangchen@cn.fujitsu.com>
References: <20130121170804.8b6eec010e00a6cbbcbad66f@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130121170804.8b6eec010e00a6cbbcbad66f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, tangchen@cn.fujitsu.com, akpm@linux-foundation.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

This patch make sure bootmem will not allocate memory from areas that
may be ZONE_MOVABLE. The map info is from movablecore_map boot option.

Signed-off-by: Tang Chen <tangchen@cn.fujitsu.com>
Reviewed-by: Wen Congyang <wency@cn.fujitsu.com>
Reviewed-by: Lai Jiangshan <laijs@cn.fujitsu.com>
Tested-by: Lin Feng <linfeng@cn.fujitsu.com>
---
 include/linux/memblock.h |    2 +
 mm/memblock.c            |   50 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index d452ee1..ac52bbc 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -60,6 +60,8 @@ int memblock_reserve(phys_addr_t base, phys_addr_t size);
 void memblock_trim_memory(phys_addr_t align);
 
 #ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
+extern struct movablecore_map movablecore_map;
+
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
 			  unsigned long *out_end_pfn, int *out_nid);
 
diff --git a/mm/memblock.c b/mm/memblock.c
index 88adc8a..0218231 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -92,9 +92,58 @@ static long __init_memblock memblock_overlaps_region(struct memblock_type *type,
  *
  * Find @size free area aligned to @align in the specified range and node.
  *
+ * If we have CONFIG_HAVE_MEMBLOCK_NODE_MAP defined, we need to check if the
+ * memory we found if not in hotpluggable ranges.
+ *
  * RETURNS:
  * Found address on success, %0 on failure.
  */
+#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
+phys_addr_t __init_memblock memblock_find_in_range_node(phys_addr_t start,
+					phys_addr_t end, phys_addr_t size,
+					phys_addr_t align, int nid)
+{
+	phys_addr_t this_start, this_end, cand;
+	u64 i;
+	int curr = movablecore_map.nr_map - 1;
+
+	/* pump up @end */
+	if (end == MEMBLOCK_ALLOC_ACCESSIBLE)
+		end = memblock.current_limit;
+
+	/* avoid allocating the first page */
+	start = max_t(phys_addr_t, start, PAGE_SIZE);
+	end = max(start, end);
+
+	for_each_free_mem_range_reverse(i, nid, &this_start, &this_end, NULL) {
+		this_start = clamp(this_start, start, end);
+		this_end = clamp(this_end, start, end);
+
+restart:
+		if (this_end <= this_start || this_end < size)
+			continue;
+
+		for (; curr >= 0; curr--) {
+			if ((movablecore_map.map[curr].start_pfn << PAGE_SHIFT)
+			    < this_end)
+				break;
+		}
+
+		cand = round_down(this_end - size, align);
+		if (curr >= 0 &&
+		    cand < movablecore_map.map[curr].end_pfn << PAGE_SHIFT) {
+			this_end = movablecore_map.map[curr].start_pfn
+				   << PAGE_SHIFT;
+			goto restart;
+		}
+
+		if (cand >= this_start)
+			return cand;
+	}
+
+	return 0;
+}
+#else /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
 phys_addr_t __init_memblock memblock_find_in_range_node(phys_addr_t start,
 					phys_addr_t end, phys_addr_t size,
 					phys_addr_t align, int nid)
@@ -123,6 +172,7 @@ phys_addr_t __init_memblock memblock_find_in_range_node(phys_addr_t start,
 	}
 	return 0;
 }
+#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
 
 /**
  * memblock_find_in_range - find free area in given range
-- 
1.7.1
