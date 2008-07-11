From: vibi sreenivasan <vibi_sreenivasan@cms.com>
Subject: Warnings while compiling for i386
Date: Fri, 11 Jul 2008 15:38:56 +0530
Message-ID: <1215770936.2995.27.camel@localhost.localdomain>
Reply-To: vibi_sreenivasan@cms.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailgw3.cms.com ([202.75.200.223]:53844 "EHLO ms4l.cms.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751954AbYGKKKq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 06:10:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>

hello ,
	I am getting alot of warnings while compiling for i386 architecture.
	i am using default configuration for i386 & my compiler version is
4.1.1
=09
	following are warnings

arch/x86/kernel/smpboot.c: In function =E2=80=98do_boot_cpu=E2=80=99:
arch/x86/kernel/smpboot.c:943: warning: label =E2=80=98restore_state=E2=
=80=99 defined
but not used
*
*
arch/x86/mm/pgtable.c: In function =E2=80=98pgd_mop_up_pmds=E2=80=99:
arch/x86/mm/pgtable.c:194: warning: unused variable =E2=80=98pmd=E2=80=99
CC      arch/x86/mm/pgtable_32.o
arch/x86/mm/pgtable_32.c:144: warning: =E2=80=98fixmaps=E2=80=99 define=
d but not used
*
*
kernel/sched.c:7743: warning: initialization from incompatible pointer
type
kernel/sched.c:7743: warning: initialization from incompatible pointer
type
*
*
sound/core/pcm_native.c: In function =E2=80=98snd_pcm_fasync=E2=80=99:
sound/core/pcm_native.c:3262: warning: label =E2=80=98out=E2=80=99 defi=
ned but not used
*
*
WARNING: modpost: Found 6 section mismatch(es).
*
*
RELOCS  arch/x86/boot/compressed/vmlinux.relocs
WARNING: Absolute relocations present
Offset     Info     Type     Sym.Value Sym.Name
c103405d 00807601   R_386_32 c1357371  __start_notes
c13627a8 0098e101   R_386_32 c14a5efc  __start___kcrctab
c13627bc 00984101   R_386_32 c14a5efc  __start___kcrctab_gpl
c13627c8 00797001   R_386_32 c14a5efc  __start___ksymtab_gpl_future
c13627cc 0082ba01   R_386_32 c14a5efc  __stop___ksymtab_gpl_future
c13627d0 00802801   R_386_32 c14a5efc  __start___kcrctab_gpl_future
c153c1fe 008e7401   R_386_32 c1357371  __stop_notes
c153c204 00807601   R_386_32 c1357371  __start_notes

Thanks & Regards
vibi sreenivasan
