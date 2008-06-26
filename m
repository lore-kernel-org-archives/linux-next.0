From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Thu, 26 Jun 2008 09:06:58 -0700
Message-ID: <20080626160658.GC10859@linux.vnet.ibm.com>
References: <20080625150315.ab536f8a.sfr@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP05.au.ibm.com ([202.81.18.174]:53743 "EHLO
	e23smtp05.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751498AbYFZQHC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Jun 2008 12:07:02 -0400
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [202.81.18.234])
	by e23smtp05.au.ibm.com (8.13.1/8.13.1) with ESMTP id m5QG6MVl017631
	for <linux-next@vger.kernel.org>; Fri, 27 Jun 2008 02:06:22 +1000
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5QG6aTr4092082
	for <linux-next@vger.kernel.org>; Fri, 27 Jun 2008 02:06:36 +1000
Received: from d23av02.au.ibm.com (loopback [127.0.0.1])
	by d23av02.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5QG7091007752
	for <linux-next@vger.kernel.org>; Fri, 27 Jun 2008 02:07:00 +1000
Content-Disposition: inline
In-Reply-To: <20080625150315.ab536f8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

On Wed, Jun 25, 2008 at 03:03:15PM +1000, Stephen Rothwell wrote:
> Hi Ananth,
> 
> Today's linux-next merge of the tests tree got a conflict in
> lib/Kconfig.debug between commit 31a72bce0bd6f3e0114009288bccbc96376eeeca
> ("rcu: make rcutorture more vicious: reinstate boot-time testing") from
> the sched tree and commit db00d6090740863199393461c8332812986ce4ad ("Move
> rcutorture to tests/") from the tests tree.
> 
> Paul has added another CONFIG option related to the RCU tests. I fixed it
> up, hopefully correctly.  Probably worth a look when I publish the tree.

Let me know, I will be happy to look it over.

							Thanx, Paul
