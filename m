From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH V10] RO/NX protection for loadable kernel modules
Date: Mon, 01 Feb 2010 22:06:49 -0800
Message-ID: <4B67C0F9.2020202@zytor.com>
References: <817ecb6f1002011539g3f30416fi60c7c5222cab8f3@mail.gmail.com> <201002021429.38331.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:52830 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753770Ab0BBGMS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2010 01:12:18 -0500
In-Reply-To: <201002021429.38331.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Siarhei Liakh <sliakh.lkml@gmail.com>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>

On 02/01/2010 07:59 PM, Rusty Russell wrote:
> On Tue, 2 Feb 2010 10:09:53 am Siarhei Liakh wrote:
>> This patch is a logical extension of the protection provided by
>> CONFIG_DEBUG_RODATA to LKMs. The protection is provided by splitting
>> module_core and module_init into three logical parts each and setting
>> appropriate page access permissions for each individual section:
>>
>>   1. Code: RO+X
>>   2. RO data: RO+NX
>>   3. RW data: RW+NX
>
> Thanks, applied!

I also applied this to the -tip tree... do you prefer to carry it or 
should I leave it as is?

	-hpa
