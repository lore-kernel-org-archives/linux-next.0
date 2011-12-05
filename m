From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for Sept 28 (mrst)
Date: Mon, 5 Dec 2011 19:10:33 +0000
Message-ID: <20111205191033.191615af@lxorguk.ukuu.org.uk>
References: <20110928200404.6ed0d6c34161d233be8994fd@canb.auug.org.au>
	<4E839B94.9040305@xenotime.net>
	<4EDD0FED.7060301@xenotime.net>
	<20111205184105.GA20121@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:47527 "EHLO
	earthlight.etchedpixels.co.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932126Ab1LETJA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 14:09:00 -0500
In-Reply-To: <20111205184105.GA20121@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>

On Mon, 5 Dec 2011 19:41:05 +0100
Ingo Molnar <mingo@elte.hu> wrote:

> 
> * Randy Dunlap <rdunlap@xenotime.net> wrote:
> 
> > On 09/28/2011 03:11 PM, Randy Dunlap wrote:
> > > On 09/28/11 03:04, Stephen Rothwell wrote:
> > >> Hi all,
> > > 
> > > 
> > > When CONFIG_X86_INTEL_MID=y but CONFIG_X86_MRST is not enabled
> > > (this is on an i386/X86_32 build):
> > > 
> > > rtc.c:(.init.text+0x6234): undefined reference to `__mrst_cpu_chip'
> > > 
> > > Full randconfig file is attached.
> > 
> > Hm, it's now 20111205 and this build error is still around.
> > Is there any hope for getting it fixed?
> 
> Alan?

Don't think I saw the original report - I'll take a look. I imagine it's
just an X86_MRST that didn't get changed rightly.
