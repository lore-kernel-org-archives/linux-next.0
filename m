From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: error: implicit declarations of BUG/BUG_ON/WARN_ON/WARN_ON_ONCE
Date: Mon, 18 Jun 2012 09:54:40 -0700
Message-ID: <4FDF5D50.7030505@xenotime.net>
References: <20120615143303.3b88edcbc3efc7b1bf81839b@canb.auug.org.au> <20120615065231.GA12272@localhost> <4FDB6261.2030400@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:59047 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752464Ab2FRQzD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Jun 2012 12:55:03 -0400
In-Reply-To: <4FDB6261.2030400@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Fengguang Wu <fengguang.wu@intel.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 06/15/2012 09:27 AM, Randy Dunlap wrote:

> On 06/14/2012 11:52 PM, Fengguang Wu wrote:
>=20
>> On Fri, Jun 15, 2012 at 02:33:03PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20120614:
>>>
>>> My fixes tree contains:
>>> 	fix bug.h's inclusion of kernel.h
>>
>> I got these errors with the attached randconfig. Not sure which chan=
ge
>> triggers them.
>=20
> Ditto.  When CONFIG_BUG is not enabled.


This problem is still in linux-next of 20120618...


>=20
>>   CC      arch/x86/kernel/asm-offsets.s
>> In file included from /c/kernel-tests/mm/arch/x86/include/asm/atomic=
=2Eh:6:0,
>>                  from /c/kernel-tests/mm/include/linux/atomic.h:4,
>>                  from /c/kernel-tests/mm/include/linux/crypto.h:20,
>>                  from /c/kernel-tests/mm/arch/x86/kernel/asm-offsets=
=2Ec:8:
>> /c/kernel-tests/mm/arch/x86/include/asm/processor.h: In function =91=
get_aperfmperf=92:
>> /c/kernel-tests/mm/arch/x86/include/asm/processor.h:937:2: error: im=
plicit declaration of function =91WARN_ON_ONCE=92 [-Werror=3Dimplicit-f=
unction-declaration]
>> In file included from /c/kernel-tests/mm/include/linux/thread_info.h=
:54:0,
>>                  from /c/kernel-tests/mm/include/linux/preempt.h:9,
>>                  from /c/kernel-tests/mm/include/linux/spinlock.h:50=
,
>>                  from /c/kernel-tests/mm/include/linux/mmzone.h:7,
>>                  from /c/kernel-tests/mm/include/linux/gfp.h:4,
>>                  from /c/kernel-tests/mm/include/linux/slab.h:12,
>>                  from /c/kernel-tests/mm/include/linux/crypto.h:24,
>>                  from /c/kernel-tests/mm/arch/x86/kernel/asm-offsets=
=2Ec:8:
>> /c/kernel-tests/mm/arch/x86/include/asm/thread_info.h: In function =91=
set_restore_sigmask=92:
>> /c/kernel-tests/mm/arch/x86/include/asm/thread_info.h:250:2: error: =
implicit declaration of function =91WARN_ON=92 [-Werror=3Dimplicit-func=
tion-declaration]
>> In file included from /c/kernel-tests/mm/include/linux/mmzone.h:717:=
0,
>>                  from /c/kernel-tests/mm/include/linux/gfp.h:4,
>>                  from /c/kernel-tests/mm/include/linux/slab.h:12,
>>                  from /c/kernel-tests/mm/include/linux/crypto.h:24,
>>                  from /c/kernel-tests/mm/arch/x86/kernel/asm-offsets=
=2Ec:8:
>> /c/kernel-tests/mm/include/linux/memory_hotplug.h: In function =91ge=
neric_alloc_nodedata=92:
>> /c/kernel-tests/mm/include/linux/memory_hotplug.h:152:2: error: impl=
icit declaration of function =91BUG=92 [-Werror=3Dimplicit-function-dec=
laration]                                              =20
>> In file included from /c/kernel-tests/mm/arch/x86/include/asm/apic.h=
:12:0,                                                               =20
>>                  from /c/kernel-tests/mm/arch/x86/include/asm/smp.h:=
13,
>>                  from /c/kernel-tests/mm/include/linux/smp.h:38,
>>                  from /c/kernel-tests/mm/include/linux/topology.h:33=
,
>>                  from /c/kernel-tests/mm/include/linux/gfp.h:7,
>>                  from /c/kernel-tests/mm/include/linux/slab.h:12,
>>                  from /c/kernel-tests/mm/include/linux/crypto.h:24,
>>                  from /c/kernel-tests/mm/arch/x86/kernel/asm-offsets=
=2Ec:8:
>> /c/kernel-tests/mm/arch/x86/include/asm/fixmap.h: In function =91vir=
t_to_fix=92:
>> /c/kernel-tests/mm/arch/x86/include/asm/fixmap.h:220:2: error: impli=
cit declaration of function =91BUG_ON=92 [-Werror=3Dimplicit-function-d=
eclaration]
>>   HOSTLD  scripts/genksyms/genksyms
>> cc1: some warnings being treated as errors
>> make[2]: *** [arch/x86/kernel/asm-offsets.s] Error 1
>> make[1]: *** [prepare0] Error 2
>> make[1]: *** Waiting for unfinished jobs....
>>
>> Thanks,
>> Fengguang
>=20
>=20
>=20



--=20
~Randy
