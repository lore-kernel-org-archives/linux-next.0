From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Tue, 23 Oct 2012 12:44:14 -0700
Message-ID: <20121023124414.61568323.akpm@linux-foundation.org>
References: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:54864 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756806Ab2JWToP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Oct 2012 15:44:15 -0400
In-Reply-To: <20121023144221.5ae3061a11766df8175b959d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Kay Sievers <kay@vrfy.org>

On Tue, 23 Oct 2012 14:42:21 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> After merging the akpm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/printk/printk_syslog.c: In function 'printk_syslog_print':
> kernel/printk/printk_syslog.c:108:3: error: implicit declaration of function 'copy_to_user' [-Werror=implicit-function-declaration]
> kernel/printk/printk_syslog.c: In function 'do_syslog':
> kernel/printk/printk_syslog.c:245:3: error: implicit declaration of function 'access_ok' [-Werror=implicit-function-declaration]
> kernel/printk/printk_syslog.c:245:18: error: 'VERIFY_WRITE' undeclared (first use in this function)
> kernel/printk/printk_syslog.c:245:18: note: each undeclared identifier is reported only once for each function it appears in
> 
> Caused by commit 598815e5f25f ("printk: add printk_syslog.c and .h").
> 
> Presumably missing an (or some) include files - see Rule 1 in
> Documentation/SubmitChecklist.
> 
> I have reverted that commit for today (and the following commit
> 2cf91e0e4b9f ("printk: move kmsg_dump functions to separate file")).

I'll add the include.

btw, what's up with printk_syslog.h?  It includes two header files which it
doesn't need but fails to include the two it *does* need: printk_log.h
and types.h.
