From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 14:44:52 -0400
Message-ID: <55CB9424.7030801@oracle.com>
References: <20150812150954.36bc605c@canb.auug.org.au> <55CB49CA.8050305@oracle.com> <20150812172105.GW16853@twins.programming.kicks-ass.net> <20150812174625.GH18673@twins.programming.kicks-ass.net> <55CB8DAD.6090508@oracle.com> <BB71B9C8-8FA6-4BED-8C80-BCBF08A66812@zytor.com> <20150812183614.GY16853@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:42945 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256AbbHLSqY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 14:46:24 -0400
In-Reply-To: <20150812183614.GY16853@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>

On 08/12/2015 02:36 PM, Peter Zijlstra wrote:
> On Wed, Aug 12, 2015 at 11:26:41AM -0700, H. Peter Anvin wrote:
>> One option might be to do the addition in assembly, i.e.:
>>
>> "i" (key), "i" (index)
>>
>> ... and put the addition into the assembly source.
> Like so? Seems to build on gcc-4.6.

Yes, this builds on 4.4.4. as well.

-boris

>
> ---
>   arch/x86/include/asm/jump_label.h | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm/jump_label.h
> index 28d7a857f9d1..5daeca3d0f9e 100644
> --- a/arch/x86/include/asm/jump_label.h
> +++ b/arch/x86/include/asm/jump_label.h
> @@ -22,9 +22,9 @@ static __always_inline bool arch_static_branch(struct static_key *key, bool bran
>   		".byte " __stringify(STATIC_KEY_INIT_NOP) "\n\t"
>   		".pushsection __jump_table,  \"aw\" \n\t"
>   		_ASM_ALIGN "\n\t"
> -		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +		_ASM_PTR "1b, %l[l_yes], %c0 + %c1 \n\t"
>   		".popsection \n\t"
> -		: :  "i" (&((char *)key)[branch]) : : l_yes);
> +		: :  "i" (key), "i" (branch) : : l_yes);
>   
>   	return false;
>   l_yes:
> @@ -38,9 +38,9 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
>   		"2:\n\t"
>   		".pushsection __jump_table,  \"aw\" \n\t"
>   		_ASM_ALIGN "\n\t"
> -		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +		_ASM_PTR "1b, %l[l_yes], %c0 + %c1 \n\t"
>   		".popsection \n\t"
> -		: :  "i" (&((char *)key)[branch]) : : l_yes);
> +		: :  "i" (key), "i" (branch) : : l_yes);
>   
>   	return false;
>   l_yes:
