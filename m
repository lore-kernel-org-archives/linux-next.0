From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next 12 : arch/powerpc/sysdev/axonram build failure
Date: Thu, 12 Mar 2009 18:31:23 +0530
Message-ID: <49B907A3.1030506@in.ibm.com>
References: <20090312171154.11c6ec31.sfr@canb.auug.org.au> <49B8C7FA.8090805@in.ibm.com> <1236860187.12893.5.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:48660 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752114AbZCLNBb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2009 09:01:31 -0400
Received: from d23relay02.au.ibm.com (d23relay02.au.ibm.com [202.81.31.244])
	by e23smtp02.au.ibm.com (8.13.1/8.13.1) with ESMTP id n2CD0ADH010562
	for <linux-next@vger.kernel.org>; Fri, 13 Mar 2009 00:00:10 +1100
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay02.au.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n2CD1jYN790644
	for <linux-next@vger.kernel.org>; Fri, 13 Mar 2009 00:01:45 +1100
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n2CD1Rk3016371
	for <linux-next@vger.kernel.org>; Fri, 13 Mar 2009 00:01:27 +1100
In-Reply-To: <1236860187.12893.5.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: michael@ellerman.id.au
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org

Michael Ellerman wrote:
> So how about this:
>
> >From 7325aea8244ac83d98cde7a509ec8ab5994cdb0e Mon Sep 17 00:00:00 2001
> From: Michael Ellerman <michael@ellerman.id.au>
> Date: Thu, 12 Mar 2009 23:14:58 +1100
> Subject: [PATCH] powerpc/cell: axonram depends on BLOCK
>
> Signed-off-by: Michael Ellerman <michael@ellerman.id.au>
> ---
>  
Yup that works. Thanks.

Regards
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
