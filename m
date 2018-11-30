From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2018-11-29-13-37 uploaded (kasan)
Date: Thu, 29 Nov 2018 16:32:30 -0800
Message-ID: <d24875f4-f73f-3ec9-55ee-94367f797451@infradead.org>
References: <20181129213822.EbBH1%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129213822.EbBH1%akpm@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>
List-Id: linux-next.vger.kernel.org

On 11/29/18 1:38 PM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-11-29-13-37 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/

Lots of kasan build errors on x86_64.

> * kasan-mm-change-hooks-signatures.patch
> * kasan-slub-handle-pointer-tags-in-early_kmem_cache_node_alloc.patch
> * kasan-move-common-generic-and-tag-based-code-to-commonc.patch
> * kasan-rename-source-files-to-reflect-the-new-naming-scheme.patch
> * kasan-add-config_kasan_generic-and-config_kasan_sw_tags.patch
> * kasan-arm64-adjust-shadow-size-for-tag-based-mode.patch
> * kasan-rename-kasan_zero_page-to-kasan_early_shadow_page.patch
> * kasan-initialize-shadow-to-0xff-for-tag-based-mode.patch
> * arm64-move-untagged_addr-macro-from-uaccessh-to-memoryh.patch
> * kasan-add-tag-related-helper-functions.patch
> * kasan-arm64-untag-address-in-_virt_addr_is_linear.patch
> * kasan-preassign-tags-to-objects-with-ctors-or-slab_typesafe_by_rcu.patch
> * kasan-arm64-fix-up-fault-handling-logic.patch
> * kasan-arm64-enable-top-byte-ignore-for-the-kernel.patch
> * kasan-mm-perform-untagged-pointers-comparison-in-krealloc.patch
> * kasan-split-out-generic_reportc-from-reportc.patch
> * kasan-add-bug-reporting-routines-for-tag-based-mode.patch
> * mm-move-obj_to_index-to-include-linux-slab_defh.patch
> * kasan-add-hooks-implementation-for-tag-based-mode.patch
> * kasan-arm64-add-brk-handler-for-inline-instrumentation.patch
> * kasan-mm-arm64-tag-non-slab-memory-allocated-via-pagealloc.patch
> * kasan-add-__must_check-annotations-to-kasan-hooks.patch
> * kasan-arm64-select-have_arch_kasan_sw_tags.patch
> * kasan-update-documentation.patch
> * kasan-add-spdx-license-identifier-mark-to-source-files.patch

The simplest error is:
../mm/kasan/common.c:574:17: error: 'KASAN_SHADOW_INIT' undeclared (first use in this function)

when neither KASAN_GENERIC nor KASAN_SW_TAGS is set (enabled).

There there are a slew of these:

../mm/kasan/common.c: In function 'filter_irq_stacks':
../mm/kasan/common.c:53:12: error: dereferencing pointer to incomplete type
  if (!trace->nr_entries)
            ^
../mm/kasan/common.c:55:23: error: dereferencing pointer to incomplete type
  for (i = 0; i < trace->nr_entries; i++)
                       ^
../mm/kasan/common.c:56:29: error: dereferencing pointer to incomplete type
   if (in_irqentry_text(trace->entries[i])) {
                             ^
../mm/kasan/common.c:58:9: error: dereferencing pointer to incomplete type
    trace->nr_entries = i + 1;
         ^
../mm/kasan/common.c: In function 'save_stack':
../mm/kasan/common.c:66:9: error: variable 'trace' has initializer but incomplete type
  struct stack_trace trace = {
         ^
../mm/kasan/common.c:67:3: error: unknown field 'nr_entries' specified in initializer
   .nr_entries = 0,
   ^
../mm/kasan/common.c:67:3: warning: excess elements in struct initializer [enabled by default]
../mm/kasan/common.c:67:3: warning: (near initialization for 'trace') [enabled by default]
../mm/kasan/common.c:68:3: error: unknown field 'entries' specified in initializer
   .entries = entries,
   ^
../mm/kasan/common.c:68:3: warning: excess elements in struct initializer [enabled by default]
../mm/kasan/common.c:68:3: warning: (near initialization for 'trace') [enabled by default]
../mm/kasan/common.c:69:3: error: unknown field 'max_entries' specified in initializer
   .max_entries = KASAN_STACK_DEPTH,
   ^
../mm/kasan/common.c:69:3: warning: excess elements in struct initializer [enabled by default]
../mm/kasan/common.c:69:3: warning: (near initialization for 'trace') [enabled by default]
../mm/kasan/common.c:70:3: error: unknown field 'skip' specified in initializer
   .skip = 0
   ^
../mm/kasan/common.c:71:2: warning: excess elements in struct initializer [enabled by default]
  };
  ^
../mm/kasan/common.c:71:2: warning: (near initialization for 'trace') [enabled by default]
../mm/kasan/common.c:66:21: error: storage size of 'trace' isn't known
  struct stack_trace trace = {
                     ^
../mm/kasan/common.c:66:21: warning: unused variable 'trace' [-Wunused-variable]
../mm/kasan/common.c: In function 'kasan_module_alloc':
../mm/kasan/common.c:574:17: error: 'KASAN_SHADOW_INIT' undeclared (first use in this function)
   __memset(ret, KASAN_SHADOW_INIT, shadow_size);
                 ^
../mm/kasan/common.c:574:17: note: each undeclared identifier is reported only once for each function it appears in
../mm/kasan/common.c: In function 'save_stack':
../mm/kasan/common.c:80:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^
../scripts/Makefile.build:285: recipe for target 'mm/kasan/common.o' failed


-- 
~Randy
