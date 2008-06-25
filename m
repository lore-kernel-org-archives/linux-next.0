From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Wed, 25 Jun 2008 10:50:29 +0530
Message-ID: <20080625052029.GB14783@in.ibm.com>
References: <20080625150315.ab536f8a.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:58335 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752714AbYFYFVf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2008 01:21:35 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com [9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m5P5LXA3030434
	for <linux-next@vger.kernel.org>; Wed, 25 Jun 2008 01:21:33 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m5P5LWX0163936
	for <linux-next@vger.kernel.org>; Tue, 24 Jun 2008 23:21:32 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m5P5LWSo016123
	for <linux-next@vger.kernel.org>; Tue, 24 Jun 2008 23:21:32 -0600
Content-Disposition: inline
In-Reply-To: <20080625150315.ab536f8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>

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

Thanks Stephen! I'll take a look.

Its probably worth merging the tests/ tree in 2.6.27-rc1, given its been
in linux-next for over 3 months now.

Ananth
