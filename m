From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the arm-perf tree with the  tree
Date: Mon, 1 Jun 2015 10:52:24 +0100
Message-ID: <20150601095223.GE1641@arm.com>
References: <20150601101253.2e454719@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:33557 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751835AbbFAJw2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2015 05:52:28 -0400
Content-Disposition: inline
In-Reply-To: <20150601101253.2e454719@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <Mark.Rutland@arm.com>

On Mon, Jun 01, 2015 at 01:12:53AM +0100, Stephen Rothwell wrote:
> Hi Will,

Hi Stephen,

> Today's linux-next merge of the arm-perf tree got a conflict in arch/arm/kernel/perf_event_cpu.c between commit 338d9dd3e2ae ("ARM:
> 8351/1: perf: don't warn about missing interrupt-affinity property for
> PPIs") (and others) from Linus' tree and commit 74cf0bc75f16 ("arm:
> perf: unify perf_event{,_cpu}.c") from the arm-perf tree.
> 
> I fixed it up (the changes from Linus' tree have been included in the
> arm-perf tree change, so I just removed the file) and can carry the fix
> as necessary (no action is required).

That's the correct resolution, thanks again.

Will
