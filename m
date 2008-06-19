From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the bkl-removal tree
Date: Thu, 19 Jun 2008 14:51:19 -0600
Message-ID: <20080619145119.505c14f0@bike.lwn.net>
References: <20080616165051.7dcada58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vena.lwn.net ([206.168.112.25]:54066 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751325AbYFSUvV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jun 2008 16:51:21 -0400
In-Reply-To: <20080616165051.7dcada58.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@sisk.pl>

On Mon, 16 Jun 2008 16:50:51 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jon,
> 
> Today's linux-next merge of the bkl-removal tree got conflicts in
> kernel/power/user.c between commit
> 56ca8b0af290931c647e23876b75f9fd78cbaa82 ("snapshot: Use pm_mutex for
> mutual exclusion") from the acpi tree and commit
> 478dfeabc7e4499fa1c5b009537433f75ef939d8 ("power-user: BKL pushdown")
> from the blk-removal tree.
> 
> I used the version from the acpi tree.  So it looks like the latter
> is no longer needed.
> 

>From my reading of the pm_mutex patch, it does seem to eliminate the
need to hold the BKL in the open() path.  Unless somebody objects, I'll
be removing the pushdown patch from the bkl-removal tree.

Thanks,

jon

Jonathan Corbet / LWN.net / corbet@lwn.net
