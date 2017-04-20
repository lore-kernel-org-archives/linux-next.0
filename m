From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 20 Apr 2017 07:23:32 -0700
Message-ID: <20170420142332.GL3956@linux.vnet.ibm.com>
References: <20170420153647.1a93652b@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43655 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1032421AbdDTOXs (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 Apr 2017 10:23:48 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3KENbqs138761
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2017 10:23:37 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0a-001b2d01.pphosted.com with ESMTP id 29xwqgbp0u-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2017 10:23:36 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 20 Apr 2017 10:23:36 -0400
Content-Disposition: inline
In-Reply-To: <20170420153647.1a93652b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>

On Thu, Apr 20, 2017 at 03:36:47PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> [Also reported by Michael elsewhere]
> 
> After merging the rcu tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed like this:
> 
> arch/powerpc/kvm/book3s_hv_rmhandlers.S: Assembler messages:
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:587: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:617: Error: operand out of range (0x0000000000009d88 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:619: Error: operand out of range (0x0000000000009dc0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:643: Error: operand out of range (0x0000000000009df8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:650: Error: operand out of range (0x0000000000009d8c is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1353: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1663: Error: operand out of range (0x0000000000009db0 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1665: Error: operand out of range (0x0000000000009dc8 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1734: Error: operand out of range (0x0000000000009db8 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1782: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1837: Error: operand out of range (0x0000000000009de0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1877: Error: operand out of range (0x0000000000009ff8 is not between 0xffffffffffff8000 and 0x0000000000007fff)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1918: Error: operand out of range (0x0000000000009de0 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> arch/powerpc/kvm/book3s_hv_rmhandlers.S:1943: Error: operand out of range (0x000000000000a048 is not between 0xffffffffffff8000 and 0x0000000000007ffc)
> 
> Caused by commit
> 
>   b2bb79507ba1 ("srcu: Parallelize callback handling")
> 
> I have left it broken for today.

Well, I guess I made good on my promise to break this in a more subtle
and creative way...  :-/

Please let me know what you need me to do.  I suppose that I could
push part of the srcu_struct into another structure and dynamically
allocate it, but that sounds a bit ugly...

							Thanx, Paul
