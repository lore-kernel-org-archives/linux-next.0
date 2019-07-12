Return-Path: <SRS0=0/zj=VJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DCDC742BB
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 13:02:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 66A2320863
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 13:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brauner.io header.i=@brauner.io header.b="goMsRLSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfGLNCk (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 12 Jul 2019 09:02:40 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50288 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfGLNCj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jul 2019 09:02:39 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so8880721wml.0
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2019 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gfk3tzWXf4YoxNXS32QWXIth/W/aTkd2Ka3WZo9k3lQ=;
        b=goMsRLSkAkkOJTFTe1bd5PF9Wprg6v0Tj9DemBKBSfRydsuBRLbA6rQ/cvYahqNfTd
         vwWkJlvwSrNjX7tLb2tX46Ls1K8ZiAtjqWBd0pXUQ9IEjFLrszu/8r4yye47ZGuA46GS
         q2T9DqYUOHEi71QKV+/Xd0mF57fewN+QdeuXnymnRDqGoJm16FN2+AmObttjVK3X77/r
         tpNYRhzwpdNNTVUFZaysZYmW5gqX7QV2hpQGREyaXdybY8HCuR/potkyGb6fc1Fup5wt
         cACxQ0iahZoa0PzaU4b2Unca20/V88j15rcy7FpNnXvxuN9V57xmfq5EVuyO5r/LQCE5
         ZyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gfk3tzWXf4YoxNXS32QWXIth/W/aTkd2Ka3WZo9k3lQ=;
        b=hy29cIzJ43Rah18aCeggj9RulCjReIQB4JrL0/UdY22nMnmt+P/pqm8q6xALv2xZjV
         5uhdY257EZm3PfmDLlOEdcqyU8V2A+1QQLY0sGghkNhmYlyz/G56C9r1YwTkf4sC52Ju
         ud+zgDowVG67AM/YmLCUDhaCJ8mOF0buEJeCAs+ia3+Ra4iWVbq0xJnApMQ4mCP79Z7I
         VkBKUzjBYFsEKfZvohdCwINP97KukPfvanJDPkT7b6d69J3U025HvCAh9RCL7W8tve4f
         a/yx1fgvW2KloEW17xrD7GaQ4VrJbEPTga0pwMBiZhZmWW24GixdxKKtHlMCH+FxK9dH
         4kHg==
X-Gm-Message-State: APjAAAUdtO38nJAD9C6TLTKgF5J/MqQu1PjDLxSGV7MOA93jEUJi/13c
        lhfq4QXhgI0sQhC2t5d5sXw=
X-Google-Smtp-Source: APXvYqy+XIPsO3nSefTtw/VIT0Q1JEv+f8sHzOjftXxqvu8RDRt+41p8KAW+mPcR5sjMAEUHUs07cA==
X-Received: by 2002:a1c:ca06:: with SMTP id a6mr9871923wmg.48.1562936557894;
        Fri, 12 Jul 2019 06:02:37 -0700 (PDT)
Received: from brauner.io ([213.220.153.21])
        by smtp.gmail.com with ESMTPSA id i18sm9299673wrp.91.2019.07.12.06.02.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 06:02:37 -0700 (PDT)
Date:   Fri, 12 Jul 2019 15:02:36 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Message-ID: <20190712130235.2r4jlwpfffijz4hj@brauner.io>
References: <20190515131629.405837b0@canb.auug.org.au>
 <20190708120114.5ca1613d@canb.auug.org.au>
 <20190712125304.GC92297@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190712125304.GC92297@google.com>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 12, 2019 at 08:53:04AM -0400, Joel Fernandes wrote:
> On Mon, Jul 08, 2019 at 12:01:14PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Wed, 15 May 2019 13:16:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next merge of the akpm-current tree got a conflict in:
> > > 
> > >   include/linux/pid.h
> > > 
> > > between commit:
> > > 
> > >   51f1b521a515 ("pidfd: add polling support")
> > > 
> > > from the pidfd tree and commit:
> > > 
> > >   c02e28a1bb18 ("kernel/pid.c: convert struct pid:count to refcount_t")
> > > 
> > > from the akpm-current tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > > 
> > > diff --cc include/linux/pid.h
> > > index 1484db6ca8d1,0be5829ddd80..000000000000
> > > --- a/include/linux/pid.h
> > > +++ b/include/linux/pid.h
> > > @@@ -3,7 -3,7 +3,8 @@@
> > >   #define _LINUX_PID_H
> > >   
> > >   #include <linux/rculist.h>
> > >  +#include <linux/wait.h>
> > > + #include <linux/refcount.h>
> > >   
> > >   enum pid_type
> > >   {
> > 
> > I am still getting this conflict (the commits have changed).  Just a
> > reminder in case you think Linus may need to know.
> 
> Could you let me know if this trivial header inclusion conflict has been
> resolved now? Let me know what else I can do to help.

I've informed Linus about this conflict when I sent the PR and he has
pulled the tag which includes your polling changes. So it shouldn't
require you to do anything since the conflict is pretty trivial. :)
