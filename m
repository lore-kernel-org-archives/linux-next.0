From: Robert Richter <robert.richter@amd.com>
Subject: Re: linux-next: manual merge of the oprofile tree with the tip tree
Date: Wed, 21 Mar 2012 13:33:48 +0100
Message-ID: <20120321123348.GJ16322@erda.amd.com>
References: <20120321163151.83cad17d5524424938f7576c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]:44381
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755914Ab2CUMd7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Mar 2012 08:33:59 -0400
Content-Disposition: inline
In-Reply-To: <20120321163151.83cad17d5524424938f7576c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lin Ming <ming.m.lin@intel.com>, Jiri Olsa <jolsa@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

On 21.03.12 16:31:51, Stephen Rothwell wrote:
> Today's linux-next merge of the oprofile tree got a conflict in
> tools/perf/util/parse-events.c between commit 89812fc81f8d ("perf tools:
> Add parser generator for events parsing") from the tip tree and commit
> 1e48600d2388 ("perf tool: Parse general/raw events from sysfs") from the
> oprofile tree.
> 
> I have no idea how to fix this up, so I effectively dropped this patch
> from the oprofile tree.

Yeah, the trees are totally different now. Removed my tree from
for-next.

Btw, please switch my for-next tree back to kernel.org:

 git://git.kernel.org/pub/scm/linux/kernel/git/rric/oprofile.git for-next

Thanks.

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
