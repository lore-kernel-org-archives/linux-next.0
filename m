From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/2] CPUFREQ: powernow-k8: Forgot to use printk instead
	of WARN_ONCE in last patch
Date: Thu, 5 Feb 2009 13:42:34 +0100
Message-ID: <20090205124234.GD8799@elte.hu>
References: <1233829109-23358-1-git-send-email-trenn@suse.de> <1233829109-23358-2-git-send-email-trenn@suse.de> <20090205120203.GA8799@elte.hu> <200902051327.16852.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52146 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752462AbZBEMnE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 07:43:04 -0500
Content-Disposition: inline
In-Reply-To: <200902051327.16852.trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org


* Thomas Renninger <trenn@suse.de> wrote:

> Looking at WARN() again:
> #ifndef __WARN
> #ifndef __ASSEMBLY__
> extern void warn_slowpath(const char *file, const int line,
>                 const char *fmt, ...) __attribute__((format(printf, 3, 4)));
> #define WANT_WARN_ON_SLOWPATH
> #endif
> #define __WARN()                warn_slowpath(__FILE__, __LINE__, NULL)
> #define __WARN_printf(arg...)   warn_slowpath(__FILE__, __LINE__, arg)
> #else
> #define __WARN_printf(arg...)   do { printk(arg); __WARN(); } while (0)
> #endif
> 
> WARN_ONCE does throw a backtrace (warn_slowpath does) or I missed
> something...
> Thus WARN_ONCE makes a big difference to printk_once() (which does not
> exist? but would be neat...) and prints out the backtrace, right?

yes, correct. We use WARN()/WARN_ONCE() in places where an error is 
surprising and where we want to print a backtrace too.

In this case you are right to point out that it's not a kernel bug but a 
BIOS environment bug, and that the text itself uniquely identifies the place 
it comes from. So using a printk is perfectly fine.

There's a few cleanups necessary with the printk solution too though, see my 
previous mail for the details.

printk_once() would be nice indeed - it's a frequent construct.

	Ingo
