From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- sparc32: fix broken set_pte()
Date: Thu, 22 Jan 2015 11:34:19 -0800
Message-ID: <54C150BB.6050000@roeck-us.net>
References: <20150120185308.53f4af4e@canb.auug.org.au> <20150120202642.GA6178@roeck-us.net> <20150120225443.GA19629@node.dhcp.inet.fi> <54BF1785.7040300@roeck-us.net> <20150121104325.GA22449@node.dhcp.inet.fi> <54C06B19.8060305@roeck-us.net> <20150122171338.GA1039@node.dhcp.inet.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150122171338.GA1039@node.dhcp.inet.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>, davem@davemloft.net
Cc: Mel Gorman <mgorman@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Moore <pmoore@redhat.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
List-Id: linux-next.vger.kernel.org

On 01/22/2015 09:13 AM, Kirill A. Shutemov wrote:
...
> vm_normal_page() is never called in this case, since prot_numa is always
> zero.
>
> I tracked the bug down. It's a sparc bug. The commit only triggers it,
> because affect how GCC optimize the code around faulty point.
>
> Please, test.
>
>>From 5b9232753217412116a4cdc2897be0db818371ca Mon Sep 17 00:00:00 2001
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Date: Thu, 22 Jan 2015 18:42:13 +0200
> Subject: [PATCH] sparc32: fix broken set_pte()
>
> 32-bit sparc uses swap instruction to implement set_pte(). It called
> using GCC inline assembler. But it misses the "memory" clobber to
> indicate that pte value will be updated in memory.
>
> As result GCC doesn't know that it cannot postpone pte pointer
> dereference which occurs before set_pte() to post-set_pte() time.
>
> It leads to real-world bugs -- [1]. In this situation we have code:
>
> 	ptent = ptep_modify_prot_start(mm, addr, pte);
> 	ptent = pte_modify(ptent, newprot);
> 	...
> 	ptep_modify_prot_commit(mm, addr, pte, ptent);
>
> ptep_modify_prot_start() in sparc case is just 'pte' dereference plus
> pte_clear(). pte_clear() calls broken set_pte(). GCC thinks it's valid
> to dereference 'pte' again on pte_modify() and gets cleared pte.
> ptep_modify_prot_commit() puts 'pteent' with pfn==0 back to page table,
> which eventually leads to the crash.
>
> [1] http://lkml.kernel.org/r/54C06B19.8060305@roeck-us.net
>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Guenter Roeck <linux@roeck-us.net>

Excellent catch. Yes, the fix works.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter
