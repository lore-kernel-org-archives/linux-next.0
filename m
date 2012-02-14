From: Seth Jennings <sjenning@linux.vnet.ibm.com>
Subject: Re: [PATCH] staging: fix powerpc linux-next break on zsmalloc
Date: Tue, 14 Feb 2012 08:35:13 -0600
Message-ID: <4F3A7121.9010803@linux.vnet.ibm.com>
References: <1329144469-8575-1-git-send-email-sjenning@linux.vnet.ibm.com> <4F3A43EC.2030209@gmx.de> <4F3A480C.9090407@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:47453 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756641Ab2BNOgj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2012 09:36:39 -0500
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <sjenning@linux.vnet.ibm.com>;
	Tue, 14 Feb 2012 07:36:37 -0700
In-Reply-To: <4F3A480C.9090407@gmx.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>

On 02/14/2012 05:39 AM, Marc Dietrich wrote:
> Am 14.02.2012 12:22, schrieb Marc Dietrich:
>> Am 13.02.2012 15:47, schrieb Seth Jennings:
>>> linux/vmalloc.h added to zsmalloc-main.c to resolve implicit
>>> declaration errors.
>>>
>>> X86 dependency added to zsmalloc and dependent drivers zcache and zram.
>>>
>>> This X86 only requirement is not ideal.  Working to find portable
>>> functions for __flush_tlb_one and set_pte.
>>
>> sorry, zcache/zram works fine one ARM here. Why not depend on !POWERPC?
> 
> ups, sorry again, I tested an older version only. flush_tlb_one and 
> set_pte is only used with the new allocator as it seems.

It would seem that the cpu-local tlb page flushing function for ARM
is local_flush_tlb_kernel_page(), by look at the kmap_atomic() code
in arch/arm/mm/highmem.c.

So each arch is using a slightly different approach here.

A simple #define per-arch could make a it a common call.  I think
I'm going to code it up and see how it goes.

--
Seth
