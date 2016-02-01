From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the tty tree
Date: Sun, 31 Jan 2016 20:01:51 -0800
Message-ID: <20160201040151.GC16865@kroah.com>
References: <20160201145146.670ad8ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36231 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757594AbcBAEBy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 31 Jan 2016 23:01:54 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 174662D95F
	for <linux-next@vger.kernel.org>; Sun, 31 Jan 2016 23:01:54 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20160201145146.670ad8ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Hurley <peter@hurleysoftware.com>, Shraddha Barke <shraddha.6596@gmail.com>

On Mon, Feb 01, 2016 at 02:51:46PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/dgap/dgap.c
> 
> between commits:
> 
>   6aa56785e735 ("staging: digi: Replace open-coded tty_wakeup()")
>   2d73b069f816 ("staging: dgap: Remove redundant write_wait wakeups")
>   9db276f8f021 ("tty: Use termios c_*flag macros")
> 
> from the tty tree and commit:
> 
>   7e3933df9874 ("Staging: dgap: Remove obsolete driver")
> 
> from the staging tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as necessary
> (no action is required).

Thanks for this, that's the obviously correct fix.

greg k-h
