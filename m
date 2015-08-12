From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 14:17:17 -0400
Message-ID: <55CB8DAD.6090508@oracle.com>
References: <20150812150954.36bc605c@canb.auug.org.au> <55CB49CA.8050305@oracle.com> <20150812172105.GW16853@twins.programming.kicks-ass.net> <20150812174625.GH18673@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:25803 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbbHLSTD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 14:19:03 -0400
In-Reply-To: <20150812174625.GH18673@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>

On 08/12/2015 01:46 PM, Peter Zijlstra wrote:
> On Wed, Aug 12, 2015 at 07:21:05PM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 12, 2015 at 09:27:38AM -0400, Boris Ostrovsky wrote:
>>
>>> Incidentally, 11276d53 ("locking/static_keys: Add a new static_key
>>> interface") breaks old-ish compilers (gcc version 4.4.4 20100503 (R=
ed Hat
>>> 4.4.4-2) (GCC)):
>>>
>>>
>>>
>>>    CC      arch/x86/kernel/nmi.o
>>> In file included from
>>> /home/build/linux-boris/include/linux/jump_label.h:109,
>>>                   from
>>> /home/build/linux-boris/arch/x86/include/asm/spinlock.h:5,
>>>                   from /home/build/linux-boris/include/linux/spinlo=
ck.h:88,
>>>                   from /home/build/linux-boris/arch/x86/kernel/nmi.=
c:14:
>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h: In funct=
ion
>>> =E2=80=98nmi_handle=E2=80=99:
>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: warni=
ng: asm
>>> operand 0 probably doesn=E2=80=99t match constraints
>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: error=
:
>>> impossible constraint in =E2=80=98asm=E2=80=99
>>> make[3]: *** [arch/x86/kernel/nmi.o] Error 1
>>> make[2]: *** [arch/x86/kernel] Error 2
>>> make[1]: *** [arch/x86] Error 2
>> Ugh bugger.
>>
>> I bet its that: &((char *)key)[branch] business, an earlier variant
>> thereof tripped up more recent GCCs too.
>>
>> So its an __always_inline function, and both argument are always com=
pile
>> time constants, @key is the address of an object in static storage (=
a
>> global) and @branch is a simple 0/1 at the call site.
>>
>> Now we wish to compute (unsigned long)key + branch at compile/link t=
ime
>> to feed to the assembler as an immediate, which should be possible,
>> given its all 'constants'.
>>
>> It just appears GCC is having a hard time with this.
>>
>> Let me see if I have a sufficiently old GCC around to play with.
> Could you feed the below to your compiler? Its a bit cumbersome, but
> its the next best I could come up with...

No, it produces the same error. This is Fedora 13, btw, uses gcc 4.4.4.

-boris


>
> ---
>   arch/x86/include/asm/jump_label.h | 56 ++++++++++++++++++++++++++++=
-----------
>   1 file changed, 41 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/include/asm/jump_label.h b/arch/x86/include/asm=
/jump_label.h
> index 28d7a857f9d1..76c769ae4200 100644
> --- a/arch/x86/include/asm/jump_label.h
> +++ b/arch/x86/include/asm/jump_label.h
> @@ -16,15 +16,30 @@
>   # define STATIC_KEY_INIT_NOP GENERIC_NOP5_ATOMIC
>   #endif
>  =20
> +struct foo {
> +	u8 zero;
> +	u8 one;
> +};
> +
>   static __always_inline bool arch_static_branch(struct static_key *k=
ey, bool branch)
>   {
> -	asm_volatile_goto("1:"
> -		".byte " __stringify(STATIC_KEY_INIT_NOP) "\n\t"
> -		".pushsection __jump_table,  \"aw\" \n\t"
> -		_ASM_ALIGN "\n\t"
> -		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> -		".popsection \n\t"
> -		: :  "i" (&((char *)key)[branch]) : : l_yes);
> +	if (!branch) {
> +		asm_volatile_goto("1:"
> +				".byte " __stringify(STATIC_KEY_INIT_NOP) "\n\t"
> +				".pushsection __jump_table,  \"aw\" \n\t"
> +				_ASM_ALIGN "\n\t"
> +				_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +				".popsection \n\t"
> +				: :  "i" (&((struct foo *)key)->zero) : : l_yes);
> +	} else {
> +		asm_volatile_goto("1:"
> +				".byte " __stringify(STATIC_KEY_INIT_NOP) "\n\t"
> +				".pushsection __jump_table,  \"aw\" \n\t"
> +				_ASM_ALIGN "\n\t"
> +				_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +				".popsection \n\t"
> +				: :  "i" (&((struct foo *)key)->one) : : l_yes);
> +	}
>  =20
>   	return false;
>   l_yes:
> @@ -33,14 +48,25 @@ static __always_inline bool arch_static_branch(st=
ruct static_key *key, bool bran
>  =20
>   static __always_inline bool arch_static_branch_jump(struct static_k=
ey *key, bool branch)
>   {
> -	asm_volatile_goto("1:"
> -		".byte 0xe9\n\t .long %l[l_yes] - 2f\n\t"
> -		"2:\n\t"
> -		".pushsection __jump_table,  \"aw\" \n\t"
> -		_ASM_ALIGN "\n\t"
> -		_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> -		".popsection \n\t"
> -		: :  "i" (&((char *)key)[branch]) : : l_yes);
> +	if (!branch) {
> +		asm_volatile_goto("1:"
> +				".byte 0xe9\n\t .long %l[l_yes] - 2f\n\t"
> +				"2:\n\t"
> +				".pushsection __jump_table,  \"aw\" \n\t"
> +				_ASM_ALIGN "\n\t"
> +				_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +				".popsection \n\t"
> +				: :  "i" (&((struct foo *)key)->zero) : : l_yes);
> +	} else {
> +		asm_volatile_goto("1:"
> +				".byte 0xe9\n\t .long %l[l_yes] - 2f\n\t"
> +				"2:\n\t"
> +				".pushsection __jump_table,  \"aw\" \n\t"
> +				_ASM_ALIGN "\n\t"
> +				_ASM_PTR "1b, %l[l_yes], %c0 \n\t"
> +				".popsection \n\t"
> +				: :  "i" (&((struct foo *)key)->one) : : l_yes);
> +	}
>  =20
>   	return false;
>   l_yes:
