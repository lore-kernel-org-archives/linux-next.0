From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the lost-spurious-irq tree with the
 tip tree
Date: Tue, 05 Oct 2010 08:59:13 +0200
Message-ID: <4CAACCC1.6000000@kernel.org>
References: <20101005141334.6a0f15fd.sfr@canb.auug.org.au> <4CAABC0E.3030700@kernel.org> <20101005063227.GB12267@elte.hu> <4CAACBDA.6090308@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4CAACBDA.6090308@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 10/05/2010 08:55 AM, Tejun Heo wrote:
> I think Stephen had done enough.  At the time, I wasn't sure which
> tree it was going to go through and it took some time before Thomas
> responded, so I was intending to push it through separately.  I should
> have retracted the tree right after it was determined to be
> reimplemented but forgot.  That's my mistake not Stephen's.  Sorry
> about that.

Oooh, apparently I knew it was gonna go through genirq but expected it
to go through as-is and wanted to accelerate testing.  FWIW, I'm
sure everyone involved was notified of the move at the time.  At any
rate, won't happen again.

Thanks.

-- 
tejun
