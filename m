From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for October 28
Date: Wed, 29 Oct 2008 09:21:56 +0100
Message-ID: <20081029082156.GF17992@elte.hu>
References: <20081028183055.fbcf5420.sfr@canb.auug.org.au> <20081028160045.2a890509.akpm@linux-foundation.org> <20081028162345.72b3180f.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:52582 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751865AbYJ2IWO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Oct 2008 04:22:14 -0400
Content-Disposition: inline
In-Reply-To: <20081028162345.72b3180f.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de


* Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 28 Oct 2008 16:00:45 -0700
> Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > > I have created today's linux-next tree at
> > > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> > 
> > x86_64 allnoconfig:
> > 
> > arch/x86/kernel/genx2apic_uv_x.c: In function 'uv_rtc_init':
> > arch/x86/kernel/genx2apic_uv_x.c:355: error: implicit declaration of function 'uv_bios_freq_base'
> 
> oop, seems that this was caused by the presence of a stale
> include/asm-x86/uv/bios.h.

oh well, i just wasted half an hour trying to reproduce that build bug 
on various trees :-/

but it wasnt a wasted effort: i found a deficiency in my allnoconfig 
testing scripts.

	Ingo
