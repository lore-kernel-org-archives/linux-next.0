Return-Path: <SRS0=0/zj=VJ=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20D1C742BA
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 12:53:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86C6820863
	for <linux-next@archiver.kernel.org>; Fri, 12 Jul 2019 12:53:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="o/GSzzDe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfGLMxH (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 12 Jul 2019 08:53:07 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43732 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfGLMxG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 12 Jul 2019 08:53:06 -0400
Received: by mail-pg1-f196.google.com with SMTP id f25so4502754pgv.10
        for <linux-next@vger.kernel.org>; Fri, 12 Jul 2019 05:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HI/mPiOEky9IcN8kS3GAyMwb2WWtW08o4dxxmi5JJzQ=;
        b=o/GSzzDeFZJYGL8gC1qzeODGZyPyccRvW7WFIM/TBszKrfccscktOx80indrs2Th/Z
         1S1vbKvQi9JMqg6S8DlC6E4i6zdtuVIpyeTsUHzLx5RIhdjOMYmL4Z3a7NBwVlgy2G6n
         r3e7HUHLc562l0tosf3QIe438m3wAZfxGaB8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HI/mPiOEky9IcN8kS3GAyMwb2WWtW08o4dxxmi5JJzQ=;
        b=rS+wpB1hoDtAnIDEC3IzUkArZHuyhVSqY02yBIAnKVfsEjfsGhrJ8tyHv06rNfkNwU
         2FmDT46gd0JS2CU7m54cyCz/iNpN2KDrpfg1CIq64rrGYhYNjSI6OM2i0Fomd3OyXiaK
         VQF3C05HzSnVshJYLJT0LTFAZB2nMu6W5Y2nFm2oEmwZyFU90loqWCGICQWQfU3HAXtW
         YngQIp0sPkxq1jVk+Tj8TWaoqDAxeYRKXvovskz5EvTolOoJYZMQZ8PWo2dmJ9orElb0
         Pxhax9JBKEs+PcjVYYv7/R+6gPLE3ZQQ0LqWMA/n3AtMzyyrGy8N3ltToCsizUyA7yxY
         ODTw==
X-Gm-Message-State: APjAAAU8j2tbWA/4mqtdxHFRHlYHjsJki9ifWEYvYKb5A/FlptesO10J
        gXk/ApfsEvYnQsZwZcjMmbQ=
X-Google-Smtp-Source: APXvYqxx7zQ52H1iMObta5D8se4d9ugDoG5ANXfkkI6qD9dsi42nD4wX82aDi8zaB90MkhUWI+lYuw==
X-Received: by 2002:a17:90a:2023:: with SMTP id n32mr11133889pjc.3.1562935986173;
        Fri, 12 Jul 2019 05:53:06 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id o15sm10639138pgj.18.2019.07.12.05.53.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 05:53:05 -0700 (PDT)
Date:   Fri, 12 Jul 2019 08:53:04 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Message-ID: <20190712125304.GC92297@google.com>
References: <20190515131629.405837b0@canb.auug.org.au>
 <20190708120114.5ca1613d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708120114.5ca1613d@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 08, 2019 at 12:01:14PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 15 May 2019 13:16:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   include/linux/pid.h
> > 
> > between commit:
> > 
> >   51f1b521a515 ("pidfd: add polling support")
> > 
> > from the pidfd tree and commit:
> > 
> >   c02e28a1bb18 ("kernel/pid.c: convert struct pid:count to refcount_t")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc include/linux/pid.h
> > index 1484db6ca8d1,0be5829ddd80..000000000000
> > --- a/include/linux/pid.h
> > +++ b/include/linux/pid.h
> > @@@ -3,7 -3,7 +3,8 @@@
> >   #define _LINUX_PID_H
> >   
> >   #include <linux/rculist.h>
> >  +#include <linux/wait.h>
> > + #include <linux/refcount.h>
> >   
> >   enum pid_type
> >   {
> 
> I am still getting this conflict (the commits have changed).  Just a
> reminder in case you think Linus may need to know.

Could you let me know if this trivial header inclusion conflict has been
resolved now? Let me know what else I can do to help.

