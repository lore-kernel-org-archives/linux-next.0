From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [41e83b9][gcc 4.8.5] make modules fail at
 net/netfilter/xt_bpf.ko
Date: Wed, 06 Dec 2017 15:56:59 +0530
Message-ID: <1512556019.13113.18.camel@abdul>
References: <1512484991.13113.11.camel@abdul>
         <20171205180650.GV21978@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59982 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1755123AbdLFK1I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Dec 2017 05:27:08 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB6AQcv9144441
        for <linux-next@vger.kernel.org>; Wed, 6 Dec 2017 05:27:07 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2epech1d32-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 06 Dec 2017 05:27:07 -0500
Received: from localhost
        by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Wed, 6 Dec 2017 03:27:06 -0700
In-Reply-To: <20171205180650.GV21978@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: sachinp <sachinp@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, 2017-12-05 at 18:06 +0000, Al Viro wrote:
> On Tue, Dec 05, 2017 at 08:13:11PM +0530, Abdul Haleem wrote:
> > Hi Al Viro,
> > 
> > Today's next kernel build failed with commit 41e83b9: fix "netfilter:
> > xt_bpf: Fix XT_BPF_MODE_FD_PINNED
> > 
> > Machine Type: Power 7
> > kernel version: 4.15.0-rc2-next-20171204
> > kernel config: attached
> > test: 'make modules'
> > 
> > ERROR: ".bpf_prog_get_type_path" [net/netfilter/xt_bpf.ko] undefined!
> > 
> > Kernel built fine when bad commit is reverted.
> 
> In the same commit there's
> 
> +EXPORT_SYMBOL(bpf_prog_get_type_path);
> 
> so I really wonder WTF is going on...
> 
> Oh, I see.  !BPF_SYSCALL and NETFILTER_XT_MATCH_BPF in .config triggers
> that.  Incremental (to be folded into the commit in question) follows:

Thank you for the patch, the build succeeded. But I see some new
warnings.

./include/linux/bpf.h: In function ‘bpf_prog_get_type_path’:
./include/linux/bpf.h:515:2: warning: return makes pointer from integer
without a cast [enabled by default]
  return -EOPNOTSUPP;
  ^

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
