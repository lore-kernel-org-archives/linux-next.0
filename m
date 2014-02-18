From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Tue, 18 Feb 2014 09:06:03 +0100
Message-ID: <20140218080603.GA27512@samfundet.no>
References: <20140218140920.e79e5cff80dad8ecee400538@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140218140920.e79e5cff80dad8ecee400538@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chen Gang <gang.chen.5i5j@gmail.com>, Hans-Christian Egtvedt <hegtvedt@cisco.com>, Tim Chen <tim.c.chen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

Around Tue 18 Feb 2014 14:09:20 +1100 or thereabout, Stephen Rothwell wrote:

Hello Stephen,

> Today's linux-next merge of the tip tree got a conflict in
> arch/avr32/include/asm/Kbuild between commit d7668f9d448a ("avr32: add
> generic vga.h to Kbuild") from the  tree and commit b119fa61d440
> ("locking/mcs: Order the header files in Kbuild of each architecture in
> alphabetical order") from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thank you for handling the merge.

PS! I typically don't use my Cisco address for avr32 related kernel patches,
but it seems to be my own fault, my global gitconfig contained my @cisco.com
address. Fixed now.

-- 
Best regards,
Hans-Christian Egtvedt
