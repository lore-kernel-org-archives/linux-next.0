From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Date: Mon, 24 Jul 2017 10:24:41 +0200
Message-ID: <CAKMK7uGWiVS_dX1VUaN9qUKK2x+u0a0P6M56dbwHzaiYht2ahA@mail.gmail.com>
References: <20170719114657.245537cd@canb.auug.org.au> <20170721100833.48c8fa9d@canb.auug.org.au>
 <CAKMK7uHLY7jriTrZpxRFbjVf2mbdHymMw6HpW0NS0azf7Ea4Yw@mail.gmail.com> <20170724100341.7c4c5e33@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-io0-f174.google.com ([209.85.223.174]:35839 "EHLO
        mail-io0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbdGXIYn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Jul 2017 04:24:43 -0400
Received: by mail-io0-f174.google.com with SMTP id m88so31621169iod.2
        for <linux-next@vger.kernel.org>; Mon, 24 Jul 2017 01:24:42 -0700 (PDT)
In-Reply-To: <20170724100341.7c4c5e33@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Greg KH <greg@kroah.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

On Mon, Jul 24, 2017 at 2:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Daniel,
>
> On Fri, 21 Jul 2017 09:24:49 +0200 Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>
>> How are we going to handle this now? The refactor is deeply burried in
>> drm-misc, I guess you could cherry-pick the relevant patches over. But
>> that'll probably lead to more conflicts because git will get confused.
>
> I'll just keep applying the merge resolution patch and will remind Dave
> and Greg about it during the week before the merge window opens so that
> they can let Linus know that the fix up is needed.

Well, Greg squeezed the vbox driver into -rc2, so now we already get
to resolve this in a backmerge. And hopefully the bikeshed patches in
-staging won't interfere too badly with whatever refactoring we'll do
in drm-next.

Greg, fyi this is the last time I'll ack a drm driver for staging.
This just doesn't work. We're spending more time here working the
-staging vs. drm-next conflicts than the actual vbox driver review has
taken me. And probly less than the cleanup for merging directly to
drm-next will end up taking.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
