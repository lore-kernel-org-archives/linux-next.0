From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Mon, 28 Aug 2017 10:50:51 -0700
Message-ID: <20170828175051.GX11320@linux.vnet.ibm.com>
References: <20170828142548.6c929298@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49997 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751241AbdH1Ruj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Aug 2017 13:50:39 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7SHnbsI096336
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2017 13:50:39 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2cmng5hjfs-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 28 Aug 2017 13:50:39 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 28 Aug 2017 13:50:38 -0400
Content-Disposition: inline
In-Reply-To: <20170828142548.6c929298@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

On Mon, Aug 28, 2017 at 02:25:48PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from arch/arm/kernel/asm-offsets.c:14:0:
> include/linux/sched.h: In function 'membarrier_sched_out':
> include/linux/sched.h:1680:3: error: implicit declaration of function 'sync_core' [-Werror=implicit-function-declaration]
>    sync_core();
>    ^
> 
> Caused by commit
> 
>   0d6eb99818da ("membarrier: Provide register sync core cmd")
> 
> I have used the rcu tree from next-20170825 for today.

I have dropped this, and will likely re-add with the facility provided
or with an ARCH_ kconfig option.

Sorry for the hassle!

							Thanx, Paul
