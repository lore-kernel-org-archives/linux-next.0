From: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 14 Aug 2015 09:01:49 +0000
Message-ID: <20150814090149.GC6956@hori1.linux.bs1.fc.nec.co.jp>
References: <20150814184753.26ad3ff1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150814184753.26ad3ff1@canb.auug.org.au>
Content-Language: ja-JP
Content-ID: <9963F37FB9512F4BB0DB7AB781EF2ECC@gisp.nec.co.jp>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 14, 2015 at 06:47:53PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> In file included from include/linux/sched.h:27:0,
>                  from arch/sparc/kernel/asm-offsets.c:13:
> include/linux/mm_types.h:371:22: error: 'HUGE_MAX_HSTATE' undeclared here (not in a function)
>   atomic_long_t count[HUGE_MAX_HSTATE];
>                       ^

Thank you for the report,

I'm suggesting the following diff as a fix. And I'm fine for these patches
to be excluded until the fix is merged to mmotm.

Thanks,
Naoya Horiguchi
---
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 64aa4db01f48..99ea2c651106 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -330,10 +330,6 @@ int __init alloc_bootmem_huge_page(struct hstate *h);
 void __init hugetlb_add_hstate(unsigned order);
 struct hstate *size_to_hstate(unsigned long size);
 
-#ifndef HUGE_MAX_HSTATE
-#define HUGE_MAX_HSTATE 1
-#endif
-
 extern struct hstate hstates[HUGE_MAX_HSTATE];
 extern unsigned int default_hstate_idx;
 
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index e95c5fe1eb7d..27333cdb8b46 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -365,6 +365,10 @@ struct mm_rss_stat {
 };
 
 #ifdef CONFIG_HUGETLB_PAGE
+
+#ifndef HUGE_MAX_HSTATE
+#define HUGE_MAX_HSTATE	1
+#endif
 struct hugetlb_usage {
 	atomic_long_t count[HUGE_MAX_HSTATE];
 };



> 
> Caused by commit
> 
>   04f4eaa95082 ("mm: hugetlb: proc: add HugetlbPages field to /proc/PID/status")
> 
> I have reverted that patch (and the following fix patch:
> 
>   f26cf7b29291 ("mm-hugetlb-proc-add-hugetlbpages-field-to-proc-pid-status-fix")