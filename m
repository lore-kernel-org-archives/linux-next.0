From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: linux-next: manual merge of pcmcia tree
Date: Mon, 16 Jun 2008 10:57:54 +0200
Message-ID: <20080616085754.GA24149@isilmar.linta.de>
References: <20080616175126.e461b22b.sfr@canb.auug.org.au> <20080616081258.GA18142@isilmar.linta.de> <20080616184943.e369cf84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from isilmar.linta.de ([213.133.102.198]:58506 "EHLO linta.de"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1759536AbYFPI54 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Jun 2008 04:57:56 -0400
Content-Disposition: inline
In-Reply-To: <20080616184943.e369cf84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Jonathan Corbet <corbet@lwn.net>, linux-next@vger.kernel.org

Hi Stephen,

On Mon, Jun 16, 2008 at 06:49:43PM +1000, Stephen Rothwell wrote:
> On Mon, 16 Jun 2008 10:12:58 +0200 Dominik Brodowski <linux@dominikbrodowski.net> wrote:
> >
> > On Mon, Jun 16, 2008 at 05:51:26PM +1000, Stephen Rothwell wrote:
> > > Today's linux-next merge of the pcmcia tree got a conflict in
> > > drivers/char/pcmcia/cm4000_cs.c between commit
> > > d30f1f9e1f5391a649a4e2ad442c0b76f4e44c32 ("cm40x0: cdev lock_kernel()
> > > pushdown") from the bkl-removal tree and commit
> > > 5316046340ca74e0d327a88aa719fa0b2481a7ff ("pcmcia: switch cm4000_cs.c to
> > > unlocked_ioctl") from the pcmcia tree.
> > > 
> > > It was just overlapping replacement of includes, so I did the obvious
> > > fixup.
> > 
> > @Stephen: many thanks!
> > 
> > @Alan,@Jonathan: since this is the same patch, just a different title --
> > shall it be removed from one of our trees?
> 
> Those patches are not identical ... the first does _open, the second does
> _ioctl.  The only overlap in the includes at the top.

Uh, right. Sorry. If the other patch shall be included in the pcmcia tree
instead of the blk-tree, just send it to me.

Best,
	Dominik
