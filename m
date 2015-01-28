From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: mmotm 2015-01-22-15-04: qemu failures due to 'mm: account pmd
 page tables to the process'
Date: Tue, 27 Jan 2015 22:16:42 -0800
Message-ID: <54C87ECA.9040601@roeck-us.net>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org>	<20150123050445.GA22751@roeck-us.net>	<20150123111304.GA5975@node.dhcp.inet.fi>	<54C263CC.1060904@roeck-us.net>	<20150123135519.9f1061caf875f41f89298d59@linux-foundation.org>	<20150124055207.GA8926@roeck-us.net>	<20150126122944.GE25833@node.dhcp.inet.fi>	<54C6494D.80802@roeck-us.net>	<20150127161657.GA7155@node.dhcp.inet.fi>	<20150127162428.GA21638@roeck-us.net> <20150127132433.dbe4461d9caeecdb50f28b42@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45664 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752748AbbA1GRN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Jan 2015 01:17:13 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YGLw0-002085-7q
	for linux-next@vger.kernel.org; Wed, 28 Jan 2015 06:17:08 +0000
In-Reply-To: <20150127132433.dbe4461d9caeecdb50f28b42@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On 01/27/2015 01:24 PM, Andrew Morton wrote:
> On Tue, 27 Jan 2015 08:24:28 -0800 Guenter Roeck <linux@roeck-us.net> wrote:
>
>>> __PAGETABLE_PMD_FOLDED is defined during <asm/pgtable.h> which is not
>>> included into <linux/mm_types.h>. And we cannot include it here since
>>> many of <asm/pgtables> needs <linux/mm_types.h> to define struct page.
>>>
>>> I failed to come up with better solution rather than put nr_pmds into
>>> mm_struct unconditionally.
>>>
>>> One possible solution would be to expose number of page table levels
>>> architecture has via Kconfig, but that's ugly and requires changes to
>>> all architectures.
>>>
>> FWIW, I tried a number of approaches. Ultimately I gave up and concluded
>> that it has to be either this patch or, as you say here, we would have
>> to add something like PAGETABLE_PMD_FOLDED as a Kconfig option.
>
> It's certainly a big mess.  Yes, I expect that moving
> __PAGETABLE_PMD_FOLDED and probably PAGETABLE_LEVELS into Kconfig logic
> would be a good fix.
>
> Adding 8 bytes to the mm_struct (sometimes) isn't a huge issue, but
> it does make the kernel just a little bit worse.
>
> Has anyone taken a look at what the Kconfig approach would look like?
>

We would need something like

config PAGETABLE_PMD_FOLDED (or maybe PAGETABLE_NOPMD)
	def_bool y

for arc, arm64, avr32, cris, hexagon, metag, mips, mn10300, nios2, openrisc,
powerpc, score, sh, tile, um, unicore32, x86, xtensa, arm, m32r, and
microblaze. In several cases it would depend on secondary options,
such as CONFIG_ARM64_PGTABLE_LEVELS for arm64 or PAGETABLE_LEVELS for x86
and sh. PAGETABLE_LEVELS is not a configuration option (yet), so, yes,
that would have to be converted to a configuration option as well.

Overall a lot of complexity. Not really sure if that is worth the gain.
We would have to touch more than 20 Kconfig files plus about 20
source and include files which currently use _PAGETABLE_PMD_FOLDED.

> Possibly another fix for this would be to move mm_struct into its own
> header file, or something along those lines?
>

I suspect that might be just as messy. We would have to find all files
which actually need mm_struct and make sure that the new mm_struct.h
is included.

Not sure which approach is better. Sure, the 8 (or 4) bytes are annoying,
but I am not sure if the situation is bad enough to really bother.

Ultimately it seems there may be other variables in mm_struct which
could be made optional with much less effort, such as uprobes_state
or mmap_legacy_base.

Guenter
