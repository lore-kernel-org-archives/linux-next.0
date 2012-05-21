From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Mon, 21 May 2012 11:12:57 +0200
Message-ID: <20120521091257.GF31407@gmail.com>
References: <20120521185412.aca92107d0a8c4fdd8474e34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120521185412.aca92107d0a8c4fdd8474e34@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> Invalid absolute R_386_32 relocation: jiffies

Hm, that's our fault: seems like a linker bug fallout, one which 
we fixed in -tip.

> I am not sure what caused this (it may even been a bad merge 
> on my part).  I have left it broken for today.

While we've fixed this, to simplify merge window integration of 
linux-next I've excluded tip:x86/trampoline from the linux-next 
branch for now, so this build failure should go away tomorrow.

Sorry and thanks,

	Ingo
