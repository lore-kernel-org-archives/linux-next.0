From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for Dec 6 (x86, not SMP)
Date: Tue, 6 Dec 2011 20:53:21 +0100
Message-ID: <20111206195320.GA886@elte.hu>
References: <20111206154450.5e2ef2baed27993b23a55802@canb.auug.org.au>
 <4EDE7EB7.7080507@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:44348 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752850Ab1LFTzE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Dec 2011 14:55:04 -0500
Content-Disposition: inline
In-Reply-To: <4EDE7EB7.7080507@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>


* Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 12/05/2011 08:44 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20111205:
> 
> 
> on x86, when CONFIG_SMP is not enabled:
> 
> arch/x86/kernel/cpu/common.c:1149:2: error: 'struct cpuinfo_x86' has no member named 'phys_proc_id'

Yeah, all resolved already, next day's linux-next ought to fix 
it.

Thanks,

	Ingo
