From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Introduce rculist.h
Date: Tue, 1 Jul 2008 07:59:03 +0200
Message-ID: <20080701055903.GC14658@elte.hu>
References: <20080701125607.c5295759.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:37626 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751508AbYGAGFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Jul 2008 02:05:48 -0400
Content-Disposition: inline
In-Reply-To: <20080701125607.c5295759.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Franck Bui-Huu <fbuihuu@gmail.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Josh Triplett <josh@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> In linux-next there is a commit ("rcu: split list.h and move 
> rcu-protected lists into rculist.h") that moved the rcu related list 
> iterators from list.h to rculist.h.  Add a trivial version of the file 
> now so that various subsystem trees can start using it now for -next 
> changes and so reduce the build errors caused by adding uses of the 
> moved functions.
> 
> Cc: Franck Bui-Huu <fbuihuu@gmail.com>
> Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Cc: Josh Triplett <josh@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Ingo Molnar <mingo@elte.hu>

Acked-by: Ingo Molnar <mingo@elte.hu>

	Ingo
