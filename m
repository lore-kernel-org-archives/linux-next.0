From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 7 Jan 2016 10:02:44 -0800
Message-ID: <20160107180244.GR3818@linux.vnet.ibm.com>
References: <20160107195725.3a130b4d@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:33285 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751920AbcAGSVR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jan 2016 13:21:17 -0500
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 7 Jan 2016 11:21:16 -0700
Content-Disposition: inline
In-Reply-To: <20160107195725.3a130b4d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 07, 2016 at 07:57:25PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> [I found this a few days ago, but I think I forgot to send the email,
> sorry.]
> 
> After merging the rcu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> kernel/rcu/rcuperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_srcu_array'
> kernel/rcu/rcutorture.o:(.discard+0x0): first defined here
> 
> Caused by commit
> 
>   abcd7ec0808e ("rcutorture: Add RCU grace-period performance tests")
> 
> I have reverted that commit for today.

Hello, Stephen,

Very strange.  The "static" keyword does not mean anything here?
Easy enough to use different symbols in the two different files,
but this situation is not so good for information hiding.

Happy to update rcuperf.c to use a different name, but in the
immortal words of MSDOS, "Are you sure?" :-)

						Thanx, Paul
