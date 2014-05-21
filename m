From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 20 May 2014 21:24:18 -0700
Message-ID: <537C2A72.9030503@zytor.com>
References: <20140521141249.6f87b7e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140521141249.6f87b7e7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On 05/20/2014 09:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in 
> arch/x86/kernel/ldt.c between commit fa81511bb0bb ("x86-64,
> modify_ldt: Make support for 16-bit segments a runtime option")
> from Linus' tree and commit 34273f41d57e ("x86, espfix: Make it
> possible to disable 16-bit support") from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no
> action is required).
> 

This (and the previous one) is not the correct fix, although it will
work.  The correct fix is instead to completely revert fa81511bb0bb
before merging in tip:x86/espfix.

Sorry for the inconvenience.  Linus generally doesn't like it when we
fix up merges for him, or I'd set up a "clean" tip:x86/espfix branch.

	-hpa
