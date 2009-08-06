From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next July 29 : Hugetlb test failure (OOPS free_hugepte_range)
Date: Thu, 06 Aug 2009 10:10:46 +0530
Message-ID: <4A7A5ECE.10803@in.ibm.com>
References: <20090729173611.b82478cd.sfr@canb.auug.org.au> <4A706504.6040704@in.ibm.com>  <4A719129.5030302@in.ibm.com> <1248957028.1509.85.camel@pasglop>  <4A796237.6070302@in.ibm.com> <1249530754.18245.71.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp06.au.ibm.com ([202.81.31.148]:36570 "EHLO
	e23smtp06.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706AbZHFEkv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2009 00:40:51 -0400
Received: from d23relay01.au.ibm.com (d23relay01.au.ibm.com [202.81.31.243])
	by e23smtp06.au.ibm.com (8.14.3/8.13.1) with ESMTP id n764ejrW031012
	for <linux-next@vger.kernel.org>; Thu, 6 Aug 2009 14:40:45 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
	by d23relay01.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id n764en8b565440
	for <linux-next@vger.kernel.org>; Thu, 6 Aug 2009 14:40:50 +1000
Received: from d23av03.au.ibm.com (loopback [127.0.0.1])
	by d23av03.au.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n764enQL016572
	for <linux-next@vger.kernel.org>; Thu, 6 Aug 2009 14:40:49 +1000
In-Reply-To: <1249530754.18245.71.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Benjamin Herrenschmidt wrote:
> Does this patch fixes it ?
>
> [PATCH] powerpc/mm: Fix encoding of page table cache numbers
>
> The mask used to encode the page table cache number in the
> batch when freeing page tables was too small for the new
> possible values of MMU page sizes. This increases it along
> with a comment explaining the constraints.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   
Yes this patch fixed the issue for me. Thanks Ben.

Tested-by: Sachin Sant <sachinp@in.ibm.com>

Regards
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
