From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next:  stacktace build failure
Date: Tue, 8 Jul 2008 14:24:08 +0200
Message-ID: <20080708122408.GA22788@elte.hu>
References: <20080708221540.9e0c0d2e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52355 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753653AbYGHMYZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:24:25 -0400
Content-Disposition: inline
In-Reply-To: <20080708221540.9e0c0d2e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next build (spac64 allmodconfig) failed like this:
> 
> arch/sparc64/kernel/stacktrace.c:50: warning: type defaults to `int' in declaration of `EXPORT_SYMBOL_GPL'
> arch/sparc64/kernel/stacktrace.c:50: warning: parameter names (without types) in function declaration
> arch/sparc64/kernel/stacktrace.c:50: warning: data definition has no type or storage class
> 
> Signed-off-by: Stephen Rothwell <sf@canb.auug.org.au>
> 
> diff --git a/arch/sparc64/kernel/stacktrace.c b/arch/sparc64/kernel/stacktrace.c
> index 49656ed..b3e3737 100644
> --- a/arch/sparc64/kernel/stacktrace.c
> +++ b/arch/sparc64/kernel/stacktrace.c
> @@ -1,6 +1,7 @@
>  #include <linux/sched.h>
>  #include <linux/stacktrace.h>
>  #include <linux/thread_info.h>
> +#include <linux/module.h>
>  #include <asm/ptrace.h>
>  #include <asm/stacktrace.h>

applied, thanks Stephen.

	Ingo
