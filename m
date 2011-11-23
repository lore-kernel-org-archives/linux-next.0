From: Deng-Cheng Zhu <dczhu@mips.com>
Subject: Re: linux-next: manual merge of the tip tree with the mips tree
Date: Wed, 23 Nov 2011 10:07:25 +0800
Message-ID: <4ECC555D.4080902@mips.com>
References: <20111123130148.2a437aabdf6120e7e9b6928c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111123130148.2a437aabdf6120e7e9b6928c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

On 11/23/2011 10:01 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in
> arch/mips/kernel/perf_event_mipsxx.c between commit f40c522a4216
> ("MIPS/Perf-events: Remove erroneous check on active_events") and
> c481e48d9478 ("MIPS/Perf-events: Remove pmu and event state checking in
> validate_event()") from the mips tree and commit aa2bc1ade590 ("perf:
> Don't use -ENOSPC for out of PMU resources") from the tip tree.
>
> Just context changes (and one hunk was removed).  I fixed it up (see
> below) and can carry the fix as necessary.

Yes, I was aware of this conflict while writing that patch series based
on linux-mips tree. Your changes look good to me. Thanks for the fixup!


Deng-Cheng
