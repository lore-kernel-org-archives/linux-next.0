From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the tip tree with the kbuild tree
Date: Mon, 7 May 2012 22:24:32 +0200
Message-ID: <20120507202432.GA10521@merkur.ravnborg.org>
References: <20120507151054.3fa8df4599e81cc6ae87ca7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:33796 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932115Ab2EGUYe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 16:24:34 -0400
Content-Disposition: inline
In-Reply-To: <20120507151054.3fa8df4599e81cc6ae87ca7a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>, Michal Marek <mmarek@suse.cz>

On Mon, May 07, 2012 at 03:10:54PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in Makefile
> between commit 1f2bfbd00e46 ("kbuild: link of vmlinux moved to a script")
> from the kbuild tree and commit 1dbdc6f177c6 ("kbuild/extable: Hook up
> sortextable into the build system") from the tip tree.
> 
> I used the Makefile bits from the kbuild tree and added the following
> patch as a merge fixup.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 7 May 2012 15:00:04 +1000
> Subject: [PATCH] kbuild: merge fix for sorting exceptions tables at build time
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks Stephen,

I should have know this conflict came up as I had seen this patch already.
But somehow I forgot it again.

	Sam
