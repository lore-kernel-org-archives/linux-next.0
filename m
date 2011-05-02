From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for May 2 (rcutiny)
Date: Mon, 2 May 2011 15:34:35 -0700
Message-ID: <20110502223435.GP2294@linux.vnet.ibm.com>
References: <20110502150150.d932642f.sfr@canb.auug.org.au>
 <20110502083419.80cf9ad6.randy.dunlap@oracle.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e7.ny.us.ibm.com ([32.97.182.137]:55554 "EHLO e7.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754040Ab1EBWek (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2011 18:34:40 -0400
Content-Disposition: inline
In-Reply-To: <20110502083419.80cf9ad6.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, May 02, 2011 at 08:34:19AM -0700, Randy Dunlap wrote:
> On Mon, 2 May 2011 15:01:50 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20110429:
> 
> 
> kernel/rcutiny_plugin.h:337: error: implicit declaration of function 'invoke_rcu_kthread'
> kernel/rcutiny.c:100: warning: conflicting types for 'invoke_rcu_kthread'
> kernel/rcutiny.c:100: error: static declaration of 'invoke_rcu_kthread' follows non-static declaration
> kernel/rcutiny_plugin.h:337: note: previous implicit declaration of 'invoke_rcu_kthread' was here
> 
> 
> randconfig is attached.

Ouch!  Good catch.  Fix applied to -rcu -- lost a declaration in the shuffle.

							Thanx, Paul
