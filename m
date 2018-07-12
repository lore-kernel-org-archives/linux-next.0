From: Pavel Tatashin <pasha.tatashin@oracle.com>
Subject: Re: [next-20180711][Oops] linux-next kernel boot is broken on powerpc
Date: Thu, 12 Jul 2018 13:44:59 -0400
Message-ID: <CAGM2rebtisZda0kqhg0u92fTDxC+=zMNNgKFBLH38osphk0fdA@mail.gmail.com>
References: <1531416305.6480.24.camel@abdul.in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531416305.6480.24.camel@abdul.in.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: abdhalee@linux.vnet.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, mpe@ellerman.id.au, sachinp@linux.vnet.ibm.com, venkatb3@in.ibm.com, manvanth@linux.vnet.ibm.com, sim@linux.vnet.ibm.com, Michal Hocko <mhocko@suse.com>, Linux Memory Management List <linux-mm@kvack.org>, aneesh.kumar@linux.vnet.ibm.com
List-Id: linux-next.vger.kernel.org

> Related commit could be one of below ? I see lots of patches related to mm and could not bisect
>
> 5479976fda7d3ab23ba0a4eb4d60b296eb88b866 mm: page_alloc: restore memblock_next_valid_pfn() on arm/arm64
> 41619b27b5696e7e5ef76d9c692dd7342c1ad7eb mm-drop-vm_bug_on-from-__get_free_pages-fix
> 531bbe6bd2721f4b66cdb0f5cf5ac14612fa1419 mm: drop VM_BUG_ON from __get_free_pages
> 479350dd1a35f8bfb2534697e5ca68ee8a6e8dea mm, page_alloc: actually ignore mempolicies for high priority allocations
> 088018f6fe571444caaeb16e84c9f24f22dfc8b0 mm: skip invalid pages block at a time in zero_resv_unresv()

Looks like:
0ba29a108979 mm/sparse: Remove CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER

This patch is going to be reverted from linux-next. Abdul, please
verify that issue is gone once  you revert this patch.

Thank you,
Pavel
