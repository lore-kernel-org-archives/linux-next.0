From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Subject: Re: [next-20170217] WARN @/arch/powerpc/include/asm/xics.h:124
 .icp_hv_eoi+0x40/0x140
Date: Tue, 21 Feb 2017 07:53:44 +1100
Message-ID: <1487624024.23576.181.camel@au1.ibm.com>
References: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>
         <87zihhh9mp.fsf@concordia.ellerman.id.au>
         <15420F42-D2C6-4E29-8874-C47F4D61B098@linux.vnet.ibm.com>
         <87mvdhgmhj.fsf@concordia.ellerman.id.au>
Reply-To: benh@au1.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55620 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750858AbdBTUys (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Feb 2017 15:54:48 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v1KKraST122853
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 15:54:47 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
        by mx0a-001b2d01.pphosted.com with ESMTP id 28r3pqjb71-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 20 Feb 2017 15:54:47 -0500
Received: from localhost
        by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <benh@au1.ibm.com>;
        Tue, 21 Feb 2017 06:54:45 +1000
In-Reply-To: <87mvdhgmhj.fsf@concordia.ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Sachin Sant <sachinp@linux.vnet.ibm.com>, tglx@linutronix.de
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 2017-02-20 at 21:55 +1100, Michael Ellerman wrote:
> But when we're called for CONFIG_DEBUG_SHIRQ get_irq() is not called,
> precisely because we're faking an interrupt.
> 
> I'm not sure if there's a good way to fix it :/

In the irq_replay path we have code to adjust the CPPR stack. We could
do something similar.

HOWEVER. Looking at current upstream code I don't understand the error,
the DEBUG_SHIRQ code is calling the driver's handler not the flow
handler so it shouldn't be called handle_fasteoi_irq or am I missing
something ?

Cheers,
Ben.
