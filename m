From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Boot failures with "mm/sparse: Remove CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER" on powerpc (was Re: mmotm 2018-07-10-16-50 uploaded)
Date: Thu, 12 Jul 2018 14:29:05 +1000
Message-ID: <87k1q184by.fsf@concordia.ellerman.id.au>
References: <20180710235044.vjlRV%akpm@linux-foundation.org> <87lgai9bt5.fsf@concordia.ellerman.id.au> <20180711131225.GI1969@MiWiFi-R3L-srv>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180711131225.GI1969@MiWiFi-R3L-srv>
Sender: linux-kernel-owner@vger.kernel.org
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, pasha.tatashin@oracle.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Anshuman Khandual <khandual@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

Baoquan He <bhe@redhat.com> writes:
> On 07/11/18 at 10:49pm, Michael Ellerman wrote:
>> akpm@linux-foundation.org writes:
>> > The mm-of-the-moment snapshot 2018-07-10-16-50 has been uploaded to
>> >
>> >    http://www.ozlabs.org/~akpm/mmotm/
>> ...
>> 
>> > * mm-sparse-add-a-static-variable-nr_present_sections.patch
>> > * mm-sparsemem-defer-the-ms-section_mem_map-clearing.patch
>> > * mm-sparsemem-defer-the-ms-section_mem_map-clearing-fix.patch
>> > * mm-sparse-add-a-new-parameter-data_unit_size-for-alloc_usemap_and_memmap.patch
>> > * mm-sparse-optimize-memmap-allocation-during-sparse_init.patch
>> > * mm-sparse-optimize-memmap-allocation-during-sparse_init-checkpatch-fixes.patch
>> 
>> > * mm-sparse-remove-config_sparsemem_alloc_mem_map_together.patch
>> 
>> This seems to be breaking my powerpc pseries qemu boots.
...
>
> Have you tried reverting that patch and building kernel to test again?
> Does it work?

Yes.

Reverting that patch on top of 98be45067040799a801e6ce52d8bf4659a153893
works as before.

cheers
