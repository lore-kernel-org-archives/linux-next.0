From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 23:18:41 +0200
Message-ID: <20170926211841.GA28696@kroah.com>
References: <20170919141557.03ffb2a7@canb.auug.org.au>
 <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org>
 <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org>
 <alpine.DEB.2.20.1709260930220.1941@nanos>
 <20170926081841.GA937@kroah.com>
 <alpine.DEB.2.20.1709261217480.1941@nanos>
 <20170926123608.5azf7xqwobsnkc7b@angmar>
 <alpine.DEB.2.20.1709261759060.2884@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:51964 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937274AbdIZVSc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 17:18:32 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1709261759060.2884@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Felix Schnizlein <fschnizlein@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Borislav Petkov <bp@alien8.de>

On Tue, Sep 26, 2017 at 06:00:44PM +0200, Thomas Gleixner wrote:
> On Tue, 26 Sep 2017, Felix Schnizlein wrote:
> > On 26.09.17, Thomas Gleixner wrote:
> > > > And these patches were posted many times, Felix, you did cc: the arch
> > > > maintainers, right?  I don't have access to my archives at the moment...
> > I send all my patches via:
> > git send-email --to linux-kernel@vger.kernel.org --cc x86@kernel.org --cc gregkh@linuxfoundation.org --cc trenn@suse.com v4*.patch
> > 
> > Did I miss something?
> 
> You missed the fact that this stuff never showed up on LKML and
> interestingly enough it did not make it to x86@k.org either.

Ok, something went really wrong here.

All of the patches of this series are now dropped from my tree entirely.

Felix, please try this again...

thanks,

greg k-h
