From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: manual merge of the cgroup tree with the tip tree
Date: Sun, 20 Dec 2015 23:48:54 -0500
Message-ID: <20151221044854.GB27493@htj.duckdns.org>
References: <20151221154119.66094285@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:36317 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbbLUEs4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 20 Dec 2015 23:48:56 -0500
Content-Disposition: inline
In-Reply-To: <20151221154119.66094285@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>, Johannes Weiner <hannes@cmpxchg.org>

On Mon, Dec 21, 2015 at 03:41:19PM +1100, Stephen Rothwell wrote:
> Hi Tejun,
> 
> Today's linux-next merge of the cgroup tree got a conflict in:
> 
>   init/Kconfig
> 
> between commits:
> 
>   257372262056 ("x86/intel_rdt: Add support for Cache Allocation detection")
>   5ad9144cdb9a ("x86,cgroup/intel_rdt : Add a cgroup interface to manage Intel cache allocation")

Ingo, can you please revert the rdt cgroup.  I still don't think this
is the right approach and tglx's new proposal seems a lot better.

Thanks.

-- 
tejun
