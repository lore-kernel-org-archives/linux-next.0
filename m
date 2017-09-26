From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 10:18:41 +0200
Message-ID: <20170926081841.GA937@kroah.com>
References: <20170919141557.03ffb2a7@canb.auug.org.au>
 <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org>
 <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
 <alpine.DEB.2.20.1709260930220.1941@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:39402 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934968AbdIZISd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 04:18:33 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1709260930220.1941@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Felix Schnizlein <fschnizlein@suse.com>, Borislav Petkov <bp@alien8.de>

On Tue, Sep 26, 2017 at 09:40:00AM +0200, Thomas Gleixner wrote:
> On Mon, 25 Sep 2017, Randy Dunlap wrote:
> > On 09/19/17 08:54, Randy Dunlap wrote:
> > > On 09/18/17 21:15, Stephen Rothwell wrote:
> > >> Hi all,
> > >>
> > >> Changes since 20170918:
> > >>
> > >> Linus' tree still had its build failure for which I reverted a commit.
> > >>
> > > 
> > > on i386:
> > > 
> > > ../arch/x86/kernel/cpuinfo.c: In function 'cpuinfo_flags':
> 
> Where does this file come from? Random driver code added to arch/x86? This
> was neither acked nor reviewed by any x86 maintainer and just slapped into
> arch/x86/kernel/ without spending a split second of brain to find the spot
> where it actually belongs. It's not rocket science to figure that out.

It is arch specific, cpu specific to be specific :)

Where would you have this file go instead?

And these patches were posted many times, Felix, you did cc: the arch
maintainers, right?  I don't have access to my archives at the moment...

And this isn't in Linus's tree, just linux-next for now, I don't see
what Linus's tree has to to with this report, but my coffee hasn't
kicked in yet.

thanks,

greg k-h
