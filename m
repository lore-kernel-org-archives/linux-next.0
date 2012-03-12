From: Seth Jennings <sjenning@linux.vnet.ibm.com>
Subject: Re: [PATCH] staging: fix powerpc linux-next break on zsmalloc
Date: Mon, 12 Mar 2012 09:34:35 -0500
Message-ID: <4F5E097B.4070605@linux.vnet.ibm.com>
References: <1329144469-8575-1-git-send-email-sjenning@linux.vnet.ibm.com> <4F3A480C.9090407@gmx.de> <4F3A7121.9010803@linux.vnet.ibm.com> <5736714.Unq6oKkpjO@ax5200p>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:55143 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751662Ab2CLOeq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Mar 2012 10:34:46 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <sjenning@linux.vnet.ibm.com>;
	Mon, 12 Mar 2012 10:34:45 -0400
In-Reply-To: <5736714.Unq6oKkpjO@ax5200p>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>, Robert Jennings <rcj@linux.vnet.ibm.com>

Hey Marc,

On 02/14/2012 10:21 AM, Marc Dietrich wrote:
> Hi Seth,
> 
> On Tuesday 14 February 2012 08:35:13 Seth Jennings wrote:
>> On 02/14/2012 05:39 AM, Marc Dietrich wrote:
>>> Am 14.02.2012 12:22, schrieb Marc Dietrich:
>>>> Am 13.02.2012 15:47, schrieb Seth Jennings:
>>>>> linux/vmalloc.h added to zsmalloc-main.c to resolve implicit
>>>>> declaration errors.
>>>>>
>>>>> X86 dependency added to zsmalloc and dependent drivers zcache and
>>>>> zram.
>>>>>
>>>>> This X86 only requirement is not ideal.  Working to find portable
>>>>> functions for __flush_tlb_one and set_pte.
>>>>
>>>> sorry, zcache/zram works fine one ARM here. Why not depend on
>>>> !POWERPC?
>>>
>>> ups, sorry again, I tested an older version only. flush_tlb_one and
>>> set_pte is only used with the new allocator as it seems.
>>
>> It would seem that the cpu-local tlb page flushing function for ARM
>> is local_flush_tlb_kernel_page(), by look at the kmap_atomic() code
>> in arch/arm/mm/highmem.c.
>>
>> So each arch is using a slightly different approach here.
>>
>> A simple #define per-arch could make a it a common call.  I think
>> I'm going to code it up and see how it goes.
> 
> ... and I'm happy to test it ;-)

So I have a branch ready for you to test if your are willing

git://github.com/spartacus06/linux.git -b portable

The branch is based on Greg's staging-next, since my
patches that remove the sparsemem dependency are in there.
The frontswap_v11 patches are in that branch as well.

I did a simple make test with my ARM cross compiler and it
builds cleanly.  Now I just need to know if it _works_.

I'm not sure if you have been experimenting with frontswap
since it's not in mainline yet, but you can enable/disable
it in:

Kernel Features -> Enable frontswap to cache swap pages if tmem is present

Only the frontswap paths use zsmalloc right now. We are looking
to use it for the cleancache paths too soon (I'm working on
that now).

I'd appreciate any feedback you can provide!

Thanks,
Seth
