From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the oprofile tree with the tip tree
Date: Tue, 13 Mar 2012 09:31:34 +0100
Message-ID: <20120313083134.GB1888@elte.hu>
References: <20120313173712.52ecb636a1e3d4330fe8baff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45306 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752803Ab2CMIbu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 04:31:50 -0400
Content-Disposition: inline
In-Reply-To: <20120313173712.52ecb636a1e3d4330fe8baff@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robert Richter <robert.richter@amd.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephane Eranian <eranian@google.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Robert,
> 
> Today's linux-next merge of the oprofile tree got a conflict 
> in tools/perf/util/header.c tools/perf/util/header.h between 
> commit 330aa675b4f9 ("perf record: Add HEADER_BRANCH_STACK 
> tag") from the tip tree and commit c415f577eb32 ("perf tools: 
> Add pmu mappings to header information") from the oprofile 
> tree.

Robert,

Hm, that commit should obviously be processed via the regular 
perf channels, not via the oprofile tree ... Please resolve 
this.

Thanks,

	Ingo
