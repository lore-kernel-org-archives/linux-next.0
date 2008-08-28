From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for August 27
Date: Thu, 28 Aug 2008 11:08:02 +0200
Message-ID: <20080828090802.GE19422@elte.hu>
References: <20080827183453.eb651f50.sfr@canb.auug.org.au> <200808271206.48370.bzolnier@gmail.com> <58cb370e0808270757k583c0fc2oc659bc8e2dd6c21e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:51109 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751242AbYH1JIW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 05:08:22 -0400
Content-Disposition: inline
In-Reply-To: <58cb370e0808270757k583c0fc2oc659bc8e2dd6c21e@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Bartlomiej Zolnierkiewicz <bzolnier@gmail.com> wrote:

> On Wed, Aug 27, 2008 at 12:06 PM, Bartlomiej Zolnierkiewicz
> <bzolnier@gmail.com> wrote:
> >
> > Hi,
> >
> > On Wednesday 27 August 2008, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since next-20080826:
> >
> > it fails to build here with:
> >
> > arch/x86/kernel/cpu/addon_cpuid_features.c: In function 'detect_extended_topology':
> > arch/x86/kernel/cpu/addon_cpuid_features.c:119: error: 'struct cpuinfo_x86' hasno member named 'cpu_core_id'
> > arch/x86/kernel/cpu/addon_cpuid_features.c:121: error: 'struct cpuinfo_x86' hasno member named 'phys_proc_id'
> > arch/x86/kernel/cpu/addon_cpuid_features.c:130: error: 'struct cpuinfo_x86' hasno member named 'phys_proc_id'
> > arch/x86/kernel/cpu/addon_cpuid_features.c:133: error: 'struct cpuinfo_x86' hasno member named 'cpu_core_id'
> > make[2]: *** [arch/x86/kernel/cpu/addon_cpuid_features.o] Error 1
> > make[1]: *** [arch/x86/kernel/cpu] Error 2
> > make: *** [arch/x86/kernel] Error 2
> 
> which is most likely already fixed in x86 tree by
> 
> http://lkml.org/lkml/2008/8/27/34

ok, i've propagated those commits to auto-x86-next as well, so that 
linux-next is fixed too.

	Ingo
