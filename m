From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 09:40:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709260930220.1941@nanos>
References: <20170919141557.03ffb2a7@canb.auug.org.au> <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org> <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:47546 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964790AbdIZHkJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 03:40:09 -0400
In-Reply-To: <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felix Schnizlein <fschnizlein@suse.com>, Borislav Petkov <bp@alien8.de>

On Mon, 25 Sep 2017, Randy Dunlap wrote:
> On 09/19/17 08:54, Randy Dunlap wrote:
> > On 09/18/17 21:15, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20170918:
> >>
> >> Linus' tree still had its build failure for which I reverted a commit.
> >>
> > 
> > on i386:
> > 
> > ../arch/x86/kernel/cpuinfo.c: In function 'cpuinfo_flags':

Where does this file come from? Random driver code added to arch/x86? This
was neither acked nor reviewed by any x86 maintainer and just slapped into
arch/x86/kernel/ without spending a split second of brain to find the spot
where it actually belongs. It's not rocket science to figure that out.

Please revert.

Thanks,

	tglx
