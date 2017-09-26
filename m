From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 12:40:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709261217480.1941@nanos>
References: <20170919141557.03ffb2a7@canb.auug.org.au> <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org> <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org> <alpine.DEB.2.20.1709260930220.1941@nanos> <20170926081841.GA937@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:48132 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967555AbdIZKlC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 06:41:02 -0400
In-Reply-To: <20170926081841.GA937@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Felix Schnizlein <fschnizlein@suse.com>, Borislav Petkov <bp@alien8.de>

On Tue, 26 Sep 2017, Greg Kroah-Hartman wrote:
> On Tue, Sep 26, 2017 at 09:40:00AM +0200, Thomas Gleixner wrote:
> > On Mon, 25 Sep 2017, Randy Dunlap wrote:
> > > On 09/19/17 08:54, Randy Dunlap wrote:
> > > > On 09/18/17 21:15, Stephen Rothwell wrote:
> > > >> Hi all,
> > > >>
> > > >> Changes since 20170918:
> > > >>
> > > >> Linus' tree still had its build failure for which I reverted a commit.
> > > >>
> > > > 
> > > > on i386:
> > > > 
> > > > ../arch/x86/kernel/cpuinfo.c: In function 'cpuinfo_flags':
> > 
> > Where does this file come from? Random driver code added to arch/x86? This
> > was neither acked nor reviewed by any x86 maintainer and just slapped into
> > arch/x86/kernel/ without spending a split second of brain to find the spot
> > where it actually belongs. It's not rocket science to figure that out.
> 
> It is arch specific, cpu specific to be specific :)
> 
> Where would you have this file go instead?

arch/x86/kernel/cpu/

That's where all the CPU related stuff including the proc/cpuinfo code
lives. It's not rocket science to figure that out.

> And these patches were posted many times, Felix, you did cc: the arch
> maintainers, right?  I don't have access to my archives at the moment...

I have the following mails related to this in my direct inbox archive,
i.e. where I was CC'ed and exactly the same amount in my full LKML archive:

http://lkml.kernel.org/r/20170614150410.GA15806@kroah.com
http://lkml.kernel.org/r/20170802160420.GA18507@kroah.com
http://lkml.kernel.org/r/20170802164621.43ckgv2vieudvifc@angmar
http://lkml.kernel.org/r/20170802174725.GB2333@kroah.com
http://lkml.kernel.org/r/59824864020000EE001C9890@smtp.nue.novell.com
http://lkml.kernel.org/r/20170828152906.GA2810@kroah.com
http://lkml.kernel.org/r/20170828153642.GA29792@kroah.com
http://lkml.kernel.org/r/20170906134531.GB11779@kroah.com

All of these mails were completely out of context, i.e. the stuff was never
posted to LKML at all. I got them because you added x86@kernel.org when
replying.

And all what I could see from your replies was:

>  arch/Kconfig                                       |  3 ++
>  drivers/base/Makefile                              |  1 +
>  drivers/base/cpuinfo.c                             | 48 ++++++++++++++++++++++
>  include/linux/cpuhotplug.h                         |  1 +
>  include/linux/cpuinfo.h                            | 43 +++++++++++++++++++

which I blissfully ignored.

Thanks,

	tglx
