From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: build warnings after merge of the final tree
Date: Mon, 02 Aug 2010 18:03:50 +1000
Message-ID: <1280736230.1902.56.camel@pasglop>
References: <20100802141035.f84f9132.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100802141035.f84f9132.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 2010-08-02 at 14:10 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allnoconfig with CONFIG_DEBUG_SECTION_MISMATCH=y) produced these warnings:

 .../...

> Introduced by the memblock series in the tip tree.

Ok, so those are my fault but none are deadly. I'll do a fixup patch on
top of this.

Cheers,
Ben.
