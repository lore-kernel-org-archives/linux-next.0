From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Tue, 21 Apr 2015 15:36:00 +0200
Message-ID: <1429623360.3673.3.camel@pengutronix.de>
References: <20150421115409.73e6a066@canb.auug.org.au>
	 <20150421180243.15b11537@canb.auug.org.au>
	 <20150421065640.02f14142@recife.lan> <1908360.Iueb02OAJf@avalon>
	 <20150421101207.4616e284@recife.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:58178 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750987AbbDUNgT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Apr 2015 09:36:19 -0400
In-Reply-To: <20150421101207.4616e284@recife.lan>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>, Boris Brezillion <boris.brezillon@free-electrons.com>, Hyun Kwon <hyun.kwon@xilinx.com>

Am Dienstag, den 21.04.2015, 10:12 -0300 schrieb Mauro Carvalho Chehab:
> Em Tue, 21 Apr 2015 15:38:02 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
> > Hi Mauro,
> > 
> > On Tuesday 21 April 2015 06:56:40 Mauro Carvalho Chehab wrote:
> > > Em Tue, 21 Apr 2015 18:02:43 +1000 Stephen Rothwell escreveu:
> > > > On Tue, 21 Apr 2015 10:49:52 +0300 Laurent Pinchart wrote:
> > > > > >  +#define MEDIA_BUS_FMT_YUV10_1X30              0x2016
> > > > > >  +#define MEDIA_BUS_FMT_AYUV8_1X32              0x2017
> > > > > >  +#define MEDIA_BUS_FMT_UYVY12_2X12             0x201c
> > > > > >  +#define MEDIA_BUS_FMT_VYUY12_2X12             0x201d
> > > > > >  +#define MEDIA_BUS_FMT_YUYV12_2X12             0x201e
> > > > > >  +#define MEDIA_BUS_FMT_YVYU12_2X12             0x201f
> > > > > 
> > > > > The above 6 lines introduce duplicate defines, you can remove them.
> > > > 
> > > > OK, thanks, done for tomorrow.  Though hopefully all this will be
> > > > resolved soon.
> > > 
> > > I think that the best is for me to merge from the DRM branch that Linus
> > > picked, and solve the conflict there.
> > > 
> > > This way, it should be a way easier for Linus to pick it, and not
> > > manually solve those conflicts with are not trivial.
> > > 
> > > Laurent/Philipp,
> > > 
> > > Please double-check if everything went fine on my conflict solving.
> > > I'm pushing it at branch "fixes" at the media development tree:
> > > 	git://linuxtv.org/media_tree.git fixes
> > > 
> > > In any case, I double-checked that it is compiling and it is producing the
> > > media DocBook.
> > > 
> > > PS.: I intend to send this latter today for being merged upstream.
> > 
> > The numerical values are correct, but the order of the YUV formats got messed
> > up. Could you squash the following change into the merge ?
> 
> Sure. Squashed.

Thanks, this looks good to me.

One small thing, I noticed the MEDIA_BUS_FMT_VUY8_1X24 documentation has
the wrong value: It says 0x201a, but it should be 0x2024. This was
already wrong in the original patch: 2dca0551e4e2 ("[media] v4l: Add
VUY8 24 bits bus format").

regards
Philipp
