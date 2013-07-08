From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: build failure after merge of the final tree (v4l-dvb
 tree related)
Date: Mon, 8 Jul 2013 09:58:19 -0300 (BRT)
Message-ID: <alpine.LFD.2.03.1307080929510.3984@infradead.org>
References: <20130708152658.1d6e24874c3363c5f115a005@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50999 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751108Ab3GHM6d (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 8 Jul 2013 08:58:33 -0400
In-Reply-To: <20130708152658.1d6e24874c3363c5f115a005@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

On Mon, 8 Jul 2013, Stephen Rothwell wrote:

> Hi all,
>
> After merging the final tree, today's linux-next build
> (powerpc_ppc44x_defconfig) failed like this:
>
> arch/powerpc/boot/wrapper: line 314: .../scripts/mkuboot.sh: Permission denied
>
> Caused by commit cda2bf15f6dc ("Update email to m.chehab@samsung.com")
> from the v4l-dvb tree.

Sorry. That was due to a bad merge at my -next tree, where I had there 
both the correct and the wrong patches merged. The correct changeset
is this one:
 	http://git.linuxtv.org/mchehab/media-next.git/commit/de58f1a28541fef62f20465dcd1bbcf25b4685c5

It is fixed there already.

> I have reverted that commit for today.
>
> Linus, please don't merge the v4l-dvb tree like it is.

I'll wait for tomorrow's next to see if everything is ok, before sending a 
new pull request.

> Mauro, in the case of copyright notices, you should just remove your
> email address, not bother changing it.

Hmm... then I'll need to re-do the patch, manually reviewing each hunk, 
instead of replacing via a script, as, on some places, like MAINTAINERS, 
we need to preserve the email.

Let me simplify it: I'll drop that patch, replacing by one that will
just change MAINTAINERS. I'll later submit the remaining changes on
a separate patch for the next merge window.

Regards,
Mauro
