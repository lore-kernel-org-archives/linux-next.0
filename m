From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: problems fetching the drm-intel, etc trees
Date: Fri, 2 Dec 2016 07:45:15 +1100
Message-ID: <20161202074515.6ae9fa4c@canb.auug.org.au>
References: <20161201093958.3be47944@canb.auug.org.au>
        <CAF6AEGvh0pJcot9_6TESY28f8yZsAyKJfByca2TuhkKpkcxQXw@mail.gmail.com>
        <cdua8dskv8xvorsys9a6z53yl-0@mailer.nylas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38793 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757523AbcLAUpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Dec 2016 15:45:18 -0500
In-Reply-To: <cdua8dskv8xvorsys9a6z53yl-0@mailer.nylas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Stone <daniels@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

Hi Daniel,

On Thu, 01 Dec 2016 11:02:26 +0000 Daniel Stone <daniels@collabora.com> wrote:
>
> On Nov 30 2016, at 10:49 pm, Rob Clark <robdclark@gmail.com> wrote:  
> 
> > yeah, {cgit,anongit}.fd.o have been having problems all day.. (the ssh    
> git urls for folks who have push access work fine).. although it has  
> worked for me a couple times today, given enough time.
> >  
> > (not sure if we have github/etc mirrors somewhere? I do have a github    
> clone of mesa which is up to date as of ~10min ago.. I could do the  
> same for other git trees if someone somewhere is stuck)
> 
> Sorry about this, it is quite bad. I think having mirrors for the key DRM
> trees on GitHub is a good idea though, and I can get to setting that up.
> Stephen, you need DRM (airlied), drm-misc, drm-panel, drm-intel, drm-tegra,
> drm-exynos and drm-msm, right?

Well, here are the trees I fetch from *.freedesktop.org:

drm-intel-fixes	git://anongit.freedesktop.org/drm-intel	for-linux-next-fixes
drm-misc-fixes	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next-fixes
drm		git://people.freedesktop.org/~airlied/linux.git	drm-next
drm-panel	git://anongit.freedesktop.org/tegra/linux.git	drm/panel/for-next
drm-intel	git://anongit.freedesktop.org/drm-intel	for-linux-next
drm-tegra	git://anongit.freedesktop.org/tegra/linux.git	drm/tegra/for-next
drm-misc	git://anongit.freedesktop.org/drm/drm-misc	for-linux-next
drm-msm		git://people.freedesktop.org/~robclark/linux	msm-next

I did not have any trouble with the people.fd.o ones.

> Though, whilst you're at it, I noticed that the drm-misc tree needs updating:
> it's now at git://anongit.freedesktop.org/drm/drm-misc, rather than a branch
> of drm-intel.

I was informed, thanks.

Having mirrors is probably more effort for me than the slight outage
was (I would have to modify my control file for the outage period).  I
can merely use the version of a tree I already have if I can't fetch it
for a day or so.  If you were to have official mirrors, then
git.kernel.org makes more sense for the kernel parts anyway.

-- 
Cheers,
Stephen Rothwell
