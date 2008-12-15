From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: tree build warning
Date: Mon, 15 Dec 2008 14:56:21 +0100 (CET)
Message-ID: <alpine.LFD.2.00.0812151456060.17621@localhost.localdomain>
References: <20081216003539.75ecce70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:49842 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbYLON4s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 08:56:48 -0500
In-Reply-To: <20081216003539.75ecce70.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>

On Tue, 16 Dec 2008, Stephen Rothwell wrote:

> Hi ,
> 
> Today's linux-next build (powerpc allnoconfig) produced this warning:
> 
> kernel/hrtimer.c: In function 'hrtimer_cpu_notify':
> kernel/hrtimer.c:1574: warning: unused variable 'dcpu'
> 
> Introduced by commit 37810659ea7d9572c5ac284ade272f806ef8f788 ("hrtimer:
> removing all ur callback modes, fix hotplug") from the timers.  dcpu is only used if
> CONFIG_HOTPLUG_CPU is set.

Thanks, will fix.

	tglx
