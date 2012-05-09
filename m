From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: fix compile fail in hugetlb cmdline parsing
Date: Wed, 09 May 2012 13:04:18 +1000
Message-ID: <1336532658.1714.15.camel@pasglop>
References: <1336401142-18733-1-git-send-email-paul.gortmaker@windriver.com>
	 <878vh3cncz.fsf@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:55150 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751766Ab2EIDEj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 May 2012 23:04:39 -0400
In-Reply-To: <878vh3cncz.fsf@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Becky Bruce <beckyb@kernel.crashing.org>

On Tue, 2012-05-08 at 13:53 +0930, Rusty Russell wrote:
> On Mon,  7 May 2012 10:32:22 -0400, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> > Commit 9fb48c744ba6a4bf58b666f4e6fdac3008ea1bd4
> > 
> >     "params: add 3rd arg to option handler callback signature"
> > 
> > added an extra arg to the function, but didn't catch all the use
> > cases needing it, causing this compile fail in mpc85xx_defconfig:
> > 
> >  arch/powerpc/mm/hugetlbpage.c:316:4: error: passing argument 7 of
> >  'parse_args' from incompatible pointer type [-Werror]
> > 
> >  include/linux/moduleparam.h:317:12: note: expected
> > 	 'int (*)(char *, char *, const char *)' but argument is of type
> > 	 'int (*)(char *, char *)'
> > 
> > This function has no need to printk out the "doing" value, so
> > just add the arg as an "unused".
> > 
> > Cc: Rusty Russell <rusty@rustcorp.com.au>
> > Cc: Jim Cromie <jim.cromie@gmail.com>
> > Cc: Jason Baron <jbaron@redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Becky Bruce <beckyb@kernel.crashing.org>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> Acked-by: Rusty Russell <rusty@rustcorp.com.au>

This is for -next right ? IE. I don't seem to have the faulty commit
in my tree so I can't carry the fix for now.... or am I missing
something ?

Cheers,
Ben.
