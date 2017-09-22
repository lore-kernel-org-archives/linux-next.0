From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [DLPAR CPU][Oops] Bad kernel stack pointer
Date: Fri, 22 Sep 2017 15:27:04 +0530
Message-ID: <1506074224.17232.8.camel@abdul.in.ibm.com>
References: <1505729319.6990.5.camel@abdul.in.ibm.com>
         <878th9lhpe.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58488 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751826AbdIVJ5O (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Sep 2017 05:57:14 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8M9ujJB021410
        for <linux-next@vger.kernel.org>; Fri, 22 Sep 2017 05:57:14 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2d4ynpa96g-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 22 Sep 2017 05:57:14 -0400
Received: from localhost
        by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Fri, 22 Sep 2017 03:57:13 -0600
In-Reply-To: <878th9lhpe.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>, Paul Mackerras <paulus@samba.org>

On Wed, 2017-09-20 at 21:42 +1000, Michael Ellerman wrote:
> Abdul Haleem <abdhalee@linux.vnet.ibm.com> writes:
> 
> > Hi,
> >
> > Dynamic CPU remove operation resulted in Kernel Panic on today's
> > next-20170915 kernel.
> >
> > Machine Type: Power 7 PowerVM LPAR
> > Kernel : 4.13.0-next-20170915
> > config : attached
> > test: DLPAR CPU remove
> >
> >
> > dmesg logs:
> > ----------
> > cpu 37 (hwid 37) Ready to die...
> > cpu 38 (hwid 38) Ready to die...
> > cpu 39 (hwid 39)
> > ******* RTAS CReady to die...
> > ALL BUFFER CORRUPTION *******
> 
> Cool. Does that come from RTAS itself? I have never seen that happen
> before.

Not sure, the var logs does not have any messages captured. This is
first time we hit this type of issue.
> 
> Is this easily reproducible?

I am unable to reproduce it again. I will keep an eye on our CI runs for
few more runs.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
