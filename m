From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 23 Oct 2012 12:51:29 -0700
Message-ID: <1351021889.7502.55.camel@joe-AO722>
References: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
	 <20121023124414.61568323.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:42354 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757239Ab2JWTva (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Oct 2012 15:51:30 -0400
In-Reply-To: <20121023124414.61568323.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay@vrfy.org>

On Tue, 2012-10-23 at 12:44 -0700, Andrew Morton wrote:
> On Tue, 23 Oct 2012 14:42:21 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Andrew,
> > 
> > After merging the akpm tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > kernel/printk/printk_syslog.c: In function 'printk_syslog_print':
> > kernel/printk/printk_syslog.c:108:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
> > kernel/printk/printk_syslog.c: In function 'do_syslog':
> > kernel/printk/printk_syslog.c:245:3: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
> > kernel/printk/printk_syslog.c:245:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
> > kernel/printk/printk_syslog.c:245:18: note: each undeclared identifier is reported only once for each function it appears in
> > 
> > Caused by commit 598815e5f25f ("printk: add printk_syslog.c and .h").
> > 
> > Presumably missing an (or some) include files - see Rule 1 in
> > Documentation/SubmitChecklist.
> > 
> > I have reverted that commit for today (and the following commit
> > 2cf91e0e4b9f ("printk: move kmsg_dump functions to separate file")).
> 
> I'll add the include.
> 
> btw, what's up with printk_syslog.h?  It includes two header files which it
> doesn't need but fails to include the two it *does* need: printk_log.h
> and types.h.
> 
> 

printk_syslog.c includes kernel.h (it includes types.h)
and printk_log.h.

I think printk_syslog.h doesn't need printk_log.h

I'd appreciate being cc'd.

There's also a needed fix for braille
and a duplicate #define.

I'll resubmit the whole series tomorrow.

cheers, Joe
