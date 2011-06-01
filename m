From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [Kgdb-bugreport] [PATCH] kgdbts: only use new asm-generic/ptrace.h
 api when needed
Date: Tue, 31 May 2011 22:19:02 -0400
Message-ID: <BANLkTimSJm8Un8dPzCw8Y-J8R5w-Dqm44Q@mail.gmail.com>
References: <20110527151135.cd6f758a.sfr@canb.auug.org.au> <1306591465-9622-1-git-send-email-vapier@gentoo.org>
 <4DE3688A.4040600@mvista.com> <BANLkTind_F4-5sLUO1GVxK_yY_eXz_J0Vg@mail.gmail.com>
 <20110601101117.6c9792a1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:63866 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933082Ab1FACTX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2011 22:19:23 -0400
In-Reply-To: <20110601101117.6c9792a1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus <torvalds@linux-foundation.org>, Sergei Shtylyov <sshtylyov@mvista.com>, kgdb-bugreport@lists.sourceforge.net, Jason Wessel <jason.wessel@windriver.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 31, 2011 at 20:11, Stephen Rothwell wrote:
> It would have been nice if the original patch had been in linux-next at
> some point (especially given that I have a "kgdb" tree in linux-next).

complain to akpm.  the patches sat in his tree for some time with no complaints.
-mike
