From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Wed, 30 Sep 2015 16:17:45 +1000
Message-ID: <20150930161745.6cdd1e53@canb.auug.org.au>
References: <20150916101245.60235b54@canb.auug.org.au>
	<20150916061652.GB22064@krava.redhat.com>
	<20150917103423.1663c15e@canb.auug.org.au>
	<20150930125640.5e3d6c25@canb.auug.org.au>
	<20150930060812.GA26628@krava.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49738 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753432AbbI3GRr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Sep 2015 02:17:47 -0400
In-Reply-To: <20150930060812.GA26628@krava.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Olsa <jolsa@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Jiri,

On Wed, 30 Sep 2015 08:08:12 +0200 Jiri Olsa <jolsa@redhat.com> wrote:
>
> ouch, forgot to CC you, sry

No worries, I was watching ...

> it won't fix the build if you still have old .cmd file in you tree (I presume that's the case),
> once those are regenerated you shouldn't meet the issue again

Unfortunately this is what happens to me every day :-( (at least until
these changes are merged into Linus' tree).  Its fine, I have automated
the clean up of the perf build object directory after merging the tip
tree.  However, this will also happen to anyone who has built perf then
updates their tree and then tries to rebuild perf.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
