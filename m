Return-Path: <SRS0=fge+=DM=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FCFC4363A
	for <linux-next@archiver.kernel.org>; Mon,  5 Oct 2020 14:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 064312085B
	for <linux-next@archiver.kernel.org>; Mon,  5 Oct 2020 14:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CTB3t9HG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgJEOFj (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgJEOFj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Oct 2020 10:05:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97FCC0613CE
        for <linux-next@vger.kernel.org>; Mon,  5 Oct 2020 07:05:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id e18so3826259wrw.9
        for <linux-next@vger.kernel.org>; Mon, 05 Oct 2020 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=rYgwu/tsb6hqZBI1Z2tL8xDFx5slTZgCuj1UmwV+264=;
        b=CTB3t9HGVokgEOA3jolJ7ACDLs2ngsZCF7EaI13IHHQzva/DwYCi/n9j6GSDldLMKA
         WdyH9vanMUZ96PtuSw2eGBuXWYDlRiN8d2rBC2cxzVO2sUIub0tdKaMY8SXiVum0DR6b
         7JYvH8fRACBp77gNIGx9YiphHbDGcHPRYoYR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=rYgwu/tsb6hqZBI1Z2tL8xDFx5slTZgCuj1UmwV+264=;
        b=DFEy8z0oXooR16fFBFuCqDehAxhspIAqBJ8SG35xmXDGGHYXwNp0RbOku1HsrgzLw9
         WBmog9zMimrZPPCjIWHhB0pN+Q2gHtlkOVs+W9+pQTC4WFv16j2yeSpFGjYPAFi3fYUm
         lWasNzihxRjhVFjnNs3YVUGoXh5NZWwnWLQXTApFEyfVmr8Q412eycg638Zkxdy02SV8
         mJF9AOfYE0kfE9wcXIhT7cTKg3IVBEr2E9AW6A48kvFO1D2+x+n1cSmfKj5Fxrp5rDui
         Y41fyEwPsYL1L9G3vspQOtAm0eAmWmFq1/gON5c0QTBaxpTrNBv5mPYc1hG3L3Ryjj/W
         wdZA==
X-Gm-Message-State: AOAM5334bq+sM3lMuDJ+LThy2VGZrN7fYTluO7piGBM3ogyR7UdmoW7u
        Jn2xVLpgiZ6JUyELf+7iL9IwXQ==
X-Google-Smtp-Source: ABdhPJxMi1nfPkfOLmjDQdRZMHgZdbkFC/+JLPXFZ9DTO+fLouH+y58TOZSpuAE0JIFp8TB0TQHTug==
X-Received: by 2002:adf:c3c2:: with SMTP id d2mr3520496wrg.191.1601906737472;
        Mon, 05 Oct 2020 07:05:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z19sm12730698wmi.3.2020.10.05.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 07:05:36 -0700 (PDT)
Date:   Mon, 5 Oct 2020 16:05:34 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM buffers
 cached"
Message-ID: <20201005140534.GT438822@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
References: <20200930165212.GA8833@lst.de>
 <20201004141758.1013317-1-paul@crapouillou.net>
 <20201004195921.GA556605@ravnborg.org>
 <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
 <20201005230150.5637fa42@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005230150.5637fa42@canb.auug.org.au>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 05, 2020 at 11:01:50PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil <paul@crapouillou.net> wrote:
> >
> > Pushed to drm-misc-next with the changelog fix, thanks.
> > 
> > Stephen:
> > Now it should build fine again. Could you remove the BROKEN flag?
> 
> Thanks for letting me know, but the fix has not appeared in any drm
> tree included in linux-next yet ...
> 
> If it doesn't show up by the time I will merge the drm tree tomorrow, I
> will apply this revert patch myself (instead of the patch marking the
> driver BROKEN).

Yeah it should have been pushed to drm-misc-next-fixes per

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

Paul, can you pls git cherry-pick -x this over to drm-misc-next-fixes?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
