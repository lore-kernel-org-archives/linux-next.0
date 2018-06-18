From: Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 18 Jun 2018 09:50:33 -0700
Message-ID: <CAPcyv4idNE8ErxNm5bb3rG4jUeZU9HJRmO03omMJxSN-8FYN+w@mail.gmail.com>
References: <20180618132712.4b4eddc9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618132712.4b4eddc9@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <willy@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jun 17, 2018 at 8:27 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the xarray tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from arch/powerpc/include/asm/bug.h:128:0,
>                  from include/linux/bug.h:5,
>                  from arch/powerpc/include/asm/cmpxchg.h:9,
>                  from arch/powerpc/include/asm/atomic.h:11,
>                  from include/linux/atomic.h:5,
>                  from fs/dax.c:17:
> fs/dax.c: In function 'dax_lock_page':
> fs/dax.c:392:21: error: implicit declaration of function 'radix_tree_exceptional_entry'; did you mean 'radix_tree_exception'? [-Werror=implicit-function-declaration]
>        WARN_ON_ONCE(!radix_tree_exceptional_entry(entry))) {
>                      ^
> include/asm-generic/bug.h:69:25: note: in definition of macro 'WARN_ON_ONCE'
>   int __ret_warn_on = !!(condition);   \
>                          ^~~~~~~~~
> fs/dax.c:395:15: error: implicit declaration of function 'slot_locked'; did you mean 'iget_locked'? [-Werror=implicit-function-declaration]
>    } else if (!slot_locked(mapping, slot)) {
>                ^~~~~~~~~~~
>                iget_locked
> fs/dax.c:396:4: error: implicit declaration of function 'lock_slot'; did you mean 'local_set'? [-Werror=implicit-function-declaration]
>     lock_slot(mapping, slot);
>     ^~~~~~~~~
>     local_set
> fs/dax.c:402:28: error: passing argument 1 of 'dax_entry_waitqueue' from incompatible pointer type [-Werror=incompatible-pointer-types]
>    wq = dax_entry_waitqueue(mapping, index, entry, &ewait.key);
>                             ^~~~~~~
> fs/dax.c:152:27: note: expected 'struct xa_state *' but argument is of type 'struct address_space *'
>  static wait_queue_head_t *dax_entry_waitqueue(struct xa_state *xas,
>                            ^~~~~~~~~~~~~~~~~~~
> fs/dax.c:402:37: warning: passing argument 2 of 'dax_entry_waitqueue' makes pointer from integer without a cast [-Wint-conversion]
>    wq = dax_entry_waitqueue(mapping, index, entry, &ewait.key);
>                                      ^~~~~
> fs/dax.c:152:27: note: expected 'void *' but argument is of type 'long unsigned int'
>  static wait_queue_head_t *dax_entry_waitqueue(struct xa_state *xas,
>                            ^~~~~~~~~~~~~~~~~~~
> fs/dax.c:402:8: error: too many arguments to function 'dax_entry_waitqueue'
>    wq = dax_entry_waitqueue(mapping, index, entry, &ewait.key);
>         ^~~~~~~~~~~~~~~~~~~
> fs/dax.c:152:27: note: declared here
>  static wait_queue_head_t *dax_entry_waitqueue(struct xa_state *xas,
>                            ^~~~~~~~~~~~~~~~~~~
> fs/dax.c: In function 'dax_unlock_page':
> fs/dax.c:424:2: error: implicit declaration of function 'dax_unlock_mapping_entry'; did you mean 'dax_delete_mapping_entry'? [-Werror=implicit-function-declaration]
>   dax_unlock_mapping_entry(mapping, page->index);
>   ^~~~~~~~~~~~~~~~~~~~~~~~
>   dax_delete_mapping_entry
>
> Caused by commits in the xarray tree interacting with commit
>
>   9b3d53936caa ("filesystem-dax: Introduce dax_lock_page()")
>
> from the nvdimm tree.
>
> Willy thanks for the heads up about this.
>
> I have applied the following merge fix patch (taken from the diff between
> the -next tree at this point and the xarray-20180615 branch from the
> xarray tree) for today.

I was hoping that dax_lock_page() and the memory_failure() handling
could go in before the xarray rework. This helps -stable and distros
that need to backport this error handling support. Willy, would you be
amenable to rebasing on top of the next rev of the
dax+memory_failure() work?

Apologies for the thrash.
