From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 09:16:12 +0200
Message-ID: <20080612071612.GB28590@elte.hu>
References: <20080611192748.686236fd.sfr@canb.auug.org.au> <20080611095951.GB14033@elte.hu> <18512.32267.636550.47385@cargo.ozlabs.ibm.com> <20080612053335.GA22035@bubble.grove.modra.org> <20080612170505.6049fa75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:60199 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753940AbYFLHRC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 03:17:02 -0400
Content-Disposition: inline
In-Reply-To: <20080612170505.6049fa75.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Modra <amodra@bigpond.net.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > It is, but you need to pass --relax to enable generation of the 
> > trampolines.
> 
> So I tried this (added --relax to LDFLAGS_vmlinux if CONFIG FTRACE was 
> set) and got this;
> 
> /usr/bin/ld: --relax and -r may not be used together
> 
> So, I will disable FTRACE on powerpc for now by removing HAVE_FTRACE 
> from being selected in arch/powerpc/Kconfig.

ugh, please do that hack only privately in your allyesconfig testing and 
do not commit that change to linux-next!

It's not an ftrace bug, this problem is a limitation/bug of the powerpc 
architecture and it appears to me that any kernel feature that brings 
the allyesconfig text size above 32MB on powerpc will trigger this build 
failure.

A few months ago arch/x86 triggered an allyesconfig text size limitation 
at 40MB image size (on 64-bit) and we fixed it instead of disabling the 
feature/driver that happened to bring the image size above 40MB. See 
these commits:

 -------->
 commit 88f3aec7afd9ae3e6f6d221801996b69aad1e3a4
 Author: Ingo Molnar <mingo@elte.hu>
 Date:   Thu Feb 21 11:04:11 2008 +0100

    x86: fix spontaneous reboot with allyesconfig bzImage

 commit 85eb69a16aab5a394ce043c2131319eae35e6493
 Author: Ingo Molnar <mingo@elte.hu>
 Date:   Thu Feb 21 12:50:51 2008 +0100

    x86: increase the kernel text limit to 512 MB
 <--------

	Ingo
