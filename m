From: Rob Clark <robdclark@gmail.com>
Subject: Re: linux-next: problems fetching the drm-intel, etc trees
Date: Wed, 30 Nov 2016 17:49:24 -0500
Message-ID: <CAF6AEGvh0pJcot9_6TESY28f8yZsAyKJfByca2TuhkKpkcxQXw@mail.gmail.com>
References: <20161201093958.3be47944@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:34675 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933610AbcK3WtZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2016 17:49:25 -0500
In-Reply-To: <20161201093958.3be47944@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Stone <daniels@collabora.com>

yeah, {cgit,anongit}.fd.o have been having problems all day.. (the ssh
git urls for folks who have push access work fine).. although it has
worked for me a couple times today, given enough time.

(not sure if we have github/etc mirrors somewhere?  I do have a github
clone of mesa which is up to date as of ~10min ago.. I could do the
same for other git trees if someone somewhere is stuck)

BR,
-R


On Wed, Nov 30, 2016 at 5:39 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> There is something seriaously wrong with anongit.freedesktop.org this
> morning.  Fething trees from there takes an enormous amount of time -
> so long that I had to abort the fetches ...
>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
