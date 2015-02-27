From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 26 Feb 2015 21:59:05 -0800
Message-ID: <20150227055905.GG15405@linux.vnet.ibm.com>
References: <20150227131856.31dcc340@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:46531 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750754AbbB0F7J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Feb 2015 00:59:09 -0500
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 26 Feb 2015 22:59:09 -0700
Content-Disposition: inline
In-Reply-To: <20150227131856.31dcc340@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 27, 2015 at 01:18:56PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> arch/x86/xen/smp.c: In function 'xen_cpu_up':
> arch/x86/xen/smp.c:460:6: error: 'err' undeclared (first use in this function)
>   if (err)
>       ^
> 
> Caused by commit b92c23b083d6 ("x86: Use common
> outgoing-CPU-notification code").
> 
> I have used the rcu tree from next-20150226 for today.

Apologies for the hassle!  I have fixed this.

							Thanx, Paul
