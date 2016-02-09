From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Tue, 9 Feb 2016 15:07:01 +0100
Message-ID: <20160209140701.GD26641@gmail.com>
References: <20160209155024.56b77932@canb.auug.org.au>
 <20160209140424.GA2288@codeblueprint.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33445 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754648AbcBIOHF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2016 09:07:05 -0500
Content-Disposition: inline
In-Reply-To: <20160209140424.GA2288@codeblueprint.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matt Fleming <matt@codeblueprint.co.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Elliott <elliott@hpe.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>


* Matt Fleming <matt@codeblueprint.co.uk> wrote:

> On Tue, 09 Feb, at 03:50:24PM, Stephen Rothwell wrote:
> > Hi Andrew,
> > 
> > Today's linux-next merge of the akpm tree got a conflict in:
> > 
> >   arch/x86/platform/efi/efi.c
> > 
> > between commit:
> > 
> >   1e82b9479070 ("x86/efi: Show actual ending addresses in efi_print_memmap")
> > 
> > from the tip tree and commit:
> > 
> >   e0532ef9f825 ("x86/efi: print size and base in binary units in efi_print_memmap")
> > 
> > from the akpm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> I think Andrew agreed to drop this patch from his tree,
> 
>   https://lkml.kernel.org/r/20160122151100.GA3747@codeblueprint.co.uk

... and I tried to follow up on the original submission to still preserve this 
change, as it's no doubt useful to produce easier to read bootup messages.

Thanks,

	Ingo
