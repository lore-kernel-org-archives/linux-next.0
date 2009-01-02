From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Fri, 2 Jan 2009 10:59:06 +0100
Message-ID: <20090102095906.GI1975@elte.hu>
References: <20090102133557.0750cdbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:56252 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756048AbZABJ7Z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 04:59:25 -0500
Content-Disposition: inline
In-Reply-To: <20090102133557.0750cdbe.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Rusty,
> 
> Today's linux-next merge of the rr_cpumask tree got a conflict in
> arch/x86/kernel/io_apic.c between commit
> 22f65d31b25a320a5246592160bcb102d2791c45 ("x86: Update io_apic.c to use
> new cpumask API") from the cpus4096 tree and commit
> 2ca1a615835d9f4990f42102ab1f2ef434e7e89c ("Merge branch 'master' of
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6") (or
> something - I suspect git has failed me a little here) from the
> rr_cpumask tree.
> 
> It is a bit of a train wreck :-)
> 
> I have dropped the rr_cpumask tree for today and also the rr tree that 
> depends on it.

hm, i'll work with Rusty on fixing that - you should really not be seeing 
conflicts on that level.

	Ingo
