From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Subject: Re: [next-20170217] WARN @/arch/powerpc/include/asm/xics.h:124
 .icp_hv_eoi+0x40/0x140
Date: Tue, 21 Feb 2017 09:18:14 +1100
Message-ID: <1487629094.23576.183.camel@au1.ibm.com>
References: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>
         <87zihhh9mp.fsf@concordia.ellerman.id.au>
         <15420F42-D2C6-4E29-8874-C47F4D61B098@linux.vnet.ibm.com>
         <87mvdhgmhj.fsf@concordia.ellerman.id.au>
         <1487624024.23576.181.camel@au1.ibm.com>
         <alpine.DEB.2.20.1702201402270.4208@nanos>
Reply-To: benh@au1.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41357 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751109AbdBTWTS (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Feb 2017 17:19:18 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1KMJ5eF028461
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 17:19:17 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
        by mx0b-001b2d01.pphosted.com with ESMTP id 28r2w8xw2p-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 17:19:16 -0500
Received: from localhost
        by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <benh@au1.ibm.com>;
        Tue, 21 Feb 2017 08:19:13 +1000
In-Reply-To: <alpine.DEB.2.20.1702201402270.4208@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@ozlabs.org

On Mon, 2017-02-20 at 14:04 -0800, Thomas Gleixner wrote:
> > HOWEVER. Looking at current upstream code I don't understand the error,
> > the DEBUG_SHIRQ code is calling the driver's handler not the flow
> > handler so it shouldn't be called handle_fasteoi_irq or am I missing
> > something ?
> 
> I tried to invoke the normal handler path which also invokes the flow
> handler, but that breaks on x86 as well for different reasons. I zapped
> that commit and still need to find a way to do that debug thing proper. So
> it's appearence in -next was only temporary.

Ok I see. Yes I wouldn't be surprised if we aren't the only ones to
expect that one get_irq() matches *one* invocation of the flow handler.

We had to hack around this for irq_replay already but at least we have
a hook to do that.

You could possibly use replay, but what's wrong with what the code
currently does which is to just call the driver handler directly ?

Cheers,
Ben.
