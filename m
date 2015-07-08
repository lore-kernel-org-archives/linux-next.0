From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 8 Jul 2015 11:40:59 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1507081140390.3916@nanos>
References: <20150708105606.301171bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:36129 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757112AbbGHJlS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2015 05:41:18 -0400
In-Reply-To: <20150708105606.301171bb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 8 Jul 2015, Stephen Rothwell wrote:
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/cpu.c: In function '_cpu_down':
> kernel/cpu.c:398:2: error: implicit declaration of function 'irq_lock_sparse' [-Werror=implicit-function-declaration]
>   irq_lock_sparse();
>   ^
> kernel/cpu.c:407:3: error: implicit declaration of function 'irq_unlock_sparse' [-Werror=implicit-function-declaration]
>    irq_unlock_sparse();
>    ^
> 
> Caused by commit
> 
>   fc862aa8288b ("hotplug: Prevent alloc/free of irq descriptors during cpu up/down")
> 
> Forgot to include linux/irqdesc.h.
> 
> I have used the tip tree from next-20150707 for today.

Fixed in tip. Sorry for the hickup.
