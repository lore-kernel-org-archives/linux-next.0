From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: linux-next: Tree for July 27 (xen)
Date: Wed, 28 Jul 2010 07:48:37 -0700
Message-ID: <4C504345.2050204@goop.org>
References: <20100727160708.722c39c1.sfr@canb.auug.org.au> <4C4F27A3.5040109@oracle.com> <alpine.DEB.2.00.1007281410030.19809@kaball-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from claw.goop.org ([74.207.240.146]:48135 "EHLO claw.goop.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755076Ab0G1Osi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Jul 2010 10:48:38 -0400
In-Reply-To: <alpine.DEB.2.00.1007281410030.19809@kaball-desktop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <Jeremy.Fitzhardinge@citrix.com>

  On 07/28/2010 06:11 AM, Stefano Stabellini wrote:
> On Tue, 27 Jul 2010, Randy Dunlap wrote:
>> Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20100726:
>>>
>>>
>>> The xen tree lost its build problems but gained a conflict against Linus'
>>> tree.
>> when X86_32=y, SMP=n, X86_LOCAL_APIC=n:
>>
>> drivers/built-in.o: In function `xen_callback_vector':
>> (.text+0x41238): undefined reference to `first_system_vector'
>>
>> alloc_intr_gate() calls alloc_system_vector(), which uses first_system_vector.
> this patch should solve the issue:

So this is a generic x86 build problem?

     J

> ---
>
> alloc_system_vector: access first_system_vector when X86_LOCAL_APIC=y
>
> Currently alloc_system_vector reads and writes first_system_vector
> unconditionally while first_system_vector is only defined when
> CONFIG_X86_LOCAL_APIC=y.
> This patch makes sure first_system_vector is accessed only in that case.
>
> Signed-off-by: Stefano Stabellini<stefano.stabellini@eu.citrix.com>
>
> diff --git a/arch/x86/include/asm/desc.h b/arch/x86/include/asm/desc.h
> index 617bd56..f83e055 100644
> --- a/arch/x86/include/asm/desc.h
> +++ b/arch/x86/include/asm/desc.h
> @@ -341,8 +341,10 @@ static inline void alloc_system_vector(int vector)
>   {
>   	if (!test_bit(vector, used_vectors)) {
>   		set_bit(vector, used_vectors);
> +#if defined(CONFIG_X86_LOCAL_APIC)
>   		if (first_system_vector>  vector)
>   			first_system_vector = vector;
> +#endif
>   	} else
>   		BUG();
>   }
>
