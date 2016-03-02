From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is
 used
Date: Wed, 2 Mar 2016 15:17:26 -0600
Message-ID: <20160302211726.GA23501@treble.redhat.com>
References: <20160301122910.74ff0a92@canb.auug.org.au>
 <20160301070750.GA6636@gmail.com>
 <20160301204001.5594bed3@canb.auug.org.au>
 <20160301215451.GC4852@treble.redhat.com>
 <20160302132735.37262b34@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54872 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750917AbcCBVR3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Mar 2016 16:17:29 -0500
Content-Disposition: inline
In-Reply-To: <20160302132735.37262b34@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 02, 2016 at 01:27:35PM +1100, Stephen Rothwell wrote:
> Hi Josh,
> 
> On Tue, 1 Mar 2016 15:54:51 -0600 Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > Changing it to use the host compiler would probably be an easy fix, but
> > that would expose a harder bug related to endianness.
> 
> Just by luck, my PowerPC host is little endian :-)

Aha!  In that case, I think I'll take a different approach and try to
add support for CROSS_COMPILE.

We'll need it anyway, later on, when we port objtool to more
architectures.

> > How about the below workaround patch to disable objtool and warn when
> > CROSS_COMPILE is used?  If anybody complains about lack of cross-compile
> > support later, we could try to fix it then.
> 
> This seems reasonable.
> 
> > From a3c65947011a420743f308b698171c4209105d3f Mon Sep 17 00:00:00 2001
> > Message-Id: <a3c65947011a420743f308b698171c4209105d3f.1456868910.git.jpoimboe@redhat.com>
> > From: Josh Poimboeuf <jpoimboe@redhat.com>
> > Date: Tue, 1 Mar 2016 13:35:51 -0600
> > Subject: [PATCH] objtool: Disable stack validation when CROSS_COMPILE is used
> 
> I have applied this to the merge of the tip tree in linux-next today
> and it compiles fine for me.  I will continue applying it until
> something better comes along or it is applied to the tip tree.

Thanks.  I should have the patch(es) soon.  If/when they get merged,
I'll let you know, and then you can drop this one.

-- 
Josh
