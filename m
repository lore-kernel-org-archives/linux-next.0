From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Thu, 3 Jul 2008 08:26:57 +0200
Message-ID: <20080703062657.GA26365@elte.hu>
References: <20080703161236.368d7926.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39926 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755319AbYGCG1O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:27:14 -0400
Content-Disposition: inline
In-Reply-To: <20080703161236.368d7926.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Pekka Paalanen <pq@iki.fi>, Thomas Gleixner <tglx@linutronix.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in 
> arch/x86/mm/Makefile between commit 
> ff3a3e9ba5e4273a8bc10570adab4a390fb90757 ("x86 mmiotrace: move files 
> into arch/x86/mm/") from the ftrace tree and commit 
> 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the 
> kmemcheck core") from the kmemcheck tree.
> 
> Just overlapping additions.

thanks Stephen. These are the conflict resolutions i've been carrying 
for a few months:

    Merge branch 'kmemcheck' into auto-latest

    Conflicts:

        arch/x86/mm/Makefile
        include/asm-x86/pgtable.h
        kernel/sysctl.c

the arch/x86/mm/Makefile and kernel/sysctl.c ones are trivial - but the 
pgtable.h is non-trivial: you might want to glean the resolution out of 
tip/auto-latest.

Shortly before the release of a stable kernel is the 'maximum dynamic 
pressure' point of the launch of the next Linux version - this is when 
the highest number of conflicts arise. [ And i hope these three are not 
too bad to break the rocket apart ;-) ]

	Ingo
