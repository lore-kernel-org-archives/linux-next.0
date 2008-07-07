From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Mon, 7 Jul 2008 08:10:57 +0200
Message-ID: <20080707061057.GB16144@elte.hu>
References: <20080707142114.7985a9dd.sfr@canb.auug.org.au> <20080707145027.0d83038e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:42021 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751305AbYGGGLT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:11:19 -0400
Content-Disposition: inline
In-Reply-To: <20080707145027.0d83038e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
> index b65871e..7bfdad7 100644
> --- a/arch/x86/mm/kmmio.c
> +++ b/arch/x86/mm/kmmio.c
> @@ -23,6 +23,7 @@
>  #include <linux/errno.h>
>  #include <asm/debugreg.h>
>  #include <linux/mmiotrace.h>
> +#include <linux/rculist.h>

the same commit existed already for about two months:

------------------->
commit 668a6c3654560aef8741642478973e205a4f02bf
Author: Ingo Molnar <mingo@elte.hu>
Date:   Mon May 19 13:35:24 2008 +0200

    - fix mmioftrace + rcu merge interaction
    
    Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index b65871e..93d8203 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/list.h>
+#include <linux/rculist.h>
 #include <linux/spinlock.h>
 #include <linux/hash.h>
 #include <linux/init.h>
<----------------------

so i've merged the tip/tracing/mmiotrace-mergefixups branch into 
tip/tracing/mmiotrace. (after having merged tip/tracing/mmiotrace to 
-rc9 so that rculist.h was present already)

	Ingo
