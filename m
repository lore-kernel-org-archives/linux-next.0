From: Dave Chinner <david@fromorbit.com>
Subject: Re: randconfig build error with next-20151013, in
 fs/xfs/libxfs/xfs_alloc.c
Date: Wed, 14 Oct 2015 08:24:54 +1100
Message-ID: <20151013212454.GJ31326@dastard>
References: <CA+r1Zhg0y-47JuzOMANcXykyU=No-TEBksLnnT-g0OsTKwazRQ@mail.gmail.com>
 <20151013204119.GI31326@dastard>
 <CA+r1ZhiKiVja7vm5F-mmtq3xVm4gufGW1fFuF6FD7RpU17T6PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ipmail04.adl6.internode.on.net ([150.101.137.141]:27689 "EHLO
	ipmail04.adl6.internode.on.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752979AbbJMVZL (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2015 17:25:11 -0400
Content-Disposition: inline
In-Reply-To: <CA+r1ZhiKiVja7vm5F-mmtq3xVm4gufGW1fFuF6FD7RpU17T6PA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com

On Tue, Oct 13, 2015 at 02:08:28PM -0700, Jim Davis wrote:
> On Tue, Oct 13, 2015 at 1:41 PM, Dave Chinner <david@fromorbit.com> wrote:
> > On Tue, Oct 13, 2015 at 09:41:25AM -0700, Jim Davis wrote:
> >> Building with the attached random configuration file,
> >>
> >> fs/built-in.o: In function `xfs_free_ag_extent':
> >> /home/jim/linux-next/fs/xfs/libxfs/xfs_alloc.c:1813: undefined
> >> reference to `xfsstats'
> >
> > Please test the patch below.
> 
> Looks good!  Thanks.
> 
> Tested-by: Jim Davis <jim.epost@gmail.com>

Thanks for testing it quickly, Jim.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
