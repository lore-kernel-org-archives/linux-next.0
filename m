From: "Sachin P. Sant" <sachinp@in.ibm.com>
Subject: Re: [Powerpc] Next March 5 build failure: platform/pseries/msi.o
Date: Thu, 05 Mar 2009 22:23:29 +0530
Message-ID: <49B00389.7050407@in.ibm.com>
References: <20090305195008.f4fd4ce0.sfr@canb.auug.org.au> <49AFB92B.8060606@in.ibm.com> <1236262014.8325.10.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([59.145.155.7]:51504 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751574AbZCEQxf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Mar 2009 11:53:35 -0500
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by e28smtp07.in.ibm.com (8.13.1/8.13.1) with ESMTP id n25GrVZp014029
	for <linux-next@vger.kernel.org>; Thu, 5 Mar 2009 22:23:31 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n25Grco81605784
	for <linux-next@vger.kernel.org>; Thu, 5 Mar 2009 22:23:38 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.13.1/8.13.3) with ESMTP id n25GrUvF032443
	for <linux-next@vger.kernel.org>; Thu, 5 Mar 2009 22:23:31 +0530
In-Reply-To: <1236262014.8325.10.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michael@ellerman.id.au
Cc: linuxppc-dev@ozlabs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

Michael Ellerman wrote:
> Dang it, that's my fault. Thanks for catching it Sachin.
>
> I assumed pseries always enabled EEH, but I see now you can disable it
> if you have EMBEDDED set (which your config does).
>
> It's a bit yucky making the MSI code depend on EEH, but the only other
> option would be to pull half the EEH code out - so I guess that's what
> I'll do.
>
> Does this patch fix it?
Thanks for the patch Michael. It fixes the build break.

Regards
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
