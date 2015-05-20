From: Dave Airlie <airlied@linux.ie>
Subject: Re: linux-next: build failure after merge of the drm tree
Date: Wed, 20 May 2015 07:08:51 +0100 (IST)
Message-ID: <alpine.DEB.2.00.1505200707290.3204@skynet.skynet.ie>
References: <20150520130828.4fdacf54@canb.auug.org.au> <alpine.DEB.2.00.1505200541090.3204@skynet.skynet.ie> <20150520152538.15e7a1cc@canb.auug.org.au> <20150520153102.3e70a45c@canb.auug.org.au>
 <CAFCwf10NJNcivdX92_5Jk-fHOJ1L-VAEq=hfEh+1b2nSuK3D3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gir.skynet.ie ([193.1.99.77]:59459 "EHLO gir.skynet.ie"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751532AbbETGI7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 02:08:59 -0400
In-Reply-To: <CAFCwf10NJNcivdX92_5Jk-fHOJ1L-VAEq=hfEh+1b2nSuK3D3A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>


> >> > drm-next and fix it up there.
> >>
> >> Yep, against commit 79b066bd76d5 ("drm/amdkfd: Initialize sdma vm when
> >> creating sdma queue") which is in v4.1-rc3.
> >
> > So you could, of course, just merge that commit instead of Linus'
> > tree ...
> >
> > --
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> 
> Hi,
> Did I need to do something different in order to prevent this conflict ?
> Do some manual merge before sending the pull request ?
> 

Well this sort of thing is why linux-next exists, you can pull Linus's 
tree into yours to see if it builds before pulling, but you can find 
yourself fixing conflicts in other parts of the drm stack then.

I'll pull v4.1-rc4 tag in as a nicer merge point that misc Linus master.

Dave.
