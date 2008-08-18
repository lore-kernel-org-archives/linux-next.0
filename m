From: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
Subject: Re: linux-next: manual merge of the tests tree
Date: Mon, 18 Aug 2008 10:12:35 +0530
Message-ID: <20080818044235.GA3665@in.ibm.com>
References: <20080815145948.690f8529.sfr@canb.auug.org.au>
Reply-To: ananth@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:38347 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbYHREnG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 00:43:06 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id m7I4h3iY023191
	for <linux-next@vger.kernel.org>; Mon, 18 Aug 2008 00:43:03 -0400
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m7I4h3u4203732
	for <linux-next@vger.kernel.org>; Mon, 18 Aug 2008 00:43:03 -0400
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m7I4h2El021489
	for <linux-next@vger.kernel.org>; Mon, 18 Aug 2008 00:43:03 -0400
Content-Disposition: inline
In-Reply-To: <20080815145948.690f8529.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>

On Fri, Aug 15, 2008 at 02:59:48PM +1000, Stephen Rothwell wrote:
> Hi Ananth,
> 
> Today's linux-next merge of the tests tree got a conflict in
> lib/Kconfig.debug between commit 67182ae1c42206e516f7efb292b745e826497b24
> ("rcu, debug: detect stalled grace periods") from the sched tree and
> commit 2b9b631dd2507b5480b752bcca946b9767b9bae1 ("Move rcutorture to
> tests/") from the tests tree.
> 
> I sort of fixed it up.

Thanks Stephen.

> Ananth, you should try to get the testing stuff into Linus' tree ...

We've tried multiple times already (last attempt was
http://marc.info/?l=linux-kernel&m=121727532926590&w=2).

Guess as Andrew said, this is way below in the priority scale. I am not
sure at this point if we should just let things be as they are if there
isn't much interest in merging it upstream.

Ananth
