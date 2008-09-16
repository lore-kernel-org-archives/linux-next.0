From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for September 16 (cpustr.h)
Date: Tue, 16 Sep 2008 11:50:10 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0809161147320.32267@shark.he.net>
References: <20080916173415.14012569.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1606286688-556195962-1221591010=:32267"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756883AbYIPSub@vger.kernel.org>
In-Reply-To: <20080916173415.14012569.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org
List-Id: linux-next.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1606286688-556195962-1221591010=:32267
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: QUOTED-PRINTABLE


I'm seeing lots of gcc warnings from the generated cpustr.h file, like so:

  arch/x86/boot/mkcpustr > arch/x86/boot/cpustr.h
  gcc -Wp,-MD,arch/x86/boot/.cpu.o.d  -nostdinc -isystem /usr/lib/gcc/x86_6=
4-redhat-linux/4.1.1/include -D__KERNEL__ -Iinclude -Iinclude2 -I/home/rdun=
lap/linsrc/linux-next-20080916/include -I/home/rdunlap/linsrc/linux-next-20=
080916/arch/x86/include -include include/linux/autoconf.h -I/home/rdunlap/l=
insrc/linux-next-20080916/arch/x86/boot -Iarch/x86/boot -I/home/rdunlap/lin=
src/linux-next-20080916/include -Iinclude -I/home/rdunlap/linsrc/linux-next=
-20080916/include2 -Iinclude2  -I/home/rdunlap/linsrc/linux-next-20080916/i=
nclude  -I/home/rdunlap/linsrc/linux-next-20080916/arch/x86/include -includ=
e include/linux/autoconf.h -g -Os -D_SETUP -D__KERNEL__ -Wall -Wstrict-prot=
otypes -march=3Di386 -mregparm=3D3 -include /home/rdunlap/linsrc/linux-next=
-20080916/arch/x86/boot/code16gcc.h -fno-strict-aliasing -fomit-frame-point=
er -ffreestanding -fno-unit-at-a-time -fno-stack-protector -mpreferred-stac=
k-boundary=3D2 -m32 -D__BIG_KERNEL__  -D"KBUILD_STR(s)=3D#s" -D"KBUILD_BASE=
NAME=3DKBUILD_STR(cpu)"  -D"KBUILD_MODNAME=3DKBUILD_STR(cpu)" -D"DEBUG_HASH=
=3D3" -D"DEBUG_HASH2=3D23" -c -o arch/x86/boot/cpu.o /home/rdunlap/linsrc/l=
inux-next-20080916/arch/x86/boot/cpu.c
cc1: warning: hex escape sequence out of range


The ending lines of cpustr.h include hex strings like "\x111".
gcc complains about these.  If I change them to "\x011" (e.g.), there
is no warning.

--=20
~Randy
---1606286688-556195962-1221591010=:32267--
