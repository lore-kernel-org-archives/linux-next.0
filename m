From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUGFIX][PATCH] sgi-xp: xpc needs to pass the physical
	address, not virtual
Date: Tue, 16 Dec 2008 23:04:39 +0100
Message-ID: <20081216220439.GC14787@elte.hu>
References: <20081212170659.GA13377@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:45921 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756386AbYLPWEu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 17:04:50 -0500
Content-Disposition: inline
In-Reply-To: <20081212170659.GA13377@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russ Anderson <rja@sgi.com>
Cc: tglx@linutronix.de, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>, Dean Nelson <dcn@sgi.com>


* Russ Anderson <rja@sgi.com> wrote:

> xpc needs to pass the physical address, not virtual.
> 
> Signed-off-by: Russ Anderson <rja@sgi.com>
> Acked-by: Dean Nelson <dcn@sgi.com>
> 
> ---
> Testing uncovered this problem.  The virtual address happens to work
> most of the time due to the way bios was masking off the node bits.
> Passing the physical address makes it work all of the time.
> 
> 
>  arch/x86/include/asm/uv/bios.h |    2 +-
>  arch/x86/kernel/bios_uv.c      |    4 +---
>  drivers/misc/sgi-xp/xpc_uv.c   |    8 ++++----
>  3 files changed, 6 insertions(+), 8 deletions(-)

applied to tip/x86/uv, thanks Russ!

	Ingo
