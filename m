From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: unsigned commit in the rcu tree
Date: Sun, 26 Mar 2017 16:18:13 -0700
Message-ID: <20170326231813.GZ3637@linux.vnet.ibm.com>
References: <20170327003327.3d5bf230@canb.auug.org.au>
 <20170326162204.GX3637@linux.vnet.ibm.com>
 <20170327094549.1868c8e5@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35254 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751576AbdCZXSm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Mar 2017 19:18:42 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2QNDiiD098278
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2017 19:18:16 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 29dmpgv1tu-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sun, 26 Mar 2017 19:18:15 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 26 Mar 2017 19:18:15 -0400
Content-Disposition: inline
In-Reply-To: <20170327094549.1868c8e5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Mon, Mar 27, 2017 at 09:45:49AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Sun, 26 Mar 2017 09:22:04 -0700 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> wrote:
> >
> > On Mon, Mar 27, 2017 at 12:33:27AM +1100, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > Commit 08b35b89141a ("fixup! srcu: Create a tiny SRCU") has not
> > > Signed-off-by tag at all :-(
> > > 
> > > Please do not put commits in your linux-next included branch that are
> > > not signed.  
> > 
> > I should have done the rebase before pushing, which I have now done.
> > Please accept my apologies for the noise!
> 
> Now worries, but I think you forgot to push (i.e. that commit is still
> the top of the rcu tree as I see it) ...

Quite right!  I just pushed the new branch.

							Thanx, Paul
