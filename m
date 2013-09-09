From: Ian Kent <raven@themaw.net>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Mon, 09 Sep 2013 16:54:20 +0800
Message-ID: <1378716860.3212.11.camel@perseus.fritz.box>
References: <20130909123328.123599b5147d68276bccea1a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37891 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751025Ab3IIIyX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Sep 2013 04:54:23 -0400
In-Reply-To: <20130909123328.123599b5147d68276bccea1a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2013-09-09 at 12:33 +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> After merging the vfs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> fs/autofs4/dev-ioctl.c: In function 'find_autofs_mount':
> fs/autofs4/dev-ioctl.c:193:2: error: implicit declaration of function 'user_path_mntpointat' [-Werror=implicit-function-declaration]
>   int err = user_path_mntpointat(AT_FDCWD, pathname, 0, &path);
>   ^
> 
> Caused by commit b3a19b078049 ("autofs4 - fix device ioctl mount lookup").
> 
> I have used the vfs tree form next-20130906 for today.

As far as I can see that is already fixed in viro/vfs.git for-next.

AFAICT the problem arose because there was a difference (missed) between
what I posted and how Al wanted to do it.

Ian
