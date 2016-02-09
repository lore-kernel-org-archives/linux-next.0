From: Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: linux-next: manual merge of the akpm tree with the tip tree
Date: Tue, 9 Feb 2016 14:04:24 +0000
Message-ID: <20160209140424.GA2288@codeblueprint.co.uk>
References: <20160209155024.56b77932@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33088 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754648AbcBIOE0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2016 09:04:26 -0500
Received: by mail-wm0-f41.google.com with SMTP id g62so175838087wme.0
        for <linux-next@vger.kernel.org>; Tue, 09 Feb 2016 06:04:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160209155024.56b77932@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Elliott <elliott@hpe.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, 09 Feb, at 03:50:24PM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   arch/x86/platform/efi/efi.c
> 
> between commit:
> 
>   1e82b9479070 ("x86/efi: Show actual ending addresses in efi_print_memmap")
> 
> from the tip tree and commit:
> 
>   e0532ef9f825 ("x86/efi: print size and base in binary units in efi_print_memmap")
> 
> from the akpm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

I think Andrew agreed to drop this patch from his tree,

  https://lkml.kernel.org/r/20160122151100.GA3747@codeblueprint.co.uk
