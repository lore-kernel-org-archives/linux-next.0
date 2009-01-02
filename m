From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Fri, 2 Jan 2009 16:17:40 +1030
Message-ID: <200901021617.40995.rusty@rustcorp.com.au>
References: <20090102133557.0750cdbe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36198 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750979AbZABFvI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 00:51:08 -0500
In-Reply-To: <20090102133557.0750cdbe.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Friday 02 January 2009 13:05:57 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next merge of the rr_cpumask tree got a conflict in
> arch/x86/kernel/io_apic.c between commit
> 22f65d31b25a320a5246592160bcb102d2791c45 ("x86: Update io_apic.c to use
> new cpumask API") from the cpus4096 tree and commit
> 2ca1a615835d9f4990f42102ab1f2ef434e7e89c ("Merge branch 'master' of
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6") (or
> something - I suspect git has failed me a little here)

Yes, I've had several 'git blame' pointing to merges from Ingo's tree.
And they tend to be n-way merges, so tracing it down is too hard.

The cpus4096 tree is supposed to have already merged the cpumask tree,
so this should not have happened.

> I have dropped the rr_cpumask tree for today and also the rr tree that
> depends on it.

OK I will remove this dependency for the moment.

Rusty.
