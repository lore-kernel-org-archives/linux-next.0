From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: build failure after merge of the rcu tree
Date: Mon, 9 Oct 2017 12:43:41 -0700
Message-ID: <20171009194341.GK3521@linux.vnet.ibm.com>
References: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55844 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754830AbdJITno (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Oct 2017 15:43:44 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v99Jfngt088322
        for <linux-next@vger.kernel.org>; Mon, 9 Oct 2017 15:43:43 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2dgaucy2nv-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 09 Oct 2017 15:43:43 -0400
Received: from localhost
        by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 9 Oct 2017 15:43:42 -0400
Content-Disposition: inline
In-Reply-To: <20171009170540.45xwjhyvdwiwxcxe@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org

On Mon, Oct 09, 2017 at 06:05:40PM +0100, Mark Brown wrote:
> After merging the rcu tree an arm64 defconfig fails to build with:
> 
> /home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c: In function 'tegra_ivc_ad
> vance_tx':
> /home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c:154:39: error: lvalue required as left operand of assignment
>   READ_ONCE(ivc->tx.channel->tx.count) =
>                                        ^
> /home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c: In function 'tegra_ivc_advance_rx':
> /home/broonie/tmpfs/next/drivers/firmware/tegra/ivc.c:165:39: error: lvalue required as left operand of assignment
>   READ_ONCE(ivc->rx.channel->rx.count) =
>                                        ^
> /home/broonie/tmpfs/next/scripts/Makefile.build:313: recipe for target 'drivers/firmware/tegra/ivc.o' failed
> 
> caused by 669f98e232aa6f77bd60 ("drivers/firmware/tegra: Convert
> ACCESS_ONCE() to READ_ONCE()") in the rcu tree.  I've reverted to the
> RCU version from September 28th (which is already in Linus' tree).

And this one is me having failed to push that last fix out.  But the
whole commit is going away in favor of Mark Rutland's Coccinelle script
anyway.

							Thanx, Paul
