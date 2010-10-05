From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the lost-spurious-irq tree with the
 tip tree
Date: Tue, 05 Oct 2010 07:47:58 +0200
Message-ID: <4CAABC0E.3030700@kernel.org>
References: <20101005141334.6a0f15fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101005141334.6a0f15fd.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Hello, Stephen.

On 10/05/2010 05:13 AM, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next merge of the lost-spurious-irq tree got a conflict in
> kernel/irq/spurious.c between commits
> 6b8ff3120c758340505dddf08ad685ebb841d5d5 ("genirq: Convert core code to
> irq_data") and bd151412263a67b5321e9dd1d5b4bf6d96fdebf3 ("genirq: Provide
> config option to disable deprecated code") from the tip tree and commits
> 32b5d378f49485f3ae172eb0ac2bfc4ebbbdb060 ("irq: cleanup irqfixup") and
> 80f97e2b33c3e66c11b10abd2890506a3abeb320 ("irq: make spurious poll timer
> per desc") from the lost-spurious-irq tree.
> 
> I think I fixed it all up (see below).  I can carry this fix (or a better
> one) as necessary.

Can you please drop lost-spurious-irq for now?  It needs to be
reimplemented.  I'll send a merge request again when it's ready.

Thank you.

-- 
tejun
