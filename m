From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH -next] modules: Fix up build when
 CONFIG_MODULE_UNLOAD=n.
Date: Wed, 15 Apr 2009 08:19:59 +1000 (EST)
Message-ID: <alpine.LRH.2.00.0904150819460.12563@tundra.namei.org>
References: <20090409154944.GC7789@linux-sh.org> <20090414062647.GA28905@linux-sh.org> <20090414172718.0ad4572c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:4167 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751669AbZDNWU0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 18:20:26 -0400
In-Reply-To: <20090414172718.0ad4572c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>, Kees Cook <kees@ubuntu.com>, Rusty Russell <rusty@rustcorp.com.au>

On Tue, 14 Apr 2009, Stephen Rothwell wrote:

> On Tue, 14 Apr 2009 15:26:47 +0900 Paul Mundt <lethal@linux-sh.org> wrote:
> >
> > This is still broken in today's -next..
> 
> James, can we have this fixed, please?

Applied to 
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
