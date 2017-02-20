From: Balbir Singh <bsingharora@gmail.com>
Subject: Re: [next-20170217] WARN @/arch/powerpc/include/asm/xics.h:124
 .icp_hv_eoi+0x40/0x140
Date: Mon, 20 Feb 2017 14:44:21 +1100
Message-ID: <1487562261.10535.8.camel@gmail.com>
References: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:34452 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751897AbdBTDoi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Feb 2017 22:44:38 -0500
Received: by mail-pg0-f51.google.com with SMTP id z67so34539435pgb.1
        for <linux-next@vger.kernel.org>; Sun, 19 Feb 2017 19:44:27 -0800 (PST)
In-Reply-To: <E96217CD-2ADD-430D-86BD-27FF87752D7F@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next@vger.kernel.org
Cc: linuxppc-dev@ozlabs.org

On Sun, 2017-02-19 at 20:39 +0530, Sachin Sant wrote:
> While booting next-20170217 on a POWER6 box, I ran into following
> warning. This is a full system lpar. Previous next tree was good.
> I will try a bisect tomorrow.
> 
> ipr: IBM Power RAID SCSI Device Driver version: 2.6.3 (October 17, 2015)
> ipr 0200:00:01.0: Found IOA with IRQ: 305
> ------------[ cut here ]------------
> WARNING: CPU: 12 PID: 1 at ./arch/powerpc/include/asm/xics.h:124 .icp_hv_eoi+0x40/0x140


This indicates that the CPPR stack underflow'd (we don't know the CPPR value
at the time of the interrupt that we are going to do an EOI for).  The problem
could have occured elsewhere, but shows up at the first interrupt after
the real cause. Could you past the full dmesg and config and follow Michael's
suggestion for debugging SHIRQ's

Balbir
