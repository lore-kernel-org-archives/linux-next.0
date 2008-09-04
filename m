From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Thu, 4 Sep 2008 01:44:18 -0300
Message-ID: <20080904014418.1c4d57dd@mchehab.chehab.org>
References: <20080901131458.24ac7832.sfr@canb.auug.org.au>
	<20080901134239.7d95d83a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:44865 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941AbYIDEoi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Sep 2008 00:44:38 -0400
In-Reply-To: <20080901134239.7d95d83a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Hans Verkuil <hverkuil@xs4all.nl>

On Mon, 1 Sep 2008 13:42:39 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Mauro,
> 
> On Mon, 1 Sep 2008 13:14:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the v4l-dvb tree got a conflict in
> > drivers/media/radio/dsbr100.c between commit
> > 59d1f04f76c8386d468f74c18fe5c008752c9340 ("USB: remove warn() macro from
> > usb.h") from the usb tree and commit
> > 63057954eb49549963c4c5079381492575cab33a ("V4L/DVB (8778): radio: fix
> > incorrect video_register_device result check") from the v4l-dvb tree.
> > 
> > Just a context clash.  I fixed it up (see below) and can carry the fix.
> 
> Of course, this is fixable in the v4l-dvb tree as well.

Hi Stephen,

Thanks for warning me. Unfortunately, I got some issues on my current procedure
of handling my tree. The old procedure of using stacked git were much better
from my side, but were leading to a few inconsistencies. I'm still trying to
find a way to allow me to merge my patches without generating merge noise on
upstream tree and without needing to rebase every time a patch is merged
upstream.

I'm trying to give a definitive solution to fix it. Due to
that, I had to rebase my tree (in fact, I've re-created it). So, this conflict
will likely rise on today's (and probably on tomorrow's merge), since I'm
currently focused on fixing my tree to send a long list of pending stuff
upstream.

Cheers,
Mauro
