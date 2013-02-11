From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the tty tree
Date: Mon, 11 Feb 2013 06:37:00 -0800
Message-ID: <20130211143700.GB1017@kroah.com>
References: <20130211163714.289cb3288ed5098c7b493af3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40173 "EHLO
	out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757365Ab3BKOgw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Feb 2013 09:36:52 -0500
Content-Disposition: inline
In-Reply-To: <20130211163714.289cb3288ed5098c7b493af3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Jiri Slaby <jslaby@suse.cz>, Joe Perches <joe@perches.com>

On Mon, Feb 11, 2013 at 04:37:14PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/char/pcmcia/synclink_cs.c between commits 2e124b4a390c ("TTY:
> switch tty_flip_buffer_push") and 9fe8074b82ed ("TTY: synclink: Convert + to
> | for bit operations") from the tty tree and commit 3d55399391c8 ("pcmcia: synclink_cs: cleanup checkpatch warnings") from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Fix looks good, thanks.

greg k-h
