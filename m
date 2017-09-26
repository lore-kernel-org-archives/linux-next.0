From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Tree for Sep 19 (x86/kernel/cpuinfo.c)
Date: Tue, 26 Sep 2017 18:00:44 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1709261759060.2884@nanos>
References: <20170919141557.03ffb2a7@canb.auug.org.au> <75e3d5e7-091e-9b26-47cc-36bece726b9e@infradead.org> <46a06a76-a17c-de77-362a-99a18efaee79@infradead.org> <alpine.DEB.2.20.1709260930220.1941@nanos> <20170926081841.GA937@kroah.com>
 <alpine.DEB.2.20.1709261217480.1941@nanos> <20170926123608.5azf7xqwobsnkc7b@angmar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:49177 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966178AbdIZQBT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2017 12:01:19 -0400
In-Reply-To: <20170926123608.5azf7xqwobsnkc7b@angmar>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Felix Schnizlein <fschnizlein@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Borislav Petkov <bp@alien8.de>

On Tue, 26 Sep 2017, Felix Schnizlein wrote:
> On 26.09.17, Thomas Gleixner wrote:
> > > And these patches were posted many times, Felix, you did cc: the arch
> > > maintainers, right?  I don't have access to my archives at the moment...
> I send all my patches via:
> git send-email --to linux-kernel@vger.kernel.org --cc x86@kernel.org --cc gregkh@linuxfoundation.org --cc trenn@suse.com v4*.patch
> 
> Did I miss something?

You missed the fact that this stuff never showed up on LKML and
interestingly enough it did not make it to x86@k.org either.

Thanks,

	tglx
