Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E76C0650E
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29739218A3
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnNEBh+z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfGCVJb (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 17:09:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52336 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfGCVJb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2019 17:09:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id s3so3608127wms.2
        for <linux-next@vger.kernel.org>; Wed, 03 Jul 2019 14:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K2xy1xeeDMsKEYvgxtzQ8t5d80FriYIp+WF12Xfi0CA=;
        b=HnNEBh+zl7wTPb8RaoWuvd+SX1OM5o+KagXZf92iiY5f4IjKUF6b8eqoyx1/Q7YIv9
         31lhdu6eX7WMf5E+FRUv7SGrpWsD+AzJd2YfHmzLvTOFu0wWNq5hZjTl9xtH4ccdGkva
         Agohf4w3KaqsDT8RN5RbHOOraL4vRRryxsO8x5U36VXWV7e2Rwhv2PK2a4NUz83uJTEo
         2lW3plHMIuc7tgbiKSc00/YfDGhMiDVYDIsJ9fckEIa9xKI9C6aLNgk95GMkwzb2vOm8
         ai/Qm1suu7yUBUXuD0It7YasqbuejEgUaD+HD3kV6Xf7aOROUHhMoTOyLTgnZfYX/uhL
         inAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K2xy1xeeDMsKEYvgxtzQ8t5d80FriYIp+WF12Xfi0CA=;
        b=Ch1zPqOoeYCado7Ekm5eby9tr6Oka3WoQUppvkMSAzB+NUJP9Y0FfHDEeBSL0JuKtZ
         EL0MIV6m71aTx04BW0U/cxlguvzGactCkwpNM+L2VQWt4ep1V3U+aH57IMmghvLMCP/O
         94hxr8vDU3uBcWk4ZgGaOnOdWsnZw1V/ieYBtI7m2T6fhF98BOKJyYGmS+nUiC4bWjAD
         RwagreQ9iWYszru/j+ry/BxGwKMiQe4D/EqhDJ7Mcg/nLH707zdamZGkh6LinsB9pIv0
         j3MwDZTE4z9lU/9AkKjImKB6mXYYAHy2xkbVZjPlD3cBeNXkUZsW8wcSOHt+0IskFYmO
         VSvw==
X-Gm-Message-State: APjAAAWul38EFZM1tey7i7aJpqRIdkmLNWYwAOq3V1K1dtXnEFi21gGk
        8rh0VDJdAzZtcbJXBmbLS+gbOcNmwjpHbGthZ0c=
X-Google-Smtp-Source: APXvYqwV6x77xzq1PFcihbSMJCtsHR+Ku964Ry+pgRhc2HlQU61Z8UAagEDUbTsem24bOH5xdBuS+vARuGuE56BZxnk=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr9788347wmk.127.1562188168216;
 Wed, 03 Jul 2019 14:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com> <a9764210-9401-471b-96a7-b93606008d07@amd.com>
In-Reply-To: <a9764210-9401-471b-96a7-b93606008d07@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 3 Jul 2019 17:09:16 -0400
Message-ID: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
To:     "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 3, 2019 at 5:03 PM Kuehling, Felix <Felix.Kuehling@amd.com> wrote:
>
> On 2019-07-03 10:10 a.m., Jason Gunthorpe wrote:
> > On Wed, Jul 03, 2019 at 01:55:08AM +0000, Kuehling, Felix wrote:
> >> From: Philip Yang <Philip.Yang@amd.com>
> >>
> >> In order to pass mirror instead of mm to hmm_range_register, we need
> >> pass bo instead of ttm to amdgpu_ttm_tt_get_user_pages because mirror
> >> is part of amdgpu_mn structure, which is accessible from bo.
> >>
> >> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> >> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >> CC: Stephen Rothwell <sfr@canb.auug.org.au>
> >> CC: Jason Gunthorpe <jgg@mellanox.com>
> >> CC: Dave Airlie <airlied@linux.ie>
> >> CC: Alex Deucher <alexander.deucher@amd.com>
> >> ---
> >>   drivers/gpu/drm/Kconfig                          |  1 -
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  5 ++---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  3 +--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c           |  8 ++++++++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.h           |  5 +++++
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          | 12 ++++++++++--
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h          |  5 +++--
> >>   8 files changed, 30 insertions(+), 11 deletions(-)
> > This is too big to use as a conflict resolution, what you could do is
> > apply the majority of the patch on top of your tree as-is (ie keep
> > using the old hmm_range_register), then the conflict resolution for
> > the updated AMD GPU tree can be a simple one line change:
> >
> >   -   hmm_range_register(range, mm, start,
> >   +   hmm_range_register(range, mirror, start,
> >                          start + ttm->num_pages * PAGE_SIZE, PAGE_SHIFT);
> >
> > Which is trivial for everone to deal with, and solves the problem.
>
> Good idea.
>
>
> >
> > This is probably a much better option than rebasing the AMD gpu tree.
>
> I think Alex is planning to merge hmm.git into an updated drm-next and
> then rebase amd-staging-drm-next on top of that. Rebasing our
> amd-staging-drm-next is something we do every month or two anyway.
>

Go ahead and respin your patch as per the suggestion above.  then I
can apply it I can either merge hmm into amd's drm-next or we can just
provide the conflict fix patch whichever is easier.  Which hmm branch
is for 5.3?
https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/?h=hmm


>
> >
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> >> index 623f56a1485f..80e40898a507 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> >> @@ -398,6 +398,14 @@ struct amdgpu_mn *amdgpu_mn_get(struct amdgpu_device *adev,
> >>      return ERR_PTR(r);
> >>   }
> >>
> >> +struct hmm_mirror *amdgpu_mn_get_mirror(struct amdgpu_mn *amn)
> >> +{
> >> +    if (!amn)
> >> +            return NULL;
> >> +
> >> +    return &amn->mirror;
> >> +}
> > I think it is better make the struct amdgpu_mn public rather than add
> > this wrapper.
>
> Sure. I can do that. It won't make the patch smaller, though, if that
> was your intention.
>
> It looks like Stephen already applied my patch as a conflict resolution
> on linux-next, though. I see linux-next/master is getting updated
> non-fast-forward. So is the idea that its history will updated again
> with the final resolution on drm-next or drm-fixes?
>

linux-next can deal with rebases, etc.  If the contributing trees
rebase or change, linux-next will update.

Alex

> Regards,
>    Felix
>
> >
> > Jason
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
