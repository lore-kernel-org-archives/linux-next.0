From: Matthew Wilcox <willy@infradead.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 18 Jun 2018 10:09:20 -0700
Message-ID: <20180618170920.GC28748@bombadil.infradead.org>
References: <20180618132712.4b4eddc9@canb.auug.org.au>
 <CAPcyv4idNE8ErxNm5bb3rG4jUeZU9HJRmO03omMJxSN-8FYN+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPcyv4idNE8ErxNm5bb3rG4jUeZU9HJRmO03omMJxSN-8FYN+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jun 18, 2018 at 09:50:33AM -0700, Dan Williams wrote:
> On Sun, Jun 17, 2018 at 8:27 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > After merging the xarray tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
[...]
> > from the nvdimm tree.
> >
> > Willy thanks for the heads up about this.
> >
> > I have applied the following merge fix patch (taken from the diff between
> > the -next tree at this point and the xarray-20180615 branch from the
> > xarray tree) for today.
> 
> I was hoping that dax_lock_page() and the memory_failure() handling
> could go in before the xarray rework. This helps -stable and distros
> that need to backport this error handling support. Willy, would you be
> amenable to rebasing on top of the next rev of the
> dax+memory_failure() work?
> 
> Apologies for the thrash.

I am absolutely amenable to rebasing.  The only problem is that I'm
in Tokyo for the next two weeks.  I can put some work in on this, but
coordination may be a little off.  If somebody else wants to do the work,
the only (serious) difference between the xarray-20180615 and xarray
branches in my repo is that the former is based on the dax_lock_page()
changes having gone in.

The differences sum up to:

+@@ -414,8 +413,7 @@ struct page *dax_lock_page(unsigned long pfn)
+ 
+               entry = __radix_tree_lookup(&mapping->i_pages, index, NULL,
+                               &slot);
+-              if (!entry ||
+-                  WARN_ON_ONCE(!radix_tree_exceptional_entry(entry))) {
++              if (!entry || WARN_ON_ONCE(!xa_is_value(entry))) {
+                       xa_unlock_irq(&mapping->i_pages);
+                       break;
+               } else if (!slot_locked(mapping, slot)) {

(in "xarray: Replace exceptional entries")

then dax_entry_waitqueue() changing its argument in "dax: Hash on XArray instead of mapping".

and finally the patch converting dax_lock_page() and dax_unlock_page().

I really wanted to keep the thrash here to a minimum, but this is the
best I could come up with in terms of minimising conflicts :-(
