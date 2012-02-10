From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the staging tree with Linus' tree
Date: Fri, 10 Feb 2012 11:01:42 -0800
Message-ID: <20120210190142.GA29416@kroah.com>
References: <20120210154806.4a81ec53dc24a40cf91a758a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:36600 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759036Ab2BJTBs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Feb 2012 14:01:48 -0500
Content-Disposition: inline
In-Reply-To: <20120210154806.4a81ec53dc24a40cf91a758a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Omar Ramirez Luna <omar.ramirez@ti.com>, =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez?= Leal <vjaquez@igalia.com>

On Fri, Feb 10, 2012 at 03:48:06PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/tidspbridge/rmgr/drv_interface.c between commit
> 5a63177a6967 ("staging: tidspbridge: fix bridge_open memory leaks") from
> Linus' tree and commit 518761dba127 ("staging: tidspbridge: remove unused
> header") from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Thanks, this should now be resolved in your next pull of my staging
trees.

greg k-h
