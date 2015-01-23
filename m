From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: mmotm 2015-01-22-15-04: qemu failures due to 'mm: account pmd
 page tables to the process'
Date: Fri, 23 Jan 2015 13:55:19 -0800
Message-ID: <20150123135519.9f1061caf875f41f89298d59@linux-foundation.org>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org>
	<20150123050445.GA22751@roeck-us.net>
	<20150123111304.GA5975@node.dhcp.inet.fi>
	<54C263CC.1060904@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:40136 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750809AbbAWVzV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2015 16:55:21 -0500
In-Reply-To: <54C263CC.1060904@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

On Fri, 23 Jan 2015 07:07:56 -0800 Guenter Roeck <linux@roeck-us.net> wrote:

> >>
> >> qemu:microblaze generates warnings to the console.
> >>
> >> WARNING: CPU: 0 PID: 32 at mm/mmap.c:2858 exit_mmap+0x184/0x1a4()
> >>
> >> with various call stacks. See
> >> http://server.roeck-us.net:8010/builders/qemu-microblaze-mmotm/builds/15/steps/qemubuildcommand/logs/stdio
> >> for details.
> >
> > Could you try patch below? Completely untested.
> >
> >>From b584bb8d493794f67484c0b57c161d61c02599bc Mon Sep 17 00:00:00 2001
> > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > Date: Fri, 23 Jan 2015 13:08:26 +0200
> > Subject: [PATCH] microblaze: define __PAGETABLE_PMD_FOLDED
> >
> > Microblaze uses custom implementation of PMD folding, but doesn't define
> > __PAGETABLE_PMD_FOLDED, which generic code expects to see. Let's fix it.
> >
> > Defining __PAGETABLE_PMD_FOLDED will drop out unused __pmd_alloc().
> > It also fixes problems with recently-introduced pmd accounting.
> >
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> 
> Tested working.
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Any idea how to fix the sh problem ?

Can you tell us more about it?  All I'm seeing is "qemu:sh fails to
shut down", which isn't very clear.
