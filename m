From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: linux-next: manual merge of the arc tree with Linus' tree
Date: Fri, 26 Jun 2015 11:21:42 +0530
Message-ID: <558CE86E.8040006@synopsys.com>
References: <20150626094751.3c5a6490@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:49714 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751277AbbFZFwS (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 26 Jun 2015 01:52:18 -0400
In-Reply-To: <20150626094751.3c5a6490@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>

On Friday 26 June 2015 05:17 AM, Stephen Rothwell wrote:
> Hi Vineet,
> 
> Today's linux-next merge of the arc tree got a conflict in:
> 
>   include/asm-generic/barrier.h
> 
> between commits:
> 
>   ab3f02fc2372 ("locking/arch: Add WRITE_ONCE() to set_mb()")
>   b92b8b35a2e3 ("locking/arch: Rename set_mb() to smp_store_mb()")
> 
> from Linus' tree and commit:
> 
>   470c27e4695a ("arch: conditionally define smp_{mb,rmb,wmb}")
> 
> from the arc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 


LGTM.

Thx Stephan.

-Vineet
