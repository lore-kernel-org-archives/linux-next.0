From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for October 28
Date: Tue, 28 Oct 2008 16:23:45 -0700
Message-ID: <20081028162345.72b3180f.akpm@linux-foundation.org>
References: <20081028183055.fbcf5420.sfr@canb.auug.org.au>
	<20081028160045.2a890509.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:34263 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753455AbYJ1XYn (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 19:24:43 -0400
In-Reply-To: <20081028160045.2a890509.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, tglx@linutronix.de

On Tue, 28 Oct 2008 16:00:45 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> > I have created today's linux-next tree at
> > git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> 
> x86_64 allnoconfig:
> 
> arch/x86/kernel/genx2apic_uv_x.c: In function 'uv_rtc_init':
> arch/x86/kernel/genx2apic_uv_x.c:355: error: implicit declaration of function 'uv_bios_freq_base'

oop, seems that this was caused by the presence of a stale
include/asm-x86/uv/bios.h.
