From: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
Date: Mon, 20 May 2019 11:26:22 +0530
Message-ID: <20190520055622.GC22939@in.ibm.com>
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com>
 <878sv1993k.fsf@concordia.ellerman.id.au>
 <20190520042533.GB22939@in.ibm.com>
 <1558327521.633yjtl8ki.astroid@bobo.none>
Reply-To: bharata@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558327521.633yjtl8ki.astroid@bobo.none>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, aneesh.kumar@linux.ibm.com, bharata@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, srikanth <sraithal@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
> >> > git bisect points to
> >> >
> >> > commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
> >> > Author: Nicholas Piggin <npiggin@gmail.com>
> >> > Date:   Fri Jul 27 21:48:17 2018 +1000
> >> >
> >> >     powerpc/64s: Fix page table fragment refcount race vs speculative references
> >> >
> >> >     The page table fragment allocator uses the main page refcount racily
> >> >     with respect to speculative references. A customer observed a BUG due
> >> >     to page table page refcount underflow in the fragment allocator. This
> >> >     can be caused by the fragment allocator set_page_count stomping on a
> >> >     speculative reference, and then the speculative failure handler
> >> >     decrements the new reference, and the underflow eventually pops when
> >> >     the page tables are freed.
> >> >
> >> >     Fix this by using a dedicated field in the struct page for the page
> >> >     table fragment allocator.
> >> >
> >> >     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage")
> >> >     Cc: stable@vger.kernel.org # v3.10+
> >> 
> >> That's the commit that added the BUG_ON(), so prior to that you won't
> >> see the crash.
> > 
> > Right, but the commit says it fixes page table page refcount underflow by
> > introducing a new field &page->pt_frag_refcount. Now we are hitting the underflow
> > for this pt_frag_refcount.
> 
> The fixed underflow is caused by a bug (race on page count) that got 
> fixed by that patch. You are hitting a different underflow here. It's
> not certain my patch caused it, I'm just trying to reproduce now.

Ok.

> 
> > 
> > BTW, if I go below this commit, I don't hit the pagecount
> > 
> > VM_BUG_ON_PAGE(page_ref_count(page) == 0, page);
> > 
> > which is in pte_fragment_free() path.
> 
> Do you have CONFIG_DEBUG_VM=y?

Yes.

Regards,
Bharata.
