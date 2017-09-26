From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with Linus' tree
Date: Mon, 25 Sep 2017 20:26:28 -0700
Message-ID: <20170926032628.GT3521@linux.vnet.ibm.com>
References: <20170926130018.421ed780@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56228 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S936176AbdIZD0e (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Sep 2017 23:26:34 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8Q3Pja6024008
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2017 23:26:34 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2d77drpnts-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 25 Sep 2017 23:26:33 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 25 Sep 2017 23:26:33 -0400
Content-Disposition: inline
In-Reply-To: <20170926130018.421ed780@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>

On Tue, Sep 26, 2017 at 01:00:18PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   28585a832602 ("rcu: Allow for page faults in NMI handlers")
> 
> from Linus' tree and commit:
> 
>   3e2baa988b9c ("rcu: Allow for page faults in NMI handlers")
> 
> from the rcu tree.
> 
> I fixed it up (I just used the rcu tree version) and can carry the fix
> as necessary. This is now fixed as far as linux-next is concerned, but
> any non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Hello, Stephen,

This conflict will disappear tomorrow, as I have merged the commit
from Linus's tree in place of mine and have added another commit that 
removes the READ_ONCE()s.  Same result, but no conflict.  ;-)

							Thanx, Paul
