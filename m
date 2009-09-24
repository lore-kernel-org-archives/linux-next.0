From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Thu, 24 Sep 2009 10:33:09 +0200
Message-ID: <20090924083309.GA14270@elte.hu>
References: <20090924140738.3b8ab138.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:47394 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752425AbZIXIdW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Sep 2009 04:33:22 -0400
Content-Disposition: inline
In-Reply-To: <20090924140738.3b8ab138.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Stefani Seibold <stefani@seibold.net>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in
> fs/proc/array.c between commit d899bf7b55f503ba7d3d07ed27c3a37e270fa7db
> ("procfs: provide stack information for threads") from Linus' tree and
> commit d01d4827858cdc2e1c437c87ab65ec0a00fd40f8 ("sched: Always show
> Cpus_allowed field in /proc/<pid>/status") from the tip tree.
> 
> Just overlapping additions.  I fixed it up (see below) and can cay the
> fix for a while. This appears to be fixed the same way in tip:master.

Thanks - that's how i fixed it up yesterday, and it tested fine. Have 
just pushed out this resolution, so the conflict should disappear from 
linux-next tomorrow.

Thanks,

	Ingo
