From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Fri, 12 Sep 2008 10:30:23 +0200
Message-ID: <20080912083023.GA1082@elte.hu>
References: <20080912095618.728658a5.sfr@canb.auug.org.au> <20080912060527.GA22003@amd.com> <20080912173141.5b268bed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:57987 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750901AbYILIaq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 04:30:46 -0400
Content-Disposition: inline
In-Reply-To: <20080912173141.5b268bed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joerg.roedel@amd.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Joerg,
> 
> On Fri, 12 Sep 2008 08:05:27 +0200 Joerg Roedel <joerg.roedel@amd.com> wrote:
> >
> > do you have these commits in next/master already? I tried to find out
> 
> Not until tomorrow some time, sorry.
> 
> > why it fails (the build failure is weird because
> > PCI_DEVICE_ID_AMD_10H_NB_MISC and PCI_DEVICE_ID_AMD_11H_NB_MISC
> > are defined in the same place in tip/master).
> 
> tip/master has more trees merged than the x86 tree (and indeed 
> PCI_DEVICE_ID_AMD_10H_NB_MISC turns up in the timers tree).

hm, but linux-next should have the timers tree merged too. So how come 
you triggered this build error?

	Ingo
