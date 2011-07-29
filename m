From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for July 28 ("copy_from_user_overflow" undefined)
Date: Fri, 29 Jul 2011 11:02:08 +0200
Message-ID: <CA+icZUVsJNSDzBvvH810POEydpaZxJZfM8J9bD+93+4d+88D_A@mail.gmail.com>
References: <CA+icZUV7R5hqTupiuZZKWcsZ5LOBGmY6xgmMTM7W3ojJo0Sp4w@mail.gmail.com>
	<20110728160136.771e2c0a.rdunlap@xenotime.net>
	<CA+icZUXLpThpEem+DPimemYVHqSKb5NAb5h_L-rMPWsD+WJTYg@mail.gmail.com>
	<20110728220926.6d1a91f4.rdunlap@xenotime.net>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:61868 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755693Ab1G2JCJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 05:02:09 -0400
In-Reply-To: <20110728220926.6d1a91f4.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 29, 2011 at 7:09 AM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On Fri, 29 Jul 2011 03:34:26 +0200 Sedat Dilek wrote:
>
>> On Fri, Jul 29, 2011 at 1:01 AM, Randy Dunlap <rdunlap@xenotime.net>=
 wrote:
>> > On Thu, 28 Jul 2011 16:05:31 +0200 Sedat Dilek wrote:
>> >
>> >> Hi,
>> >>
>> >> just see this build-break on the last mile:
>> >>
>> >> [...]
>> >> =C2=A0 OBJCOPY arch/x86/boot/compressed/vmlinux.bin
>> >> =C2=A0 HOSTCC =C2=A0arch/x86/boot/compressed/relocs
>> >> =C2=A0 HOSTCC =C2=A0arch/x86/boot/compressed/mkpiggy
>> >> /mnt/sdb3/linux-kernel/linux-3.0/debian/build/source_i386_none/ar=
ch/x86/boot/compressed/relocs.c:
>> >> In function 'print_absolute_symbols':
>> >> /mnt/sdb3/linux-kernel/linux-3.0/debian/build/source_i386_none/ar=
ch/x86/boot/compressed/relocs.c:405:14:
>> >> warning: variable 'sh_symtab' set but not used
>> >> [-Wunused-but-set-variable]
>> >> ERROR: "copy_from_user_overflow" [fs/binfmt_misc.ko] undefined!
>> >> make[5]: *** [__modpost] Error 1
>> >> make[4]: *** [modules] Error 2
>> >> make[4]: *** Waiting for unfinished jobs....
>> >> =C2=A0 RELOCS =C2=A0arch/x86/boot/compressed/vmlinux.relocs
>> >> =C2=A0 GZIP =C2=A0 =C2=A0arch/x86/boot/compressed/vmlinux.bin.gz
>> >> =C2=A0 MKPIGGY arch/x86/boot/compressed/piggy.S
>> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/boot/compressed/piggy.o
>> >> =C2=A0 LD =C2=A0 =C2=A0 =C2=A0arch/x86/boot/compressed/vmlinux
>> >> =C2=A0 ZOFFSET arch/x86/boot/zoffset.h
>> >> =C2=A0 OBJCOPY arch/x86/boot/vmlinux.bin
>> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/x86/boot/header.o
>> >> =C2=A0 LD =C2=A0 =C2=A0 =C2=A0arch/x86/boot/setup.elf
>> >> =C2=A0 OBJCOPY arch/x86/boot/setup.bin
>> >> =C2=A0 BUILD =C2=A0 arch/x86/boot/bzImage
>> >> Setup is 15596 bytes (padded to 15872 bytes).
>> >> System is 2471 kB
>> >> CRC eb598167
>> >> Kernel: arch/x86/boot/bzImage is ready =C2=A0(#1)
>> >> make[3]: *** [sub-make] Error 2
>> >> make[2]: *** [all] Error 2
>> >>
>> >> I have these binfmt kernel-config options set:
>> >>
>> >> CONFIG_BINFMT_ELF=3Dy
>> >> # CONFIG_BINFMT_AOUT is not set
>> >> CONFIG_BINFMT_MISC=3Dm
>> >
>> > How does someone turn off this error message?
>> >
>> > I have:
>> > # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
>> > # CONFIG_STRICT_DEVMEM is not set
>> >
>> > and I still cannot get this error to go away (on x86_64).
>> >
>> >
>> > ---
>> > ~Randy
>> > *** Remember to use Documentation/SubmitChecklist when testing you=
r code ***
>> >
>>
>> Can you say with which linux-next version you saw this first?
>> My last version was next-20110722 (which was OK).
>
> It looks like 2011-0727 has lots of these errors in my randconfig bui=
lds,
> but I can't say that they are all incorrect, so it's not very conclus=
ive.
>
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your c=
ode ***
>

I can confirm next-20110726 is fine.

# egrep 'BINFMT|DEBUG_STRICT_USER_COPY_CHECKS|STRICT_DEVMEM'
/boot/config-3.0.0-next20110726.3-686-small
CONFIG_BINFMT_ELF=3Dy
CONFIG_BINFMT_AOUT=3Dm
CONFIG_BINFMT_MISC=3Dm
CONFIG_STRICT_DEVMEM=3Dy
# CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set

So, the binfmt_misc culprit was introduced between next-20110726
(good) and next-20110727 (bad).
I'll try to look into the diff, but can't promise.

- Sedat -
