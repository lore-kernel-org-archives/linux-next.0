From: Alex Shi <alex.shi@intel.com>
Subject: Re: linux-next: manual merge of the percpu tree with the tip tree
Date: Wed, 16 May 2012 21:40:02 +0800
Message-ID: <4FB3AE32.8060006@intel.com>
References: <20120516173616.ed5b60cf4b16e34a57206559@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120516173616.ed5b60cf4b16e34a57206559@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 05/16/2012 03:36 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the percpu tree got a conflict in
> arch/x86/mm/tlb.c between commit a6fca40f1d7f ("x86, tlb: Switch cr3 in
> leave_mm() only when needed") from the tip tree and commit c6ae41e7d469
> ("x86: replace percpu_xxx funcs with this_cpu_xxx") from the percpu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.


Thanks a lot!

My auto-scripts just watching upstream kernel, so missing this...

but happy to know the pain of code clean up is closing soon. ;)
