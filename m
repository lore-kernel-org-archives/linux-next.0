From: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 1 Nov 2012 11:04:33 +0100
Message-ID: <20121101100432.GA2702@herton-ThinkPad-T420>
References: <20121031130439.7242d3f12fa7002624c3b1e6@canb.auug.org.au>
 <1351691714.13356.31.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1351691714.13356.31.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 31, 2012 at 01:55:14PM +0000, Ben Hutchings wrote:
> On Wed, 2012-10-31 at 13:04 +1100, Stephen Rothwell wrote:
> > Hi Jens,
> > 
> > Today's linux-next merge of the block tree got a conflict in
> > drivers/block/floppy.c between a set of common patches from Linus' tree
> > and commit b33d002f4b6b ("genhd: Make put_disk() safe for disks that have
> > not been registered") from the block tree.
> > 
> > I fixed it up (by using the block tree version) and can carry the fix as
> > necessary (no action is required).
> 
> commit b33d002f4b6b ("genhd: Make put_disk() safe for disks that have
> not been registered") was supposed to be dropped or reverted; I don't
> why it's hanging around.

I also don't feel inclined to continue to fiddle too much with the
floppy driver, but may be we should add to it a fix to not leak the
reference to disks[]->queue in the error handling, checking if we really
did the add_disk (the "disks[drive]->queue = NULL;" under out_put_disk).

> 
> Ben.
> 
> -- 
> Ben Hutchings
> I'm always amazed by the number of people who take up solipsism because
> they heard someone else explain it. - E*Borg on alt.fan.pratchett

-- 
[]'s
Herton
