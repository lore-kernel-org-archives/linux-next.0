From: "Peter Teoh" <htmldeveloper@gmail.com>
Subject: =?WINDOWS-1252?Q?Re:_[uml-devel]_"warning:_passing_argument_1_of_=91um=5F?= =?WINDOWS-1252?Q?execve=92_discards_qualifiers_from_pointer_target_type"?=
Date: Thu, 30 Oct 2008 23:14:02 +0800
Message-ID: <804dabb00810300814h1867f44bl7933e73fddbbb821@mail.gmail.com>
References: <804dabb00810291851xc617690wac1404176437fb84@mail.gmail.com>
	 <Pine.LNX.4.64.0810300925590.4898@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.152]:34843 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754708AbYJ3POF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 11:14:05 -0400
Received: by fg-out-1718.google.com with SMTP id 19so530065fgg.17
        for <linux-next@vger.kernel.org>; Thu, 30 Oct 2008 08:14:02 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0810300925590.4898@anakin>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, uml-devel <user-mode-linux-devel@lists.sourceforge.net>, linux-next@vger.kernel.org

On Thu, Oct 30, 2008 at 4:31 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, 30 Oct 2008, Peter Teoh wrote:
>> While compiling the latest 2.6.28-rc2 (make linux ARCH=um O=uml):
>>
>>   CC      arch/um/kernel/syscall.o
>> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c: In function
>> 'kernel_execve':
>> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
>> passing argument 1 of 'um_execve' discards qualifiers from pointer
>> target type
>> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
>> passing argument 2 of 'um_execve' discards qualifiers from pointer
>> target type
>> /hdc1/download/2.6/linux26-acer/arch/um/kernel/syscall.c:130: warning:
>> passing argument 3 of 'um_execve' discards qualifiers from pointer
>> target type
>> u  CC      arch/um/kernel/sysrq.o
>>   CC      arch/um/kernel/time.o
>>
>> snip
>>
>>   CC      kernel/trace/trace.o
>> /hdc1/download/2.6/linux26-acer/kernel/trace/trace.c: In function
>> 'tracing_generic_entry_update':
>> /hdc1/download/2.6/linux26-acer/kernel/trace/trace.c:659: error:
>> implicit declaration of function 'irqs_disabled_flags'
>> make[3]: *** [kernel/trace/trace.o] Error 1
>> make[2]: *** [kernel/trace] Error 2
>> make[1]: *** [kernel] Error 2
>> make: *** [sub-make] Error 2
>>
>> The .config as per attached.
>
> I see there are no UML builds yet on
> http://kisskb.ellerman.id.au/kisskb/matrix/.
> Perhaps it would be a good idea to add them?
>

sorry i don't understand how to read the table.   my target is x86
32bit UML, compiler is x86 32bit as well.   and the defconfig i used
is arch/um/defconfig, with some modification.


> Gr{oetje,eeting}s,
>
>                                                Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                            -- Linus Torvalds
>



-- 
Regards,
Peter Teoh
