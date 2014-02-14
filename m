From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] samples/seccomp/Makefile: Do not build tests if
 cross-compiling for MIPS
Date: Thu, 13 Feb 2014 20:33:31 -0500
Message-ID: <CAP=VYLr1D-DQz8U4naa5aEL_AFa_JkO5e+TgFSxpsd_2t3dahQ@mail.gmail.com>
References: <1392312460-24902-1-git-send-email-markos.chandras@imgtec.com> <52FD0F46.6040503@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:60763 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750987AbaBNBeF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2014 20:34:05 -0500
Received: by mail-wi0-f177.google.com with SMTP id e4so9472439wiv.4
        for <linux-next@vger.kernel.org>; Thu, 13 Feb 2014 17:34:01 -0800 (PST)
In-Reply-To: <52FD0F46.6040503@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Daney <ddaney.cavm@gmail.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-kernel@linux-mips.org

On Thu, Feb 13, 2014 at 1:30 PM, David Daney <ddaney.cavm@gmail.com> wrote:
> Really I think we should add a Kconfig item for this and disable the whole
> directory for targets that do not support it.

Can we do something based on  CONFIG_CROSS_COMPILE vs. adding more Kconfig?

Paul.
--

>
> David Daney
>
>
>
> On 02/13/2014 09:27 AM, Markos Chandras wrote:
>>
>> The Makefile is designed to use the host toolchain so it may be
>> unsafe to build the tests if the kernel has been configured and built
>> for another architecture. This fixes a build problem when the kernel has
>> been configured and built for the MIPS architecture but the host is
>> not MIPS (cross-compiled). The MIPS syscalls are only defined
>> if one of the following is true:
>>
>> 1) _MIPS_SIM == _MIPS_SIM_ABI64
>> 2) _MIPS_SIM == _MIPS_SIM_ABI32
>> 3) _MIPS_SIM == _MIPS_SIM_NABI32
>>
>> Of course, none of these make sense on a non-MIPS toolchain and the
>> following build problem occurs when building on a non-MIPS host.
>>
>> linux/usr/include/linux/kexec.h:50:
>> userspace cannot reference function or variable defined in the kernel
>> samples/seccomp/bpf-direct.c: In function 'emulator':
>> samples/seccomp/bpf-direct.c:76:17: error:
>> '__NR_write' undeclared (first use in this function)
>>
>> Cc: linux-next@vger.kernel.org
>> Cc: linux-kernel@linux-mips.org
>> Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>> This problem is only reproducible on the linux-next tree at the moment
>> ---
>>   samples/seccomp/Makefile | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
>> index 7203e66..f6bda1c 100644
>> --- a/samples/seccomp/Makefile
>> +++ b/samples/seccomp/Makefile
>> @@ -17,9 +17,14 @@ HOSTCFLAGS_bpf-direct.o += -I$(objtree)/usr/include
>>   HOSTCFLAGS_bpf-direct.o += -idirafter $(objtree)/include
>>   bpf-direct-objs := bpf-direct.o
>>   +# MIPS system calls are defined based on the -mabi that is passed
>> +# to the toolchain which may or may not be a valid option
>> +# for the host toolchain. So disable tests if target architecture
>> +# is mips but the host isn't.
>> +ifndef CONFIG_MIPS
>>   # Try to match the kernel target.
>> -ifndef CONFIG_64BIT
>>   ifndef CROSS_COMPILE
>> +ifndef CONFIG_64BIT
>>     # s390 has -m31 flag to build 31 bit binaries
>>   ifndef CONFIG_S390
>> @@ -40,3 +45,4 @@ endif
>>     # Tell kbuild to always build the programs
>>   always := $(hostprogs-y)
>> +endif
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
