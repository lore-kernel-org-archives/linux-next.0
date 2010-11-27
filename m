From: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Subject: Re: linux-next: Tree for November 26
Date: Sat, 27 Nov 2010 22:54:08 +0100
Message-ID: <AANLkTim1=OijO4f0rk4W=2h1CW_xX27tSbDj8s9af7Xw@mail.gmail.com>
References: <20101126132823.7ef94f07.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:50705 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752749Ab0K0VyJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 27 Nov 2010 16:54:09 -0500
In-Reply-To: <20101126132823.7ef94f07.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Salve!

2010/11/26 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> Changes since 20101125:
>

just a reminder - these errors still occur:

WARNING: modpost: Found 10 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=3Dy'
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp_vmlinux1
arch/x86/built-in.o: In function `kvm_smp_prepare_boot_cpu':
kvm.c:(.init.text+0xe543): undefined reference to `kvm_register_clock'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [sub-make] Error 2

make[4]: *** No rule to make target
`drivers/scsi/aic7xxx/aicasm/*.[chyl]', needed by
`drivers/scsi/aic7xxx/aicasm/aicasm'.  Stop.
make[3]: *** [drivers/scsi/aic7xxx] Error 2
make[2]: *** [drivers/scsi] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2


  CC      sound/oss/aedsp16.o
make[3]: *** No rule to make target `/etc/sound/dsp001.ld', needed by
`sound/oss/pss_boot.h'.  Stop.
make[2]: *** [sound/oss] Error 2
make[1]: *** [sound] Error 2
make: *** [sub-make] Error 2

  CC [M]  drivers/block/cciss.o
/home/test/linux-2.6/drivers/block/cciss.c: In function 'cciss_cleanup'=
:
/home/test/linux-2.6/drivers/block/cciss.c:4929:6: error: 'proc_cciss'
undeclared (first use in this function)
/home/test/linux-2.6/drivers/block/cciss.c:4929:6: note: each
undeclared identifier is reported only once for each function it
appears in
make[3]: *** [drivers/block/cciss.o] Error 1
make[2]: *** [drivers/block] Error 2
make[1]: *** [drivers] Error 2
make: *** [sub-make] Error 2




--=20
Slawa!
Zimny "=AFyj i pozw=F3l umrze=E6" Lech z Wawelu

That is not dead which can eternal lie.
And with strange aeons even death may die.
