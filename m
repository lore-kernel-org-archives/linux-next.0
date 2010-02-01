From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH V6] x86: NX protection for kernel data
Date: Tue, 2 Feb 2010 08:40:21 +1100 (EST)
Message-ID: <alpine.LRH.2.00.1002020839190.3489@tundra.namei.org>
References: <817ecb6f1001311527w7914ab20sf15b800dcaa37df7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:59364 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751139Ab0BAVlQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Feb 2010 16:41:16 -0500
In-Reply-To: <817ecb6f1001311527w7914ab20sf15b800dcaa37df7@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On Sun, 31 Jan 2010, Siarhei Liakh wrote:

> V1:  initial patch for 2.6.30
> V2:  patch for 2.6.31-rc7
> V3:  moved all code into arch/x86, adjusted credits
> V4:  fixed ifdef, removed credits from CREDITS
> V5:  fixed an address calculation bug in mark_nxdata_nx()
> V6:  updated for compatibility with 2.6.33-rc5
> ---
> 
> Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
> Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
> Acked-by: Arjan van de Ven <arjan@linux.intel.com>

Reviewed-by: James Morris <jmorris@namei.org>

-- 
James Morris
<jmorris@namei.org>
