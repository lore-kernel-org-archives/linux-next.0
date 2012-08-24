From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ia64 won't boot because of rcu_sched self-detected stall
Date: Fri, 24 Aug 2012 15:06:22 -0700
Message-ID: <20120824220622.GX2472@linux.vnet.ibm.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
 <20120821232038.GV2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19396504@ORSMSX104.amr.corp.intel.com>
 <20120822004608.GW2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19397175@ORSMSX104.amr.corp.intel.com>
 <20120824203714.GT2472@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F193978F8@ORSMSX104.amr.corp.intel.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:53338 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab2HXWHD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Aug 2012 18:07:03 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 24 Aug 2012 16:07:02 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com [9.17.195.228])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 3BF3D3E4003B
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 16:06:57 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q7OM6ljA105526
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 16:06:51 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q7OM6NTL016036
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 16:06:23 -0600
Content-Disposition: inline
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F193978F8@ORSMSX104.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "fweisbec@gmail.com" <fweisbec@gmail.com>

On Fri, Aug 24, 2012 at 09:44:39PM +0000, Luck, Tony wrote:
> > Does the following match what you tested?  I optimistically assumed
> > that it was, but figured I should check.  ;-)
> 
> Yes. That' what I tested.

Very good, thank you!

> > Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
> > Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> Split personality disorder?
> You finally managed to clone yourself to help cover RCU issues?
> Cunning way to get double credit for each patch?
> The lawyers made you do it?

And just why does everyone insist on calling split personality a disorder,
anyway???

No cloning, at best, clowning.  Jon and Greg spiked the two-email dodge
long before I started using two, so currently each of my patches,
regardless of how it is signed off, is counted but once and credited to
Linaro.  And for once, no lawyers were involved.

Hey, you asked!!!  ;-)

							Thanx, Paul
