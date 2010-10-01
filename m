From: Robert Richter <robert.richter@amd.com>
Subject: Re: linux-next: manual merge of the oprofile tree with the tip tree
Date: Fri, 1 Oct 2010 15:21:52 +0200
Message-ID: <20101001132151.GC13563@erda.amd.com>
References: <20101001135301.5307c860.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101001135301.5307c860.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <will.deacon@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

On 30.09.10 23:53:01, Stephen Rothwell wrote:
> Today's linux-next merge of the oprofile tree got a conflict in
> arch/arm/oprofile/common.c between commit
> 98d943b02f6f1b57787ff1aa6f34d019a407e3ee ("oprofile, ARM: Release
> resources on failure") from the tip tree and commit
> c7fd239a647ead1c336a051012d6bb96465ea8c6 ("ARM: oprofile: fix and
> simplify init/exit functions") from the oprofile tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Stephen,

thanks for catching this. I have updated the oprofile/for-next tree
and now it should merge without conflicts with tip.

Will,

you may pull the merge from oprofile/core too.

Thanks again,

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
