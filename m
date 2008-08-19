From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree
Date: Tue, 19 Aug 2008 12:55:14 -0700
Message-ID: <20080819195514.GA10502@kroah.com>
References: <20080819141113.1a0a9819.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:53783 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752925AbYHSUIx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Aug 2008 16:08:53 -0400
Content-Disposition: inline
In-Reply-To: <20080819141113.1a0a9819.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Tue, Aug 19, 2008 at 02:11:13PM +1000, Stephen Rothwell wrote:
> Hi Mauro,
> 
> Today's linux-next merge of the v4l-dvb tree got a conflict in
> drivers/media/video/zr364xx.c between commit
> 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB: remove info() macro from
> usb.h") from the usb tree and commit
> dcdbac23cc15325ae04696803537b35bb0bcb3cb ("V4L/DVB (8613): v4l: move BKL
> down to the driver level") from the v4l-dvb tree.
> 
> A context clashing change and addition.  I fixed it up (see below) and
> can carry it.

Looks fine to me, thanks for doing this.

greg k-h
