From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 28 ("copy_from_user_overflow"
 undefined)
Date: Thu, 28 Jul 2011 22:09:26 -0700
Message-ID: <20110728220926.6d1a91f4.rdunlap@xenotime.net>
References: <CA+icZUV7R5hqTupiuZZKWcsZ5LOBGmY6xgmMTM7W3ojJo0Sp4w@mail.gmail.com>
	<20110728160136.771e2c0a.rdunlap@xenotime.net>
	<CA+icZUXLpThpEem+DPimemYVHqSKb5NAb5h_L-rMPWsD+WJTYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:45525 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752361Ab1G2FJ3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 01:09:29 -0400
In-Reply-To: <CA+icZUXLpThpEem+DPimemYVHqSKb5NAb5h_L-rMPWsD+WJTYg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 29 Jul 2011 03:34:26 +0200 Sedat Dilek wrote:

> On Fri, Jul 29, 2011 at 1:01 AM, Randy Dunlap <rdunlap@xenotime.net> =
wrote:
> > On Thu, 28 Jul 2011 16:05:31 +0200 Sedat Dilek wrote:
> >
> >> Hi,
> >>
> >> just see this build-break on the last mile:
> >>
> >> [...]
> >> =A0 OBJCOPY arch/x86/boot/compressed/vmlinux.bin
> >> =A0 HOSTCC =A0arch/x86/boot/compressed/relocs
> >> =A0 HOSTCC =A0arch/x86/boot/compressed/mkpiggy
> >> /mnt/sdb3/linux-kernel/linux-3.0/debian/build/source_i386_none/arc=
h/x86/boot/compressed/relocs.c:
> >> In function 'print_absolute_symbols':
> >> /mnt/sdb3/linux-kernel/linux-3.0/debian/build/source_i386_none/arc=
h/x86/boot/compressed/relocs.c:405:14:
> >> warning: variable 'sh_symtab' set but not used
> >> [-Wunused-but-set-variable]
> >> ERROR: "copy_from_user_overflow" [fs/binfmt_misc.ko] undefined!
> >> make[5]: *** [__modpost] Error 1
> >> make[4]: *** [modules] Error 2
> >> make[4]: *** Waiting for unfinished jobs....
> >> =A0 RELOCS =A0arch/x86/boot/compressed/vmlinux.relocs
> >> =A0 GZIP =A0 =A0arch/x86/boot/compressed/vmlinux.bin.gz
> >> =A0 MKPIGGY arch/x86/boot/compressed/piggy.S
> >> =A0 AS =A0 =A0 =A0arch/x86/boot/compressed/piggy.o
> >> =A0 LD =A0 =A0 =A0arch/x86/boot/compressed/vmlinux
> >> =A0 ZOFFSET arch/x86/boot/zoffset.h
> >> =A0 OBJCOPY arch/x86/boot/vmlinux.bin
> >> =A0 AS =A0 =A0 =A0arch/x86/boot/header.o
> >> =A0 LD =A0 =A0 =A0arch/x86/boot/setup.elf
> >> =A0 OBJCOPY arch/x86/boot/setup.bin
> >> =A0 BUILD =A0 arch/x86/boot/bzImage
> >> Setup is 15596 bytes (padded to 15872 bytes).
> >> System is 2471 kB
> >> CRC eb598167
> >> Kernel: arch/x86/boot/bzImage is ready =A0(#1)
> >> make[3]: *** [sub-make] Error 2
> >> make[2]: *** [all] Error 2
> >>
> >> I have these binfmt kernel-config options set:
> >>
> >> CONFIG_BINFMT_ELF=3Dy
> >> # CONFIG_BINFMT_AOUT is not set
> >> CONFIG_BINFMT_MISC=3Dm
> >
> > How does someone turn off this error message?
> >
> > I have:
> > # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> > # CONFIG_STRICT_DEVMEM is not set
> >
> > and I still cannot get this error to go away (on x86_64).
> >
> >
> > ---
> > ~Randy
> > *** Remember to use Documentation/SubmitChecklist when testing your=
 code ***
> >
>=20
> Can you say with which linux-next version you saw this first?
> My last version was next-20110722 (which was OK).

It looks like 2011-0727 has lots of these errors in my randconfig build=
s,
but I can't say that they are all incorrect, so it's not very conclusiv=
e.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
