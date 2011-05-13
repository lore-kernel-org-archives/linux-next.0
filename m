From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with the arm tree
Date: Fri, 13 May 2011 10:06:34 +0200
Message-ID: <20110513080634.GA13647@elte.hu>
References: <20110513131437.8999e8eb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110513131437.8999e8eb.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King <rmk+kernel@arm.linux.org.uk>, Russell King <linux@arm.linux.org.uk>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, John Stultz <john.stultz@linaro.org>, Jacob Pan <jacob.jun.pan@intel.com>, Glauber Costa <glommer@redhat.com>, Dimitri Sivanich <sivanich@sgi.com>, Rusty Russell <rusty@rustcorp.com.au>, Jeremy Fitzhardinge <jeremy@xensource.com>, Chris McDermott <lcm@us.ibm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: linux-next.vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in 
> arch/x86/kernel/i8253.c between commit 3490f584b9ba ("clocksource: convert 
> x86 to generic i8253 clocksource") from the arm tree and commit b01cc1b0eae0 
> ("x86: Convert remaining x86 clocksources to clocksource_register_hz/khz") 
> from the tip tree.
> 
> The former seems to supercede the latter, so I used the former.

Russell, how the heck did this commit:

 commit 3490f584b9ba5a0b6f63832fbc9c5ec72506697b
 Author:     Russell King <rmk+kernel@arm.linux.org.uk>
 AuthorDate: Sun May 8 18:55:19 2011 +0100
 Commit:     Russell King <rmk+kernel@arm.linux.org.uk>
 CommitDate: Tue May 10 08:20:54 2011 +0100

    clocksource: convert x86 to generic i8253 clocksource

which has such a clearly x86 diffstat:

 arch/x86/Kconfig             |    1 +
 arch/x86/include/asm/i8253.h |    2 +
 arch/x86/kernel/i8253.c      |   79 +-----------------------------------------
 3 files changed, 4 insertions(+), 78 deletions(-)

end up in the ARM tree without an ack from an x86 maintainer??

Not only did it conflict with a 2 months old commit, but it also broke the 
linux-next x86 build.

I see the commit has an ack from John but that feedback is not visible in the 
lkml thread of this patch nor did John really realize the conflict nor the 
build breakage. The patch was still in the to-be-reviewed queue of our patches.

Nor was it tested properly. The patch looks sane but your workflow sucks. 
Please revert it and use a proper Git workflow to change arch/x86/ details ...

Thanks,

	Ingo
