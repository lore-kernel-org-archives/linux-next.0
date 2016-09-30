From: Ian Kent <raven@themaw.net>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 userns tree
Date: Fri, 30 Sep 2016 17:48:03 +0800
Message-ID: <1475228883.3102.11.camel@themaw.net>
References: <20160930174210.7e71aee4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:40325 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932413AbcI3J6P (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Sep 2016 05:58:15 -0400
In-Reply-To: <20160930174210.7e71aee4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2016-09-30 at 17:42 +1000, Stephen Rothwell wrote:
> Hi Andrew,

Hi Stephen,

> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/mount.h
> 
> between commit:
> 
>   312ddcb332c3 ("mnt: Add a per mount namespace limit on the number of
> mounts")
> 
> from the userns tree and commit:
> 
>   a0461d15d75c ("vfs: make is_local_mountpoint() usable by others")
> 
> from the akpm-current tree.

Yes, this is a problem.

There is a fundamental flaw in the series surrounding commit a0461d15d75c.

In discussion with Eric it was decided a different approach was needed and I'm
holding back on posting an updated series because I was worried something like
this might happen and didn't want to make matters worse.

I definitely don't want this series to go to the Linus tree and it would be
great if you could drop it from the next tree. Eric's patch should then apply
without change.

I had asked Andrew to drop the series but he must have missed my request.

And I thought they had already been dropped but I must have been looking at an
incorrect branch. I'll need to look at the akpm repo. again.

In the meantime all I can offer is the patch names corresponding to the
descriptions.

They are:
fs-make-is_local_mountpoint-usable-by-others.patch
fs-add-have_local_submounts.patch
autofs-make-mountpoint-checks-namespace-aware.patch
fs-remove-unused-have_submounts-function.patch

Sorry for the inconvenience.
Ian

> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
