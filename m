From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: linux-next: problems fetching the drm-intel, etc trees
Date: Thu, 1 Dec 2016 20:50:01 +0000
Message-ID: <CAPj87rOxZxJAB-2FqdBV9jHJ3gcbbSvfARhUtF39HfM_eDryQw@mail.gmail.com>
References: <20161201093958.3be47944@canb.auug.org.au> <CAF6AEGvh0pJcot9_6TESY28f8yZsAyKJfByca2TuhkKpkcxQXw@mail.gmail.com>
 <cdua8dskv8xvorsys9a6z53yl-0@mailer.nylas.com> <20161202074515.6ae9fa4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34485 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbcLAUuE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2016 15:50:04 -0500
Received: by mail-lf0-f44.google.com with SMTP id o141so180736459lff.1
        for <linux-next@vger.kernel.org>; Thu, 01 Dec 2016 12:50:03 -0800 (PST)
In-Reply-To: <20161202074515.6ae9fa4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Stone <daniels@collabora.com>, Rob Clark <robdclark@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>

Hi Stephen,

On 1 December 2016 at 20:45, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 01 Dec 2016 11:02:26 +0000 Daniel Stone <daniels@collabora.com> wrote:
>> Sorry about this, it is quite bad. I think having mirrors for the key DRM
>> trees on GitHub is a good idea though, and I can get to setting that up.
>> Stephen, you need DRM (airlied), drm-misc, drm-panel, drm-intel, drm-tegra,
>> drm-exynos and drm-msm, right?
>
> Well, here are the trees I fetch from *.freedesktop.org:
>
> [...]
>
> I did not have any trouble with the people.fd.o ones.

That's actually interesting, given that they lie on the same host.
Perhaps it means that the locally-mounted ones were fine, and it was
the NFS (cough) mount between git/anongit which took a dive ... thanks
for the datapoint!

Cheers,
Daniel
