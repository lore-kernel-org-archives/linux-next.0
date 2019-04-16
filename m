From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Tue, 16 Apr 2019 15:45:22 -0700
Message-ID: <20190416154522.65aaa348161fc581181b56d9@linux-foundation.org>
References: <20190329133914.45a4a255@canb.auug.org.au>
        <20190416165256.1fbf2445@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416165256.1fbf2445@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: George Spelvin <lkml@sdf.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 16 Apr 2019 16:52:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Fri, 29 Mar 2019 13:39:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the akpm-current tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> > 
> > lib/list_sort.c:17:36: warning: 'pure' attribute ignored [-Wattributes]
> >    struct list_head const *, struct list_head const *);
> >                                     ^~~~~~~~~
> > 
> > Introduced by commit
> > 
> >   820c81be5237 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")
> 
> I am still getting that warning :-(

Me too and I can't figure it out.

Shrug, I guess we take a pass on it until someone has time/inclination
to revisit it.

--- a/lib/list_sort.c~lib-list_sort-simplify-and-remove-max_list_length_bits-fix
+++ a/lib/list_sort.c
@@ -7,13 +7,7 @@
 #include <linux/list_sort.h>
 #include <linux/list.h>
 
-/*
- * By declaring the compare function with the __pure attribute, we give
- * the compiler more opportunity to optimize.  Ideally, we'd use this in
- * the prototype of list_sort(), but that would involve a lot of churn
- * at all call sites, so just cast the function pointer passed in.
- */
-typedef int __pure __attribute__((nonnull(2,3))) (*cmp_func)(void *,
+typedef int __attribute__((nonnull(2,3))) (*cmp_func)(void *,
 		struct list_head const *, struct list_head const *);
 
 /*
_
