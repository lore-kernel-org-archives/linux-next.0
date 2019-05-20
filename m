From: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: PROBLEM: Power9: kernel oops on memory hotunplug from ppc64le
 guest
Date: Mon, 20 May 2019 20:42:02 +0530
Message-ID: <20190520151202.GF22939@in.ibm.com>
References: <16a7a635-c592-27e2-75b4-d02071833278@linux.vnet.ibm.com>
 <20190518141434.GA22939@in.ibm.com>
 <878sv1993k.fsf@concordia.ellerman.id.au>
 <20190520042533.GB22939@in.ibm.com>
 <1558327521.633yjtl8ki.astroid@bobo.none>
 <20190520055622.GC22939@in.ibm.com>
 <1558335484.9inx69a7ea.astroid@bobo.none>
 <20190520082035.GD22939@in.ibm.com>
 <20190520142922.GE22939@in.ibm.com>
 <1558363500.jsgl4a2lfa.astroid@bobo.none>
Reply-To: bharata@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1558363500.jsgl4a2lfa.astroid@bobo.none>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Piggin <npiggin@gmail.com>
Cc: aneesh.kumar@linux.ibm.com, bharata@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, srikanth <sraithal@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Tue, May 21, 2019 at 12:55:49AM +1000, Nicholas Piggin wrote:
> Bharata B Rao's on May 21, 2019 12:29 am:
> > On Mon, May 20, 2019 at 01:50:35PM +0530, Bharata B Rao wrote:
> >> On Mon, May 20, 2019 at 05:00:21PM +1000, Nicholas Piggin wrote:
> >> > Bharata B Rao's on May 20, 2019 3:56 pm:
> >> > > On Mon, May 20, 2019 at 02:48:35PM +1000, Nicholas Piggin wrote:
> >> > >> >> > git bisect points to
> >> > >> >> >
> >> > >> >> > commit 4231aba000f5a4583dd9f67057aadb68c3eca99d
> >> > >> >> > Author: Nicholas Piggin <npiggin@gmail.com>
> >> > >> >> > Date:   Fri Jul 27 21:48:17 2018 +1000
> >> > >> >> >
> >> > >> >> >     powerpc/64s: Fix page table fragment refcount race vs speculative references
> >> > >> >> >
> >> > >> >> >     The page table fragment allocator uses the main page refcount racily
> >> > >> >> >     with respect to speculative references. A customer observed a BUG due
> >> > >> >> >     to page table page refcount underflow in the fragment allocator. This
> >> > >> >> >     can be caused by the fragment allocator set_page_count stomping on a
> >> > >> >> >     speculative reference, and then the speculative failure handler
> >> > >> >> >     decrements the new reference, and the underflow eventually pops when
> >> > >> >> >     the page tables are freed.
> >> > >> >> >
> >> > >> >> >     Fix this by using a dedicated field in the struct page for the page
> >> > >> >> >     table fragment allocator.
> >> > >> >> >
> >> > >> >> >     Fixes: 5c1f6ee9a31c ("powerpc: Reduce PTE table memory wastage")
> >> > >> >> >     Cc: stable@vger.kernel.org # v3.10+
> >> > >> >> 
> >> > >> >> That's the commit that added the BUG_ON(), so prior to that you won't
> >> > >> >> see the crash.
> >> > >> > 
> >> > >> > Right, but the commit says it fixes page table page refcount underflow by
> >> > >> > introducing a new field &page->pt_frag_refcount. Now we are hitting the underflow
> >> > >> > for this pt_frag_refcount.
> >> > >> 
> >> > >> The fixed underflow is caused by a bug (race on page count) that got 
> >> > >> fixed by that patch. You are hitting a different underflow here. It's
> >> > >> not certain my patch caused it, I'm just trying to reproduce now.
> >> > > 
> >> > > Ok.
> >> > 
> >> > Can't reproduce I'm afraid, tried adding and removing 8GB memory from a
> >> > 4GB guest (via host adding / removing memory device), and it just works.
> >> 
> >> Boot, add 8G, reboot, remove 8G is the sequence to reproduce.
> >> 
> >> > 
> >> > It's likely to be an edge case like an off by one or rounding error
> >> > that just happens to trigger in your config. Might be easiest if you
> >> > could test with a debug patch.
> >> 
> >> Sure, I will continue debugging.
> > 
> > When the guest is rebooted after hotplug, the entire memory (which includes
> > the hotplugged memory) gets remapped again freshly. However at this time
> > since no slab is available yet, pt_frag_refcount never gets initialized as we
> > never do pte_fragment_alloc() for these mappings. So we right away hit the
> > underflow during the first unplug itself, it looks like.
> 
> Nice catch, good debugging work.

Thanks, with help from Aneesh.

> 
> > I will check how this can be fixed.
> 
> Tricky problem. What do you think? You might be able to make the early 
> page table allocations in the same pattern as the frag allocations, and 
> then fill in the struct page metadata when you have those.

Will explore.

> 
> Other option may be create a new set of page tables after mm comes up
> to replace the early page tables with. That's a bigger hammer though.

Will also check if similar scenario exists on x86 and if so, how and when
pte frag data is fixed there.

Regards,
Bharata.
