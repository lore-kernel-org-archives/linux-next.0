From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [DLPAR CPU][Oops] Bad kernel stack pointer
Date: Tue, 19 Sep 2017 19:04:09 +0530
Message-ID: <1505828049.30180.3.camel@abdul.in.ibm.com>
References: <1505729319.6990.5.camel@abdul.in.ibm.com>
         <CAL_Jsq+Hoz-NrgxJ9sw0qr7FO9wNWv8p+Ch9GnrQuQRushciDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33290 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751480AbdISNeg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Sep 2017 09:34:36 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8JDYSI9064642
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2017 09:34:35 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2d3130kxrk-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2017 09:34:31 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <abdhalee@linux.vnet.ibm.com>;
        Tue, 19 Sep 2017 09:34:18 -0400
In-Reply-To: <CAL_Jsq+Hoz-NrgxJ9sw0qr7FO9wNWv8p+Ch9GnrQuQRushciDA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Mon, 2017-09-18 at 07:44 -0500, Rob Herring wrote:
> On Mon, Sep 18, 2017 at 5:08 AM, Abdul Haleem
> <abdhalee@linux.vnet.ibm.com> wrote:
> > Hi,
> >
> > Dynamic CPU remove operation resulted in Kernel Panic on today's
> > next-20170915 kernel.
> >
> > Machine Type: Power 7 PowerVM LPAR
> > Kernel : 4.13.0-next-20170915
> 
> I assume this is not something new to 9/15 -next nor only in -next
> because you also reported that 4.13.0 broke. Can you provide some
> details on what version worked? 4.12?

[linux-next][DLPAR CPU][Oops] Bad kernel stack pointer
[mainline][DLPAR][Oops] OF: ERROR: Bad of_node_put() on /cpus

The above issues are not reproducible with 4.12.0 (mainline), it is
broken with 4.13.0 and next.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre
