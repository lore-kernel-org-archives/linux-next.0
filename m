From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2015-01-22-15-04: qemu failures due to 'mm: account pmd
 page tables to the process'
Date: Tue, 27 Jan 2015 13:24:33 -0800
Message-ID: <20150127132433.dbe4461d9caeecdb50f28b42@linux-foundation.org>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org>
	<20150123050445.GA22751@roeck-us.net>
	<20150123111304.GA5975@node.dhcp.inet.fi>
	<54C263CC.1060904@roeck-us.net>
	<20150123135519.9f1061caf875f41f89298d59@linux-foundation.org>
	<20150124055207.GA8926@roeck-us.net>
	<20150126122944.GE25833@node.dhcp.inet.fi>
	<54C6494D.80802@roeck-us.net>
	<20150127161657.GA7155@node.dhcp.inet.fi>
	<20150127162428.GA21638@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20150127162428.GA21638@roeck-us.net>
Sender: owner-linux-mm@kvack.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Tue, 27 Jan 2015 08:24:28 -0800 Guenter Roeck <linux@roeck-us.net> wrote:

> > __PAGETABLE_PMD_FOLDED is defined during <asm/pgtable.h> which is not
> > included into <linux/mm_types.h>. And we cannot include it here since
> > many of <asm/pgtables> needs <linux/mm_types.h> to define struct page.
> > 
> > I failed to come up with better solution rather than put nr_pmds into
> > mm_struct unconditionally.
> > 
> > One possible solution would be to expose number of page table levels
> > architecture has via Kconfig, but that's ugly and requires changes to
> > all architectures.
> > 
> FWIW, I tried a number of approaches. Ultimately I gave up and concluded
> that it has to be either this patch or, as you say here, we would have
> to add something like PAGETABLE_PMD_FOLDED as a Kconfig option.

It's certainly a big mess.  Yes, I expect that moving
__PAGETABLE_PMD_FOLDED and probably PAGETABLE_LEVELS into Kconfig logic
would be a good fix.

Adding 8 bytes to the mm_struct (sometimes) isn't a huge issue, but
it does make the kernel just a little bit worse.

Has anyone taken a look at what the Kconfig approach would look like?

Possibly another fix for this would be to move mm_struct into its own
header file, or something along those lines?

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
