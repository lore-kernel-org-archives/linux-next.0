From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Fri, 11 Mar 2016 14:51:47 +0100
Message-ID: <2013252.3GROyIk989@vostro.rjw.lan>
References: <20160311125746.42e35ea8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:63355 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752917AbcCKNtw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Mar 2016 08:49:52 -0500
In-Reply-To: <20160311125746.42e35ea8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Friday, March 11, 2016 12:57:46 PM Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/sched/sched.h
> 
> between commit:
> 
>   adaf9fcd1369 ("cpufreq: Move scheduler-related code to the sched directory")
> 
> from the pm tree and commit:
> 
>   e9532e69b8d1 ("sched/cputime: Fix steal time accounting vs. CPU hotplug")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Looks good to me, thanks!

Rafael
