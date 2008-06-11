From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: powerpc build failure
Date: Wed, 11 Jun 2008 11:59:51 +0200
Message-ID: <20080611095951.GB14033@elte.hu>
References: <20080611192748.686236fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51842 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751045AbYFKKAR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 06:00:17 -0400
Content-Disposition: inline
In-Reply-To: <20080611192748.686236fd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> vmlinux.o: In function `ipx_ioctl':
> /scratch/sfr/next/net/ipx/af_ipx.c:1830: relocation truncated to fit: R_PPC64_REL24 against symbol `._mcount' defined in .text section in vmlinux.o
> 
> (and lots more similar)
> 
> I am assuming that this has something to do with how big vmlinux is 
> for allyesconfig and the addition of -pg to KBUILD_CFLAGS for ftrace.

could this be a tool chain limitation perhaps, or a gcc bug? Or does the 
allyesconfig size go beyond some fundamental hardware limitation. (i 
doubt it's the latter)

	Ingo
