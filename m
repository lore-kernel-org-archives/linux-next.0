From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the bdev tree
Date: Fri, 17 Oct 2008 12:14:23 +0100
Message-ID: <20081017111423.GI28946@ZenIV.linux.org.uk>
References: <20081017183557.f831ab54.sfr@canb.auug.org.au> <20081017184259.b66089bc.sfr@canb.auug.org.au> <58cb370e0810170158p666c1dbcm6f7b08b4aa7bdffb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:55499 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752859AbYJQLO1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Oct 2008 07:14:27 -0400
Content-Disposition: inline
In-Reply-To: <58cb370e0810170158p666c1dbcm6f7b08b4aa7bdffb@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Oct 17, 2008 at 10:58:42AM +0200, Bartlomiej Zolnierkiewicz wrote:

> Yes, the common ide-{disk,floppy}.c code resides now in ide-gd.c.
> 
> > I got a bit harder after that ... so I have again dropped the bdev for
> > today.
> 
> This may be actually my fault since I remember Al asking me about some
> conflicting
> changes during KS/LPC? (though I later forgot about it).
> 
> Al, is stuff in bdev-next going in during this merge window?  If so
> please push it
> to Linus ASAP and I'll take care of fixing IDE patches.  Otherwise I'm
> going to push
> IDE stuff to Linus and you'll have to fixup bdev-next. ;-)

As the matter of fact, I've got bdev-next variant covering ide-gd, so
if you can push the relevant ide patch(es) to Linus, bdev would be ready
to go.  Or I can push the mainline-based variant and send the pieces
that affect ide-gd your way (basically, it's a matter of f_mode/f_flags
stuff being touched in ide-gd instead of ide-floppy, converting your
disk_ops->ioctl() to sane prototype and converting ide-gd.c to new
bdev method prototypes).  Up to you...

Al, trying to order the VFS patch-pile into mergable shape right now...
