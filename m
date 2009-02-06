From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Fri, 6 Feb 2009 14:53:49 +0100
Message-ID: <20090206135349.GB3415@elte.hu>
References: <20090206132601.b207fb0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46180 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754856AbZBFNyK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 08:54:10 -0500
Content-Disposition: inline
In-Reply-To: <20090206132601.b207fb0e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip-core tree got a conflict in
> arch/x86/mach-voyager/voyager_smp.c between commit
> 92ab78315c638515d0e81b0c70b2082f713582d9 ("x86/Voyager: make it build and
> boot") from Linus' tree and commit
> 552be871e67ff577ed36beb2f53d078b42304739 ("x86: pass in cpu number to
> switch_to_new_gdt()") from the tip-core tree.
> 
> I used the resolution from tip/master (see below -worth checking that I 
> got it right).  (Though I assume that there is no reason that the other 
> uses of smp_processor_id() in voyager_smp_prepare_boot_cpu could be 
> replaced by "cpu" as well?)

Thanks!

Note that the x86/Voyager code will have to be totally reworked ontop of the 
new x86 subarch code and that the cpumask logic there is largely obsolete 
(in the context of linux-next) and cannot be triggered via any 
Kconfig-reachable build mode anymore.

I've pushed out a next tip/auto-core-next branch so the conflict should 
disappear from your tree.

Note that there's another upcoming conflict, in arch/x86/mm/fault.c, due to 
this upstream commit from a few hours ago:

  9be260a: prevent kprobes from catching spurious page faults

This will conflict both with the pagefault cleanups in tip/x86/mm and with 
tip/kmemcheck so it's a non-trivial 3-way conflict. I've resolved the 
conflicts explicitly on the Git level and pushed out a freshly integrated 
x86-next, core-next and kmemcheck-next tree as well - so you should not be 
seeing conflicts in that area.

Note: take care because these trees also contain a lot of new stuff: the x86 
APIC and subarch rewrite, the shiny new percpu changes and cleanup and more. 
Let us know if you run into any trouble with them.

Thanks,

	Ingo
