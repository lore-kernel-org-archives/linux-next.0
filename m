From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Wed, 12 Nov 2008 14:45:29 -0800
Message-ID: <20081112224529.GC27479@kroah.com>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au> <1226079837.11596.19.camel@brick> <20081107184148.GA2320@kroah.com> <20081111225430.6966b37b@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:42321 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753863AbYKLXT6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 Nov 2008 18:19:58 -0500
Content-Disposition: inline
In-Reply-To: <20081111225430.6966b37b@pedra.chehab.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Harvey Harrison <harvey.harrison@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>

On Tue, Nov 11, 2008 at 10:54:30PM -0200, Mauro Carvalho Chehab wrote:
 
> 1) There were two ioctls that weren't supported by video_ioctl2(). This
> changeset provides the proper implementation:
> 
> http://git.kernel.org/?p=linux/kernel/git/mchehab/linux-next.git;a=commit;h=b35e0c6035369de9f3273b6a3fbb1c67f830cf49
> 
> You'll need this patch in order to compile go7007. It is currently at
> linux-next. It is safe to add this upstream, but this is not a bug fix
> patch. So, it seems a little late to add this there...
> 
> Maybe we can just add an #if 0 for the two functions that implement those
> ioctls upstream. 

Thanks, I've done this to this patch.

> 2) go7007 used to implement his own proprietary code to allow controlling mpeg
> encoding parameters. At the time go7007 driver were written, there weren't any
> other options, but, since kernel 2.6.18, 3 newer ioctls were added, in
> order to support ivtv driver. So, I can't see any reason to keep those proprietary userpspace API, when we 
> 
> Those ioctls allows a proper setup for encoding and decoding parameters for
> mpeg, mpeg2, mpeg4 (and are extensive to allow other formats).
> 
> The conversion to use those ioctls would be more complex, and I was too lazy
> for doing this conversion right now ;)
> 
> So, on this patch, I just commented the affected code with #if 0. Hopefully,
> someone with more time may implement VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS and
> VIDIOC_TRY_EXT_CTRLS.
> 
> If nobody volunteer to do it, I may seek for sometime later to do it.

I think I already have this converted in my tree now from one of the
original authors.

thanks a lot for the patch, I appreciate it.

greg k-h
