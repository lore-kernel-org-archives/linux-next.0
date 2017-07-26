From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: unsigned commits in the drm-misc tree
Date: Wed, 26 Jul 2017 14:20:28 +0200
Message-ID: <CAKMK7uF4HuoMG1RGWi_KiJow_cZbJtb3-Tg_Mv8BD=nsqjOTtQ@mail.gmail.com>
References: <20170726161126.170e052f@canb.auug.org.au> <CAKMK7uGhD6nr0ynfEWitm-J53WyDBxQFixfTSewJbwY5xf_54w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:32910 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751031AbdGZMUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 26 Jul 2017 08:20:30 -0400
Received: by mail-it0-f50.google.com with SMTP id v127so15391832itd.0
        for <linux-next@vger.kernel.org>; Wed, 26 Jul 2017 05:20:30 -0700 (PDT)
In-Reply-To: <CAKMK7uGhD6nr0ynfEWitm-J53WyDBxQFixfTSewJbwY5xf_54w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philippe CORNU <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Fabien Dessenne <fabien.dessenne@st.com>

On Wed, Jul 26, 2017 at 9:09 AM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Oops, that shouldn't have happened. Actually, our maintainer tooling
> ensures this doesn't happen, by auto-adding the committer sob line.
> But these patches (and a bunch of others pushed by Benjamin) haven't
> been pushed by our tooling it seems (the Link: tag is missing at
> least).
>
> Benjamin, what happened there?

Ok, figured it out, added another safety check to the scripting, and
hard-reset the tree. Unfortunately some of the patches already landed
in drm-next, so that needed a hard-reset too, plus in drm-intel-next,
where I still need to do the hard-reset. Ugh.

Benjamin: As part of the hard-reset I've thrown out all the patches
you've committed. That was simpler than digging out the right patches
from the rebase push. Please re-apply and push the right ones again.

My apologies for the hiccup, we maintainers (Dave, Sean & me) should
have caught this earlier.

Thanks, Daniel

>
> Thanks, Daniel
>
>
> On Wed, Jul 26, 2017 at 8:11 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> I noticed a set of commits that have no Signed-off-by from their
>> committer:
>>
>>   d9864a1d2dfc ("drm/stm: drv: Rename platform driver name")
>>
>> to
>>
>>   ed34d261a12a ("drm/stm: dsi: Constify phy ops structure")
>>
>> --
>> Cheers,
>> Stephen Rothwell
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
