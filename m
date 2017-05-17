From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: unsigned commits in the rcu tree
Date: Wed, 17 May 2017 15:36:37 -0700
Message-ID: <20170517223637.GN3956@linux.vnet.ibm.com>
References: <20170518081417.2f724fbb@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36364 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750795AbdEQWgl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 May 2017 18:36:41 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4HMSZIt120322
        for <linux-next@vger.kernel.org>; Wed, 17 May 2017 18:36:40 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2agmtvy6eu-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 17 May 2017 18:36:40 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 17 May 2017 18:36:39 -0400
Content-Disposition: inline
In-Reply-To: <20170518081417.2f724fbb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 18, 2017 at 08:14:17AM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> I noticed a couple of commits in the rcu tree today that have no
> Signed-off-by lines:
> 
> 0eeaaea315cd fixup! rcu: Remove nohz_full full-system-idle state machine
> cbe476cef633 fixup! rcu: Remove debugfs tracing
> 
> Please fix them up.

Will do!

Just for completeness, these are --fixup commits, which will be rebased
into the commits that they are fixing up.

							Thanx, Paul
