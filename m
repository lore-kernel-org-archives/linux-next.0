From: Jeff Layton <jlayton@poochiereds.net>
Subject: Re: linux-next: manual merge of the akpm tree with the wberr tree
Date: Tue, 01 Aug 2017 07:31:33 -0400
Message-ID: <1501587093.4702.6.camel@poochiereds.net>
References: <20170801154634.0a01acdc@canb.auug.org.au>
         <1501585159.4702.0.camel@poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:35156 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751615AbdHALbg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Aug 2017 07:31:36 -0400
Received: by mail-qk0-f180.google.com with SMTP id d145so7129044qkc.2
        for <linux-next@vger.kernel.org>; Tue, 01 Aug 2017 04:31:36 -0700 (PDT)
In-Reply-To: <1501585159.4702.0.camel@poochiereds.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, 2017-08-01 at 06:59 -0400, Jeff Layton wrote:
> On Tue, 2017-08-01 at 15:46 +1000, Stephen Rothwell wrote:
> > Hi Andrew,
> > 
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   include/linux/fs.h
> > 
> > between commit:
> > 
> >   9dcc0577f2a4 ("mm: remove optimizations based on i_size in mapping writeback waits")
> > 
> > from the wberr tree and patch:
> > 
> >   "mm: remove optimizations based on i_size in mapping writeback waits"
> > 
> > from the akpm tree.
> > 
> > I fixed it up (I just dropped the akpm tree patch) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> > 
> 
> I didn't realize that Andrew was going to pick that one up. I'll drop it
> from my tree.
> 
> Thanks!

Actually, I take it back. Jan had some comments about the commit message
and I'd like to revise this. Andrew, do you mind dropping this patch
instead?

Thanks,
-- 
Jeff Layton <jlayton@poochiereds.net>
