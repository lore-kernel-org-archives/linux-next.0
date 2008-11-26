From: Paul Mackerras <paulus@samba.org>
Subject: Re: linux-next: manual merge of the perfmon3 tree
Date: Wed, 26 Nov 2008 18:06:23 +1100
Message-ID: <18732.62831.286805.400379@cargo.ozlabs.ibm.com>
References: <20081125210319.35b2d189.sfr@canb.auug.org.au>
	<20081125102234.GA4281@elte.hu>
	<7c86c4470811250640v4417fa4fs196f0d0bea136a45@mail.gmail.com>
	<20081125153345.GA20733@elte.hu>
	<7c86c4470811250836k2f798c21pe4766a565a6231ab@mail.gmail.com>
	<20081125165118.GF22504@elte.hu>
	<20081126140032.72d86f17.sfr@canb.auug.org.au>
	<20081126033318.GE8242@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37360 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750921AbYKZHGb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 02:06:31 -0500
In-Reply-To: <20081126033318.GE8242@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, eranian@gmail.com, linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, the arch/x86 maintainers <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>

Ingo Molnar writes:

> We know and knew about the existence of the perfmon patches, but they 
> were always in the vague RFC category and never directly submitted or 
> Cc:-ed to us.

So at least now we have your attention. :)

The best thing now might be for Stephane to do a patch set with the
perfmon3 core + powerpc bits.  I'd be happy to take that through my
tree, and I really want to see perfmon3 get upstream.  X86 can follow
whenever you can get some time to take a look at it.

Paul.
