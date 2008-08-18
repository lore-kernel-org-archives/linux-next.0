From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: origin tree build failure
Date: Tue, 19 Aug 2008 00:03:23 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808190000210.21404@tundra.namei.org>
References: <20080818100151.c2e9e508.sfr@canb.auug.org.au> <17141.1219064130@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:56365 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752686AbYHROEc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 10:04:32 -0400
In-Reply-To: <17141.1219064130@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, David Fries <david@fries.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, 18 Aug 2008, David Howells wrote:

> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > As expected (reported by David Fries), today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> > 
> > In file included from include/linux/tracehook.h:52,
> >                  from arch/powerpc/kernel/signal.c:13:
> > include/linux/security.h: In function 'security_ptrace_traceme':
> > include/linux/security.h:1760: error: 'parent' undeclared (first use in this function)
> > 
> > Caused by commit 5cd9c58fbe9ec92b45b27e131719af4f2bd9eb40 ("security: Fix
> > setting of PF_SUPERPRIV by __capable()").  The version of this commit
> > that has been in the linux-next tree from Aug 8 to Aug 15 is correct, so
> > I have no idea what happened.
> 
> I accidentally posted an old patch which James, maybe, substituted for the
> good one that he had.

I took the patch you sent me, although after some IRC discussion, what 
should have happened is that I should have git-cherry-pick'd the patch 
from the next-creds branch (where it had been tested in linux-next for 
some time) into for-linus rather than asking for an updated patch.

Sorry folks.


- James
-- 
James Morris
<jmorris@namei.org>
