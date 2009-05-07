From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the kmemleak tree with the x86 tree
Date: Thu, 7 May 2009 13:13:06 +0200
Message-ID: <20090507111306.GG28398@elte.hu>
References: <20090507155444.47dd74ea.sfr@canb.auug.org.au> <20090507092310.GA27707@elte.hu> <1241692671.6648.12.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40967 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753028AbZEGLNb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 May 2009 07:13:31 -0400
Content-Disposition: inline
In-Reply-To: <1241692671.6648.12.camel@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Sam Ravnborg <sam@ravnborg.org>


* Catalin Marinas <catalin.marinas@arm.com> wrote:

> > (it's fine if the kmemleak tree has that commit too [it 
> > obviously needs it] - so there will still be a conflict - just 
> > the resolution will be a straightforward 'pick the x86 tree 
> > side' step.)
> 
> There may not be a conflict if the changes are identical (but it 
> depends on what else is in the x86 tree).

They will conflict, because the x86 tree has these changes in that 
area:

 arch/x86/kernel/vmlinux.lds.S             |  430 ++++++++++-
 arch/x86/kernel/vmlinux_32.lds.S          |  229 ------
 arch/x86/kernel/vmlinux_64.lds.S          |  298 -------

spread out in 15 commits.

	Ingo
