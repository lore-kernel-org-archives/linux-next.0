From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemcheck tree
Date: Mon, 28 Jul 2008 11:05:30 +0200
Message-ID: <20080728090530.GA5732@elte.hu>
References: <20080728140111.832c3bc8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:56021 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751012AbYG1JFr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 05:05:47 -0400
Content-Disposition: inline
In-Reply-To: <20080728140111.832c3bc8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the kmemcheck tree got a conflict in 
> init/main.c between commits c2147a5092cfe13dbf3210e54e8a622015edeecc 
> ("Better interface for hooking early initcalls") and 
> 7babe8db99d305340cf4828ce1f5a1481d5622ef ("Full conversion to 
> early_initcall() interface, remove old interface") from Linus' tree 
> and commit 385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add 
> the kmemcheck core") from the kmemcheck tree.
> 
> I used the upstream version and turned kmemcheck_init into an 
> early_initcall().

thanks Stephen.

I made this fixup too, yesterday, but solved it differently: i added 
kmemcheck_init() to before all early initcalls. I think that's the best 
solution for a fundamental debug feature like kmemcheck. (which could 
catch bugs in early initcalls as well) What do you think?

i've pushed out a new auto-kmemcheck-next branch, so the conflicts 
should go away on your next iteration.

	Ingo
