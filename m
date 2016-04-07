From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Thu, 7 Apr 2016 10:48:33 +0200
Message-ID: <20160407084833.GA2288@gmail.com>
References: <20160407152603.173426e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34016 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755272AbcDGIsi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Apr 2016 04:48:38 -0400
Content-Disposition: inline
In-Reply-To: <20160407152603.173426e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc ppc44x_defconfig)
> produced this warning:
> 
> mm/gup.c: In function 'get_user_pages_fast':
> mm/gup.c:1510:20: warning: unused variable 'mm' [-Wunused-variable]
>   struct mm_struct *mm = current->mm;
>                     ^
> 
> Introduced by commit
> 
>   dc8cfd957d85 ("mm/gup: Remove the macro overload API migration helpers from the get_user*() APIs")

Indeed - and this only triggers on HAVE_GENERIC_RCU_GUP.

I've amended the commit.

Thanks,

	Ingo
