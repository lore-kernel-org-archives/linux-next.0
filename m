From: Harvey Harrison <harvey.harrison@gmail.com>
Subject: Re: linux-next: v4l-dvb tree build failure
Date: Fri, 07 Nov 2008 09:43:57 -0800
Message-ID: <1226079837.11596.19.camel@brick>
References: <20081107143046.7b2b171a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.169]:1428 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752256AbYKGRtQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Nov 2008 12:49:16 -0500
Received: by wf-out-1314.google.com with SMTP id 27so1365391wfd.4
        for <linux-next@vger.kernel.org>; Fri, 07 Nov 2008 09:49:15 -0800 (PST)
In-Reply-To: <20081107143046.7b2b171a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-next@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Greg KH <greg@kroah.com>

On Fri, 2008-11-07 at 14:30 +1100, Stephen Rothwell wrote:
> Hi Mauro,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/staging/go7007/go7007-v4l2.c: In function 'go7007_ioctl':
> drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 1 of 'video_usercopy' from incompatible pointer type
> drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 2 of 'video_usercopy' makes integer from pointer without a cast
> drivers/staging/go7007/go7007-v4l2.c:1338: warning: passing argument 4 of 'video_usercopy' makes pointer from integer without a cast
> drivers/staging/go7007/go7007-v4l2.c:1338: error: too many arguments to function 'video_usercopy'
> 
> Caused by commit 579209181bfc24ee03a0d167bdc32106afd4e269 ("V4L/DVB
> (9503): v4l: remove inode argument from video_usercopy") which missed the
> above driver.
> 
> I have dropped your tree again for today.

Is it really fair to drop the v4l tree when it was -staging that broke?  I'd humbly
suggest that staging be weighted somewhat lower than the other trees.

Cheers,

Harvey
