From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: manual merge of the swiotlb-xen tree with the tip
 tree
Date: Tue, 26 Oct 2010 10:47:28 -0400
Message-ID: <20101026144728.GE9557@dumpdata.com>
References: <20101026130332.002937e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:62549 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752527Ab0JZOtz (ORCPT
	<rfc822;<linux-next@vger.kernel.org>>);
	Tue, 26 Oct 2010 10:49:55 -0400
Content-Disposition: inline
In-Reply-To: <20101026130332.002937e5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Oct 26, 2010 at 01:03:32PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> Today's linux-next merge of the swiotlb-xen tree got a conflict in
> arch/x86/include/asm/io_apic.h between commit
> 23f9b267159b4c7ff59d2e6c8ed31693eff841e3 ("x86: apic: Move
> probe_nr_irqs_gsi() into ioapic_init_mappings()") from the tip tree and
> commit 7b586d71858091f0958e5808b7e3d5390c2ae47d ("x86/io_apic: add
> get_nr_irqs_gsi()") from the swiotlb-xen tree.
> 
> Just context changes. I fixed it up (see below) and can carry the fix as
> necessary.

Thank you.
