From: Pavel Tatashin <pasha.tatashin@oracle.com>
Subject: Re: [next-20180711][Oops] linux-next kernel boot is broken on powerpc
Date: Tue, 17 Jul 2018 22:00:20 -0400
Message-ID: <CAGM2reav2giqHjUTWADWzqb-8m7AqUBJxerA1Oc+4YJhTLXrDA@mail.gmail.com>
References: <1531416305.6480.24.camel@abdul.in.ibm.com> <CAGM2rebtisZda0kqhg0u92fTDxC+=zMNNgKFBLH38osphk0fdA@mail.gmail.com>
 <1531473191.6480.26.camel@abdul.in.ibm.com> <20180714105500.3694b93f@canb.auug.org.au>
 <1531824532.15016.30.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531824532.15016.30.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: abdhalee@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, sachinp@linux.vnet.ibm.com, Michal Hocko <mhocko@suse.com>, sim@linux.vnet.ibm.com, venkatb3@in.ibm.com, LKML <linux-kernel@vger.kernel.org>, manvanth@linux.vnet.ibm.com, Linux Memory Management List <linux-mm@kvack.org>, linux-next@vger.kernel.org, aneesh.kumar@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
List-Id: linux-next.vger.kernel.org

On Tue, Jul 17, 2018 at 6:49 AM Abdul Haleem
<abdhalee@linux.vnet.ibm.com> wrote:
>
> On Sat, 2018-07-14 at 10:55 +1000, Stephen Rothwell wrote:
> > Hi Abdul,
> >
> > On Fri, 13 Jul 2018 14:43:11 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:
> > >
> > > On Thu, 2018-07-12 at 13:44 -0400, Pavel Tatashin wrote:
> > > > > Related commit could be one of below ? I see lots of patches related to mm and could not bisect
> > > > >
> > > > > 5479976fda7d3ab23ba0a4eb4d60b296eb88b866 mm: page_alloc: restore memblock_next_valid_pfn() on arm/arm64
> > > > > 41619b27b5696e7e5ef76d9c692dd7342c1ad7eb mm-drop-vm_bug_on-from-__get_free_pages-fix
> > > > > 531bbe6bd2721f4b66cdb0f5cf5ac14612fa1419 mm: drop VM_BUG_ON from __get_free_pages
> > > > > 479350dd1a35f8bfb2534697e5ca68ee8a6e8dea mm, page_alloc: actually ignore mempolicies for high priority allocations
> > > > > 088018f6fe571444caaeb16e84c9f24f22dfc8b0 mm: skip invalid pages block at a time in zero_resv_unresv()
> > > >
> > > > Looks like:
> > > > 0ba29a108979 mm/sparse: Remove CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER
> > > >
> > > > This patch is going to be reverted from linux-next. Abdul, please
> > > > verify that issue is gone once  you revert this patch.
> > >
> > > kernel booted fine when the above patch is reverted.
> >
> > And it has been removed from linux-next as of next-20180713.  (Friday
> > the 13th is not all bad :-))
>
> Hi Stephen,
>
> After reverting 0ba29a108979, our bare-metal machines boot fails with
> kernel panic, is this related ?
>
> I have attached the boot logs.

The panic happens much later in boot and looks unrelated to the
sparse_init changes.

Thank you,
Pavel
