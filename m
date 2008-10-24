From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: drivers/lguest/page_tables.c:1044: error: invalid initializer
Date: Fri, 24 Oct 2008 13:08:23 +1100
Message-ID: <200810241308.23959.rusty@rustcorp.com.au>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au> <20081023144814.GA3754@x200.localdomain>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:50605 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092AbYJXCIX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 22:08:23 -0400
In-Reply-To: <20081023144814.GA3754@x200.localdomain>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matias Zabaljauregui <zabaljauregui@gmail.com>

On Friday 24 October 2008 01:48:14 Alexey Dobriyan wrote:
> On i386-smp-y-debug-y-preempt-n-paravirt-y-mem-01:
>
> drivers/lguest/page_tables.c: In function 'setup_pagetables':
> drivers/lguest/page_tables.c:1044: error: invalid initializer

This is the lguest PAE patches, which I've pushed back for the moment (even 
after this fix, it crashed my host and I haven't had time to figure out why).

Thanks,
Rusty.
