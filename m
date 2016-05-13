From: Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH] x86/rwsem: Save and restore all callee-clobbered regs in
 32-bit ____down_write()
Date: Fri, 13 May 2016 19:19:15 +0200
Message-ID: <20160513171915.GG17996@pd.tnic>
References: <57348665.3050301@roeck-us.net>
 <20160512135131.GA7803@pd.tnic>
 <20160512144657.GA14245@pd.tnic>
 <20160512172938.GB14245@pd.tnic>
 <CA+55aFwEruUyTVrR28SL4DQAY3zVEdXw9iKKf6L_S1Z_kHfxow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50065 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751312AbcEMRTd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 13 May 2016 13:19:33 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFwEruUyTVrR28SL4DQAY3zVEdXw9iKKf6L_S1Z_kHfxow@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 13, 2016 at 10:03:26AM -0700, Linus Torvalds wrote:
> I think your fix is wrong. Your fix adds the pointless push/pop that
> doesn't help any, since you might as well just force the temporary
> back to %edx.

But if we do this, then everything using the slow path
call_rwsem_down_write_failed et al, which then calls
{save,restore}_common_regs, would have to remember to use %edx as
temporary because {save,restore}_common_regs won't protect it and gcc
might clobber it.

OTOH, the 64-bit versions {save,restore}_common_regs don't stash away
%rdx either so I guess that mechanism was supposed to not save the ABI
return registers rAX and rDX.

The only thing that needs to be corrected then is the misleading commen=
t
above the 32-bit version "... Save the C-clobbered registers (%eax, %ed=
x
and %ecx) .." - the 64-bit version comment is correct AFAICT.

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
