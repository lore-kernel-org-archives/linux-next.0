From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: Re: [PATCH -next] optprobes: fix kconfig depends/selects
Date: Mon, 13 Sep 2010 14:11:45 +0300
Message-ID: <AANLkTimF6GK1hC2e5oSQ7Me9nrBOnS1q7f2rVORC1pUD@mail.gmail.com>
References: <20100812122641.fe88e846.randy.dunlap@oracle.com>
	<AANLkTimu4zHZrpGkLVQkxsqax1DDefjZXwTn2cxy4WsL@mail.gmail.com>
	<4C8D790B.8000807@hitachi.com>
	<4C8DCFAE.4020700@hitachi.com>
	<AANLkTi=rAq7mGYD02bjZQ1j59J3U2ahHS0mqkULv-648@mail.gmail.com>
	<4C8DF975.4040502@hitachi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:40371 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843Ab0IMLLs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2010 07:11:48 -0400
In-Reply-To: <4C8DF975.4040502@hitachi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Ananth N Mavinakayanahalli <ananth@in.ibm.com>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>, akpm <akpm@linux-foundation.org>, 2nddept-manager@sdl.hitachi.co.jp

On Mon, Sep 13, 2010 at 1:14 PM, Masami Hiramatsu
<masami.hiramatsu.pt@hitachi.com> wrote:
> (2010/09/13 18:41), Felipe Contreras wrote:
>> On Mon, Sep 13, 2010 at 10:15 AM, Masami Hiramatsu
>> <masami.hiramatsu.pt@hitachi.com> wrote:
>>> (2010/09/13 10:06), Masami Hiramatsu wrote:
>>>> (2010/09/12 19:49), Felipe Contreras wrote:
>>>>> On Thu, Aug 12, 2010 at 10:26 PM, Randy Dunlap <randy.dunlap@orac=
le.com> wrote:
>>>>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>>>>
>>>>>> KALLSYMS and KALLSYMS_ALL depend on DEBUG_KERNEL, so add that de=
pendency.
>>>>>> KALLSYMS_ALL depends on KALLSYMS, so select both of them, not ju=
st KALLSYMS_ALL.
>>>>>>
>>>>>> warning: (OPTPROBES && KPROBES && HAVE_OPTPROBES && !PREEMPT || =
MTD_UBI_DEBUG && MTD && SYSFS && MTD_UBI || UBIFS_FS_DEBUG && MISC_FILE=
SYSTEMS && UBIFS_FS || LOCKDEP && DEBUG_KERNEL && TRACE_IRQFLAGS_SUPPOR=
T && STACKTRACE_SUPPORT && LOCKDEP_SUPPORT || LATENCYTOP && HAVE_LATENC=
YTOP_SUPPORT) selects KALLSYMS_ALL which has unmet direct dependencies =
(DEBUG_KERNEL && KALLSYMS)
>>>>>>
>>>>>> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>>>>>> Cc: =C2=A0 =C2=A0 Ananth N Mavinakayanahalli <ananth@in.ibm.com>
>>>>>> Cc: =C2=A0 =C2=A0 Anil S Keshavamurthy <anil.s.keshavamurthy@int=
el.com>
>>>>>> Cc: =C2=A0 =C2=A0 "David S. Miller" <davem@davemloft.net>
>>>>>> Cc: =C2=A0 =C2=A0 Masami Hiramatsu <masami.hiramatsu.pt@hitachi.=
com>
>>>>>> ---
>>>>>> =C2=A0arch/Kconfig | =C2=A0 =C2=A02 ++
>>>>>> =C2=A01 file changed, 2 insertions(+)
>>>>>>
>>>>>> --- linux-next-20100810.orig/arch/Kconfig
>>>>>> +++ linux-next-20100810/arch/Kconfig
>>>>>> @@ -45,6 +45,8 @@ config OPTPROBES
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0def_bool y
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on KPROBES && HAVE_OPTPROBES
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !PREEMPT
>>>>>> + =C2=A0 =C2=A0 =C2=A0 depends on DEBUG_KERNEL
>>>>>> + =C2=A0 =C2=A0 =C2=A0 select KALLSYMS
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0select KALLSYMS_ALL
>>>>>>
>>>>>> =C2=A0config HAVE_EFFICIENT_UNALIGNED_ACCESS
>>>>>> --
>>>>>
>>>>> This causes another problem:
>>>>>
>>>>> arch/Kconfig:33:error: recursive dependency detected!
>>>>> arch/Kconfig:33: =C2=A0 =C2=A0 symbol KPROBES depends on KALLSYMS
>>>>> init/Kconfig:825: =C2=A0 =C2=A0symbol KALLSYMS is selected by OPT=
PROBES
>>>>> arch/Kconfig:44: =C2=A0 =C2=A0 symbol OPTPROBES depends on KPROBE=
S
>>>>>
>>>>> The 'select KALLSYMS' is redundant.
>>>>>
>>>>> Otherwise: Signed-off-by: Felipe Contreras <felipe.contreras@gmai=
l.com>
>>>>>
>>>>
>>>> Thanks, let me clear the dependency;
>>>> Kprobes uses kallsyms_lookup for finding target function and check=
ing
>>>> instruction boundary, thus CONFIG_KPROBES should select CONFIG_KAL=
LSYMS
>>>> and CONFIG_KALLSYMS_ALL.
>>>> Optprobe is a optional feature which is supported on x86 arch, and
>>>> it also uses kallsyms_lookup for checking instructions in the targ=
et
>>>> function. Anyway, since optprobe itself is depends on kprobes, it =
doesn't
>>>> need to select both of KALLSYMS/KALLSYMS_ALL.
>>>
>>> Hmm, wait, I might misunderstand something here. I thought
>>> KALLSYMS_ALL added symbols of static functions.
>>> But, does KALLSYMS_ALL just add symbols of variables?
>>> If so, both of KPROBES and OPTPROBES require only KALLSYMS.
>>> It means that they don't need to care about CONFIG_DEBUG_KERNEL.
>>
>> So:
>> - =C2=A0 =C2=A0 =C2=A0 select KALLSYMS_ALL
>> + =C2=A0 =C2=A0 =C2=A0 depends on KALLSYMS_ALL
>>
>> Because KALLSYMS_ALL depends on DEBUG_KERNEL && KALLSYMS.
>
> No, what I meant is;
> - =C2=A0 =C2=A0 =C2=A0 select KALLSYMS_ALL
>
> :-)

Ohh, I didn't notice the _ALL. Makes sense.

--=20
=46elipe Contreras
