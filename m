From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is
 used
Date: Thu, 3 Mar 2016 09:21:34 +1100
Message-ID: <20160303092134.7c750589@canb.auug.org.au>
References: <20160301122910.74ff0a92@canb.auug.org.au>
	<20160301070750.GA6636@gmail.com>
	<20160301204001.5594bed3@canb.auug.org.au>
	<20160301215451.GC4852@treble.redhat.com>
	<20160302132735.37262b34@canb.auug.org.au>
	<20160302211726.GA23501@treble.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59398 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751594AbcCBWVg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2016 17:21:36 -0500
In-Reply-To: <20160302211726.GA23501@treble.redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>

Hi Josh,

On Wed, 2 Mar 2016 15:17:26 -0600 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Wed, Mar 02, 2016 at 01:27:35PM +1100, Stephen Rothwell wrote:
> > 
> > On Tue, 1 Mar 2016 15:54:51 -0600 Josh Poimboeuf <jpoimboe@redhat.com> wrote:  
> > >
> > > Changing it to use the host compiler would probably be an easy fix, but
> > > that would expose a harder bug related to endianness.  
> > 
> > Just by luck, my PowerPC host is little endian :-)  
> 
> Aha!  In that case, I think I'll take a different approach and try to
> add support for CROSS_COMPILE.
> 
> We'll need it anyway, later on, when we port objtool to more
> architectures.

That would be great.  I was discussing this briefly with the powerpc
maintainer and he expressed some interest.

> Thanks.  I should have the patch(es) soon.  If/when they get merged,
> I'll let you know, and then you can drop this one.

OK, I will keep an eye out - I usually notice when stuff get fixed, but
a heads up is always helpful.

-- 
Cheers,
Stephen Rothwell
