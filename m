From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH V9] RO/NX protection for loadable kernel modules
Date: Tue, 2 Feb 2010 08:38:09 +1100 (EST)
Message-ID: <alpine.LRH.2.00.1002020836480.3489@tundra.namei.org>
References: <817ecb6f1002010829m712ffff4hfb64ff3ea236e1f1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <817ecb6f1002010829m712ffff4hfb64ff3ea236e1f1@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Siarhei Liakh <sliakh.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, 1 Feb 2010, Siarhei Liakh wrote:

> The patch have been developed for Linux 2.6.33-rc5 by Siarhei Liakh
> <sliakh.lkml@gmail.com> and Xuxian Jiang <jiang@cs.ncsu.edu>.
> 
> ---
> 
> Signed-off-by: Siarhei Liakh <sliakh.lkml@gmail.com>
> Signed-off-by: Xuxian Jiang <jiang@cs.ncsu.edu>
> Acked-by: Arjan van de Ven <arjan@linux.intel.com>

Reviewed-by: James Morris <jmorris@namei.org>

I gather it would make sense for these to go in via Ingo's tree.

-- 
James Morris
<jmorris@namei.org>
