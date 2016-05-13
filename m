From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] x86/rwsem: Save and restore all callee-clobbered regs in
 32-bit ____down_write()
Date: Fri, 13 May 2016 10:03:26 -0700
Message-ID: <CA+55aFwEruUyTVrR28SL4DQAY3zVEdXw9iKKf6L_S1Z_kHfxow@mail.gmail.com>
References: <57348665.3050301@roeck-us.net>
	<20160512135131.GA7803@pd.tnic>
	<20160512144657.GA14245@pd.tnic>
	<20160512172938.GB14245@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34901 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751739AbcEMRD1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 May 2016 13:03:27 -0400
In-Reply-To: <20160512172938.GB14245@pd.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <bp@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 12, 2016 at 10:29 AM, Borislav Petkov <bp@suse.de> wrote:
> Anyway, here's an actual patch with a commit message. Guenter, can you
> give it a run please?

I think the commit message is misleading.

> ____down_write() calls a function to handle the slow path when the lock
> is contended. But in order to be able to call a C function, one has to
> stash all callee-clobbered registers. The 32-bit path saves only %ecx
> for a reason unknown to me.

Why claim that it's unknown? You know exactly what the reason was:

> the useless dependency on edx was removed and this caused the following
> splat:

The dependency on %edx was clearly exactly because the calling
convention for the slow-path was that %eax and %edx were clobbered,
and %edx was used as a temporary, so clobbering it had no downside.

So it wasn't useless, it was explicit, and commit 71c01930b42e was just broken.

I think your fix is wrong. Your fix adds the pointless push/pop that
doesn't help any, since you might as well just force the temporary
back to %edx.

The correct fix is to revert the broken commit.

If commit 71c01930b42e had actually generated better code, that would
be different. But it doesn't. So as it is, this is all just worse than
it used to be, and I don't see the point of "fixing" things by making
them worse.

Revert back to the old "use %edx as a temporary", together with a
comment so that this doesn't happen again.

                     Linus
