Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C30C5B578
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 23:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8738821881
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 23:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaZ3mUvL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfGCXLr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 19:11:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41468 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfGCXLq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jul 2019 19:11:46 -0400
Received: by mail-lj1-f194.google.com with SMTP id 205so4201779ljj.8
        for <linux-next@vger.kernel.org>; Wed, 03 Jul 2019 16:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UP+qxKT5rVjcWek7KzsMBfffszv54jR92VkwBR/jGz0=;
        b=AaZ3mUvL8AP96UyzVBT0wxy8e2SkMqvx50vLcd+2kNzxqNml8a56RhWeDZ8Q5Fc2wl
         KVqgai+DjYeH0uxdb1Ognc5BPZmL4WZWdPwoU9e/1vsBuhzhe15MUQC2vQ3x6DppiYYz
         keGu6n4LLGu0Lemc6scDgcDK2s7pVyjXKF1ICSfd81PCtTR04+43X2bbtckqCIgtQabF
         eve1j/83zkjYW5NYa8HNRPStRAQvookixhnFrvr6KwHgPAoLrwAZkKZg4Z+8+30v+HAZ
         eeMs9aX8DfP59lB6jGwMLBV4CWUVYTp0o5DmD1U0q7rtvnIXP4lu7165G3Kaz4iUbfda
         ev0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UP+qxKT5rVjcWek7KzsMBfffszv54jR92VkwBR/jGz0=;
        b=Hc3HjdsUmbFA43Z7xlD7pt8DVvNbd62Fk2Qw4P1+q9FBwGbv9SKU/i5fTPd9Q1m229
         /GYbvP6f6vqdoyvpINH/dNwPhNayqLlgE0agqvlH/0EP5Sosduf69N8Zqcm2XgSNgL5M
         MtxgrslSTkAaR9dhXDl03W2Wt+lHYLc8f3TcXE8asJ4SVSGET7+d09awZWPgvzYU4r24
         yDRIb/VP4NzI1goGhQMBxuKSOwX/WEgmpn24Fkj0Y0EUVaKjiV6Ug44nxAzeEA9ooTZ5
         z0SMRnUe6TFcDVJD4Hi0Fnv4Y8pZ5EE6NWj2HgROHfIup+csN5HFv4zJ0JLO83YB8X+I
         M3FA==
X-Gm-Message-State: APjAAAXMAdAMwaHyBkY1516jV9hX/YtHFghIbsJjTGuV1g0UR5U9I85g
        q+MyXX60Y3XIeayR/8Ff97IJmoeie6GC3ZFC3EM=
X-Google-Smtp-Source: APXvYqzZF2qms9SKK53fAVCvJv1RN+MZtTtgMYoI42VqDQ6BxFVX18oItEruFDL5MuzmBcvvjtk/MtdpSZD4X7Yl4T4=
X-Received: by 2002:a2e:9a10:: with SMTP id o16mr3126839lji.95.1562195504800;
 Wed, 03 Jul 2019 16:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
 <20190703141001.GH18688@mellanox.com> <a9764210-9401-471b-96a7-b93606008d07@amd.com>
 <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com> <20190704073214.266a9c33@canb.auug.org.au>
In-Reply-To: <20190704073214.266a9c33@canb.auug.org.au>
From:   Dave Airlie <airlied@gmail.com>
Date:   Thu, 4 Jul 2019 09:11:33 +1000
Message-ID: <CAPM=9tx+w5ujeaFQ1koqsqV5cTw8M8B=Ws_-wB1Z_Jy-msFtAQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Jason Gunthorpe <jgg@mellanox.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 4 Jul 2019 at 07:32, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Alex,
>
> On Wed, 3 Jul 2019 17:09:16 -0400 Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Go ahead and respin your patch as per the suggestion above.  then I
> > can apply it I can either merge hmm into amd's drm-next or we can just
> > provide the conflict fix patch whichever is easier.  Which hmm branch
> > is for 5.3?
> > https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/?h=hmm
>
> Please do not merge the hmm tree into yours - especially if the
> conflict comes down to just a few lines.  Linus has addressed this in
> the past.  There is a possibility that he may take some objection to
> the hmm tree (for example) and then your tree (and consequently the drm
> tree) would also not be mergeable.
>

I'm fine with merging the hmm tree if Jason has a stable non-rebasing
base. I'd rather merge into drm tree and then have amd backmerge if it
we are doing it.

But if we can just reduce the conflicts to a small amount it's easier
for everyone to just do that.

Dave.


> Just supply Linus with a hint about the conflict resolution.
>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
