From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: manual merge of the ide tree
Date: Thu, 17 Jul 2008 17:30:04 +0200
Message-ID: <200807171730.04634.bzolnier@gmail.com>
References: <20080716150528.a350b196.sfr@canb.auug.org.au> <20080717134055.1d087d83.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.189]:42332 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353AbYGQPci (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 11:32:38 -0400
Received: by mu-out-0910.google.com with SMTP id w8so226260mue.1
        for <linux-next@vger.kernel.org>; Thu, 17 Jul 2008 08:32:37 -0700 (PDT)
In-Reply-To: <20080717134055.1d087d83.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


Hi,

On Thursday 17 July 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> On Wed, 16 Jul 2008 15:05:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the ide tree got a conflict in lots of files
> > because all of the changes that have been merged into Linus' tree are
> > common, but followed by further changes in the ide tree to the same
> > regions of some files.
> 
> Same thing today.  I used the ide tree's version of the files.

No wonder about that since there were another push to Linus
(you were on cc: as usual). ;-)

IIRC previously this shouldn't have been a problem, did something
change (i.e. BASE tag) in linux-next w.r.t. handling quilt trees?

Thanks,
Bart
