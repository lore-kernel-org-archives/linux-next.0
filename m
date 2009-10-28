From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip tree build warning
Date: Wed, 28 Oct 2009 08:31:45 +0100
Message-ID: <20091028073145.GD6353@elte.hu>
References: <20091028181443.50a09dbb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41016 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932577AbZJ1Hbz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Oct 2009 03:31:55 -0400
Content-Disposition: inline
In-Reply-To: <20091028181443.50a09dbb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> In file included from arch/x86/include/asm/smp.h:13,
>                  from arch/x86/include/asm/mmzone_64.h:12,
>                  from arch/x86/include/asm/mmzone.h:4,
>                  from include/linux/mmzone.h:783,
>                  from include/linux/gfp.h:4,
>                  from include/linux/kmod.h:22,
>                  from include/linux/module.h:13,
>                  from arch/x86/kernel/apic/apic_noop.c:14:
> arch/x86/include/asm/apic.h: In function 'default_apicid_to_cpu_present':
> arch/x86/include/asm/apic.h:591: warning: the frame size of 8192 bytes is larger than 2048 bytes
> 
> It may not have been caused by the tip tree, but I can't find what 
> changed to cause this and a commit from the tip tree has exposed it 
> (9844ab11c763bfed9f054c82366b19dcda66aca9 "x86, apic: Introduce the 
> NOOP apic driver").

That commit is very simple. Are you sure it's not GCC bogosity?

	Ingo
