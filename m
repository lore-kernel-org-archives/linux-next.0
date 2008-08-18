From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: origin tree build failure
Date: Mon, 18 Aug 2008 13:55:30 +0100
Message-ID: <17141.1219064130@redhat.com>
References: <20080818100151.c2e9e508.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:34797 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752549AbYHRMzk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 08:55:40 -0400
In-Reply-To: <20080818100151.c2e9e508.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, David Fries <david@fries.net>, James Morris <jmorris@namei.org>, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> As expected (reported by David Fries), today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/tracehook.h:52,
>                  from arch/powerpc/kernel/signal.c:13:
> include/linux/security.h: In function 'security_ptrace_traceme':
> include/linux/security.h:1760: error: 'parent' undeclared (first use in this function)
> 
> Caused by commit 5cd9c58fbe9ec92b45b27e131719af4f2bd9eb40 ("security: Fix
> setting of PF_SUPERPRIV by __capable()").  The version of this commit
> that has been in the linux-next tree from Aug 8 to Aug 15 is correct, so
> I have no idea what happened.

I accidentally posted an old patch which James, maybe, substituted for the
good one that he had.

David
