From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the kspp tree
Date: Mon, 11 Jul 2016 09:13:07 +0200
Message-ID: <20160711071307.GB6835@gmail.com>
References: <20160711151100.02c0b012@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36253 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757503AbcGKHNM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 03:13:12 -0400
Content-Disposition: inline
In-Reply-To: <20160711151100.02c0b012@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@google.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Len Brown <len.brown@intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/x86/kernel/x86_init.c
> 
> between commit:
> 
>   255303026193 ("x86: apply more __ro_after_init and const")
> 
> from the kspp tree and commit:

Kees, did you plan to submit this patch (and any other pending x86 patches) to the 
x86 tree?

> 
>   1bf8915ae515 ("x86/tsc: Enumerate SKL cpu_khz and tsc_khz via CPUID")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me!

Thanks,

	Ingo
