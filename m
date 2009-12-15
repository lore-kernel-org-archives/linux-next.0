From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next: manual merge of the md-current tree with Linus'
 tree
Date: Tue, 15 Dec 2009 14:05:02 +1100
Message-ID: <20091215140502.5edd6678@notabene.brown>
References: <20091214102428.f50557a0.sfr@canb.auug.org.au>
	<200912141127.27019.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41298 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759092AbZLODFM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 22:05:12 -0500
In-Reply-To: <200912141127.27019.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 14 Dec 2009 11:27:26 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> Neil, still have  a tree where I track patches to fs/compat_ioctl.c
> that have not yet been merged. If you just keep the half in your
> own files and drop the ones in fs/compat_ioctl.c, I'll submit that
> next time. You can also adapt the patch again to the new contents
> and remove the four above to save me that work.
> 
> I didn't want to remove them from fs/compat_ioctl.c before they
> got added to md.c, in order to keep bisection correct.
> 
> 	Arnd


I had already rebased that patch on the lasted from Linus and asked him to
pull again.
He how seems to have done that, so md should be up-to-date in -linus,
including the compat_ioctl stuff.
If you would like to double check that it matches what you expect, that would
be great.

Thanks,
NeilBrown
