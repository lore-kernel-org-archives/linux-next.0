From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Aug 2015 14:30:37 -0400
Message-ID: <55CB90CD.4000805@oracle.com>
References: <20150812150954.36bc605c@canb.auug.org.au> <55CB49CA.8050305@oracle.com> <20150812172105.GW16853@twins.programming.kicks-ass.net> <20150812174625.GH18673@twins.programming.kicks-ass.net> <55CB8DAD.6090508@oracle.com> <CALCETrXd+cZCkSyzBm8QAm0wDQP=h8kt1fMp2R5Aj4qY+rUfsA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:33944 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbbHLScL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Aug 2015 14:32:11 -0400
In-Reply-To: <CALCETrXd+cZCkSyzBm8QAm0wDQP=h8kt1fMp2R5Aj4qY+rUfsA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <stefano.stabellini@eu.citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, David Vrabel <david.vrabel@citrix.com>

On 08/12/2015 02:26 PM, Andy Lutomirski wrote:
> On Wed, Aug 12, 2015 at 11:17 AM, Boris Ostrovsky
> <boris.ostrovsky@oracle.com> wrote:
>> On 08/12/2015 01:46 PM, Peter Zijlstra wrote:
>>> On Wed, Aug 12, 2015 at 07:21:05PM +0200, Peter Zijlstra wrote:
>>>> On Wed, Aug 12, 2015 at 09:27:38AM -0400, Boris Ostrovsky wrote:
>>>>
>>>>> Incidentally, 11276d53 ("locking/static_keys: Add a new static_ke=
y
>>>>> interface") breaks old-ish compilers (gcc version 4.4.4 20100503 =
(Red
>>>>> Hat
>>>>> 4.4.4-2) (GCC)):
>>>>>
>>>>>
>>>>>
>>>>>     CC      arch/x86/kernel/nmi.o
>>>>> In file included from
>>>>> /home/build/linux-boris/include/linux/jump_label.h:109,
>>>>>                    from
>>>>> /home/build/linux-boris/arch/x86/include/asm/spinlock.h:5,
>>>>>                    from
>>>>> /home/build/linux-boris/include/linux/spinlock.h:88,
>>>>>                    from /home/build/linux-boris/arch/x86/kernel/n=
mi.c:14:
>>>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h: In fun=
ction
>>>>> =E2=80=98nmi_handle=E2=80=99:
>>>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: war=
ning:
>>>>> asm
>>>>> operand 0 probably doesn=E2=80=99t match constraints
>>>>> /home/build/linux-boris/arch/x86/include/asm/jump_label.h:21: err=
or:
>>>>> impossible constraint in =E2=80=98asm=E2=80=99
>>>>> make[3]: *** [arch/x86/kernel/nmi.o] Error 1
>>>>> make[2]: *** [arch/x86/kernel] Error 2
>>>>> make[1]: *** [arch/x86] Error 2
>>>> Ugh bugger.
>>>>
>>>> I bet its that: &((char *)key)[branch] business, an earlier varian=
t
>>>> thereof tripped up more recent GCCs too.
>>>>
>>>> So its an __always_inline function, and both argument are always c=
ompile
>>>> time constants, @key is the address of an object in static storage=
 (a
>>>> global) and @branch is a simple 0/1 at the call site.
>>>>
>>>> Now we wish to compute (unsigned long)key + branch at compile/link=
 time
>>>> to feed to the assembler as an immediate, which should be possible=
,
>>>> given its all 'constants'.
>>>>
>>>> It just appears GCC is having a hard time with this.
>>>>
>>>> Let me see if I have a sufficiently old GCC around to play with.
>>> Could you feed the below to your compiler? Its a bit cumbersome, bu=
t
>>> its the next best I could come up with...
>>
>> No, it produces the same error. This is Fedora 13, btw, uses gcc 4.4=
=2E4.
> Is the problem just that it's being misdetected as supporting asm
> goto?  What does gcc -E say?

static inline __attribute__((no_instrument_function))=20
__attribute__((always_inline)) bool arch_static_branch(struct static_ke=
y=20
*key, bool branch)
{
  do { asm goto("1:" ".byte " "0x0f,0x1f,0x44,0x00,0" "\n\t"=20
".pushsection __jump_table,  \"aw\" \n\t" " " ".balign 8" " " "\n\t" " =
"=20
".quad" " " "1b, %l[l_yes], %c0 \n\t" ".popsection \n\t" : : "i"=20
(&((char *)key)[branch]) : : l_yes); asm (""); } while (0)

return false;
l_yes:
  return true;
}

-boris
