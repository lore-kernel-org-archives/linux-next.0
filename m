From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: state of the asm-generic tree
Date: Thu, 15 Jun 2017 11:37:01 +1000
Message-ID: <20170615113701.5caf03a6@canb.auug.org.au>
References: <20170608102853.07b94811@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35733 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752019AbdFOBhD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 21:37:03 -0400
In-Reply-To: <20170608102853.07b94811@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Arnd,

On Thu, 8 Jun 2017 10:28:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The asm-generic tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git#master)
> hasn't been updated since last September and currently contains 2 commits:
> 
> de4be6b87b6b asm-generic: page.h: fix comment typo
> acbdf0e98066 percpu: make this_cpu_generic_read notrace
> 
> The first is trivial but hasn't been applied to Linus' tree.  The latter
> has been applied to Linus' tree as a different commit (7f8d61f00522
> "percpu: use notrace variant of preempt_disable/preempt_enable").
> 
> Could you please tidy this up?

Ping?
-- 
Cheers,
Stephen Rothwell
