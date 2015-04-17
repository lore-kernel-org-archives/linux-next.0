From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: manual merge of the drm tree with the v4l-dvb tree
Date: Fri, 17 Apr 2015 04:07:49 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1504170405320.1232@skynet.skynet.ie>
References: <20150415133309.24f0a36a@canb.auug.org.au> <1429088942.3480.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:49415 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbbDQDHw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Apr 2015 23:07:52 -0400
In-Reply-To: <1429088942.3480.6.camel@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Hyun Kwon <hyun.kwon@xilinx.com>

> Am Mittwoch, den 15.04.2015, 13:33 +1000 schrieb Stephen Rothwell:
> > Hi Dave,
> > 
> > Today's linux-next merge of the drm tree got a conflict in
> > Documentation/DocBook/media/v4l/subdev-formats.xml between commit
> > 7b0fd4568bee ("[media] v4l: Add RBG and RGB 8:8:8 media bus formats on
> > 24 and 32 bit busses") and e8b2d7a565ae ("[media] v4l: Sort YUV formats
> > of v4l2_mbus_pixelcode") from the v4l-dvb tree and commits 08c38458be7e
> > ("Add BGR888_1X24 and GBR888_1X24 media bus formats"), 0fc63eb104d7
> > ("Add YUV8_1X24 media bus format") and 203508ef52e3 ("Add
> > RGB666_1X24_CPADHI media bus format") from the drm tree.
> > 
> > I fixed it up (almost certainly incorrectly - see below) and can carry
> > the fix as necessary.  Please sort out who "owns" this file and try to
> > coordinate updates to it.
> 
> Together with the corresponding fixup for include/uapi/linux/media-bus-format.h,
> how about this:

This should never have gone into my tree if there wasn't someone in the 
v4l tree who knew it was coming,

In future please merge the media-bus-formats through both tree, providing
a stable git tree to both maintainers to pull from, though this may not
avoid all bad cases, it hopefully will avoid this sort of mess.

I'm not really sure how best to clean this one up, I think I'd want
patches to my tree that just use the correect values, then it would just 
be a normal conflict on merging, instead of renumbering userspace visible
values,

Dave.
