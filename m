From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH] powerpc: fix compile fail in hugetlb cmdline parsing
Date: Tue, 08 May 2012 13:53:24 +0930
Message-ID: <878vh3cncz.fsf@rustcorp.com.au>
References: <1336401142-18733-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50586 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751826Ab2EHEpR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 May 2012 00:45:17 -0400
In-Reply-To: <1336401142-18733-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Becky Bruce <beckyb@kernel.crashing.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>

On Mon,  7 May 2012 10:32:22 -0400, Paul Gortmaker <paul.gortmaker@windriver.com> wrote:
> Commit 9fb48c744ba6a4bf58b666f4e6fdac3008ea1bd4
> 
>     "params: add 3rd arg to option handler callback signature"
> 
> added an extra arg to the function, but didn't catch all the use
> cases needing it, causing this compile fail in mpc85xx_defconfig:
> 
>  arch/powerpc/mm/hugetlbpage.c:316:4: error: passing argument 7 of
>  'parse_args' from incompatible pointer type [-Werror]
> 
>  include/linux/moduleparam.h:317:12: note: expected
> 	 'int (*)(char *, char *, const char *)' but argument is of type
> 	 'int (*)(char *, char *)'
> 
> This function has no need to printk out the "doing" value, so
> just add the arg as an "unused".
> 
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> Cc: Jim Cromie <jim.cromie@gmail.com>
> Cc: Jason Baron <jbaron@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Becky Bruce <beckyb@kernel.crashing.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks,
Rusty.
