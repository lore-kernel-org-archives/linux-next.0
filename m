From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the rcu
 tree
Date: Sun, 9 Feb 2014 21:24:43 -0800
Message-ID: <20140210052443.GH4250@linux.vnet.ibm.com>
References: <20140210150047.65f06219ffa970ad34d27d7f@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:37789 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746AbaBJFYw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Feb 2014 00:24:52 -0500
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Sun, 9 Feb 2014 22:24:51 -0700
Content-Disposition: inline
In-Reply-To: <20140210150047.65f06219ffa970ad34d27d7f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Rientjes <rientjes@google.com>

On Mon, Feb 10, 2014 at 03:00:47PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in
> mm/slub.c between commit f4e40a71719d ("slub: Fix add_full() lockdep
> checks") from the rcu tree and commit aee03fe7a7c8 ("mm/slub.c: list_lock
> may not be held in some circumstances") from the akpm-current tree.
> 
> These patches try to achieve the same thing, so I arbitrarily chose the
> version from the akpm-current tree.

My bad -- I forgot to remove my version.

							Thanx, Paul
