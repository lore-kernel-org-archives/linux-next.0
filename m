From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the vfs
 tree
Date: Mon, 11 Jan 2016 14:26:49 +0100
Message-ID: <5693AD99.9080304@suse.cz>
References: <20160111184827.053068e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160111184827.053068e6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Monakhov <dmonakhov@openvz.org>
List-Id: linux-next.vger.kernel.org

On 01/11/2016 08:48 AM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   lib/vsprintf.c
> 
> between commit:
> 
>   1031bc589228 ("lib/vsprintf: add %*pg format specifier")
> 
> from the vfs tree and commit:
> 
>   88f2367418d7 ("mm, printk: introduce new format string for flags")
> 
> from the akpm-current tree.

Ouch, thanks for the heads-up.

> I fixed it up (I switched the latter to 'j' since there were less of
> them to fix up - see below) and can carry the fix as necessary (no action
> is required).

Next mmotm shouldn't have this series anymore (it's already gone in mmots) due
to a substantial non-incremental rewrite which I will resubmit after 4.5-rc1, so
I'll consider going with the 'j' or pick a new character. Thanks.

> I also added this patch to fix up all the new uses.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Jan 2016 18:42:34 +1100
> Subject: [PATCH] mm-printk-introduce-new-format-string-for-flags-fix-3
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  Documentation/printk-formats.txt | 6 +++---
>  mm/debug.c                       | 6 +++---
>  mm/oom_kill.c                    | 2 +-
>  mm/page_alloc.c                  | 4 ++--
>  mm/page_owner.c                  | 6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
> index ad9eeba1768f..ba139ca32e86 100644
> --- a/Documentation/printk-formats.txt
> +++ b/Documentation/printk-formats.txt
> @@ -300,9 +300,9 @@ bitmap and its derivatives such as cpumask and nodemask:
>  
>  Flags bitfields such as page flags, gfp_flags:
>  
> -	%pgp	referenced|uptodate|lru|active|private
> -	%pgg	GFP_USER|GFP_DMA32|GFP_NOWARN
> -	%pgv	read|exec|mayread|maywrite|mayexec|denywrite
> +	%pjp	referenced|uptodate|lru|active|private
> +	%pjg	GFP_USER|GFP_DMA32|GFP_NOWARN
> +	%pjv	read|exec|mayread|maywrite|mayexec|denywrite
>  
>  	For printing flags bitfields as a collection of symbolic constants that
>  	would construct the value. The type of flags is given by the third
> diff --git a/mm/debug.c b/mm/debug.c
> index adfec056aca8..0ea2db2183e8 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -118,7 +118,7 @@ void __dump_page(struct page *page, const char *reason)
>  		  page->mapping, page->index);
>  	BUILD_BUG_ON(ARRAY_SIZE(pageflag_names) != __NR_PAGEFLAGS + 1);
>  
> -	pr_emerg("flags: %#lx(%pgp)\n", page->flags, &page->flags);
> +	pr_emerg("flags: %#lx(%pjp)\n", page->flags, &page->flags);
>  
>  	if (reason)
>  		pr_alert("page dumped because: %s\n", reason);
> @@ -143,7 +143,7 @@ void dump_vma(const struct vm_area_struct *vma)
>  		"next %p prev %p mm %p\n"
>  		"prot %lx anon_vma %p vm_ops %p\n"
>  		"pgoff %lx file %p private_data %p\n"
> -		"flags: %#lx(%pgv)\n",
> +		"flags: %#lx(%pjv)\n",
>  		vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_next,
>  		vma->vm_prev, vma->vm_mm,
>  		(unsigned long)pgprot_val(vma->vm_page_prot),
> @@ -220,7 +220,7 @@ void dump_mm(const struct mm_struct *mm)
>  		""		/* This is here to not have a comma! */
>  		);
>  
> -	pr_emerg("def_flags: %#lx(%pgv)\n", mm->def_flags, &mm->def_flags);
> +	pr_emerg("def_flags: %#lx(%pjv)\n", mm->def_flags, &mm->def_flags);
>  }
>  
>  #endif		/* CONFIG_DEBUG_VM */
> diff --git a/mm/oom_kill.c b/mm/oom_kill.c
> index b8a4210929cc..8579d26f2c32 100644
> --- a/mm/oom_kill.c
> +++ b/mm/oom_kill.c
> @@ -405,7 +405,7 @@ static void dump_header(struct oom_control *oc, struct task_struct *p,
>  			struct mem_cgroup *memcg)
>  {
>  	pr_warning("%s invoked oom-killer: order=%d, oom_score_adj=%hd, "
> -			"gfp_mask=%#x(%pgg)\n",
> +			"gfp_mask=%#x(%pjg)\n",
>  		current->comm, oc->order, current->signal->oom_score_adj,
>  		oc->gfp_mask, &oc->gfp_mask);
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 3c3a5c52d277..42536a624a03 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -444,7 +444,7 @@ static void bad_page(struct page *page, const char *reason,
>  	__dump_page(page, reason);
>  	bad_flags &= page->flags;
>  	if (bad_flags)
> -		pr_alert("bad because of flags: %#lx(%pgp)\n",
> +		pr_alert("bad because of flags: %#lx(%pjp)\n",
>  						bad_flags, &bad_flags);
>  	dump_page_owner(page);
>  
> @@ -2708,7 +2708,7 @@ void warn_alloc_failed(gfp_t gfp_mask, unsigned int order, const char *fmt, ...)
>  		va_end(args);
>  	}
>  
> -	pr_warn("%s: page allocation failure: order:%u, mode:%#x(%pgg)\n",
> +	pr_warn("%s: page allocation failure: order:%u, mode:%#x(%pjg)\n",
>  		current->comm, order, gfp_mask, &gfp_mask);
>  	dump_stack();
>  	if (!should_suppress_show_mem())
> diff --git a/mm/page_owner.c b/mm/page_owner.c
> index 011377548b4f..afb7a444fb08 100644
> --- a/mm/page_owner.c
> +++ b/mm/page_owner.c
> @@ -135,7 +135,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
>  		return -ENOMEM;
>  
>  	ret = snprintf(kbuf, count,
> -			"Page allocated via order %u, mask %#x(%pgg)\n",
> +			"Page allocated via order %u, mask %#x(%pjg)\n",
>  			page_ext->order, page_ext->gfp_mask,
>  			&page_ext->gfp_mask);
>  
> @@ -146,7 +146,7 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
>  	pageblock_mt = get_pfnblock_migratetype(page, pfn);
>  	page_mt  = gfpflags_to_migratetype(page_ext->gfp_mask);
>  	ret += snprintf(kbuf + ret, count - ret,
> -			"PFN %lu type %s Block %lu type %s Flags %#lx(%pgp)\n",
> +			"PFN %lu type %s Block %lu type %s Flags %#lx(%pjp)\n",
>  			pfn,
>  			migratetype_names[page_mt],
>  			pfn >> pageblock_order,
> @@ -199,7 +199,7 @@ void __dump_page_owner(struct page *page)
>  	}
>  
>  	pr_alert("page allocated via order %u, migratetype %s, "
> -			"gfp_mask %#x(%pgg)\n", page_ext->order,
> +			"gfp_mask %#x(%pjg)\n", page_ext->order,
>  			migratetype_names[mt], gfp_mask, &gfp_mask);
>  	print_stack_trace(&trace, 0);
>  
> 
