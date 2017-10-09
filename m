From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: build failure after merge of the rcu tree
Date: Mon, 9 Oct 2017 12:42:35 -0700
Message-ID: <20171009194235.GJ3521@linux.vnet.ibm.com>
References: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
 <20171009171724.frgul6w6ggbirgns@sirena.co.uk>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34840 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754293AbdJITmh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 15:42:37 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v99JgGii024867
        for <linux-next@vger.kernel.org>; Mon, 9 Oct 2017 15:42:36 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2dgc1mb1v5-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 09 Oct 2017 15:42:36 -0400
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 9 Oct 2017 15:42:36 -0400
Content-Disposition: inline
In-Reply-To: <20171009171724.frgul6w6ggbirgns@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org

On Mon, Oct 09, 2017 at 06:17:24PM +0100, Mark Brown wrote:
> On Mon, Oct 09, 2017 at 06:05:40PM +0100, Mark Brown wrote:
> 
> > caused by 669f98e232aa6f77bd60 ("drivers/firmware/tegra: Convert
> > ACCESS_ONCE() to READ_ONCE()") in the rcu tree.  I've reverted to the
> > RCU version from September 28th (which is already in Linus' tree).
> 
> BTW there were also a bunch of merge issues that I sent out mails for
> but they seem to have gone AWOL somewhere, don't know if you got them :/

Hello, Mark,

I did get three of them, thank you!  The one involving rcu_irq_enter()
is because one of my commits hit mainline early, so I will need to rebase
to get things straightened out.  Almost all of the ACCESS_ONCE() commits
are going away, courtesy of Mark Rutland's Coccinelle script.  The one
involving the timer will be resolved by my updating my diagnostic commit.

All in all, I should have left some of these commits out of rcu/next,
apologies for the noise!

							Thanx, Paul
