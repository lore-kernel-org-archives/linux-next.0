From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Date: Wed, 21 Jun 2017 06:30:40 -0700
Message-ID: <20170621133040.GT3721@linux.vnet.ibm.com>
References: <20170621164806.2caba20a@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49530 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752377AbdFUNao (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jun 2017 09:30:44 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5LDScw9018021
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2017 09:30:43 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2b7r1mdr37-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 21 Jun 2017 09:30:43 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 21 Jun 2017 09:30:42 -0400
Content-Disposition: inline
In-Reply-To: <20170621164806.2caba20a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 21, 2017 at 04:48:06PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allnoconfig)
> produced this warning:
> 
> kernel/cpu.c: In function 'boot_cpu_state_init':
> kernel/cpu.c:1778:6: warning: unused variable 'cpu' [-Wunused-variable]
>   int cpu;
>       ^
> 
> Introduced by commit
> 
>   faeb334286b7 ("rcu: Migrate callbacks earlier in the CPU-offline timeline")

Hello, Stephen,

Apologies, should be fixed now -- added a __maybe_unused.

But I didn't realize you did SMP=n builds!  ;-)

							Thanx, Paul
