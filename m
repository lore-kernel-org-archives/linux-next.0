From: Mike Marshall <hubcap@omnibond.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 10 Dec 2015 10:44:02 -0500
Message-ID: <CAOg9mSQDR4cS5tTTiPigjLi1o9g0L9rAanUsk0pFPQ22_hGFmA@mail.gmail.com>
References: <20151210111847.07db6062@canb.auug.org.au>
	<20151210112322.16081535@canb.auug.org.au>
	<20151210004851.GB20997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:34469 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753953AbbLJPoE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Dec 2015 10:44:04 -0500
Received: by lbbcs9 with SMTP id cs9so53584386lbb.1
        for <linux-next@vger.kernel.org>; Thu, 10 Dec 2015 07:44:02 -0800 (PST)
In-Reply-To: <20151210004851.GB20997@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

 > Said that, there is an unpleasant bug in that area - link_target of a live
 > inode can be overwritten, right under the pathname resolution walking the
 > old contents of that thing

Figuring that out is on the list. This week I've been working on cleaning up
orangefs_devreq_writev, and Martin even has a version that changes
the protocol where userspace uses write instead of writev, getting rid
of the 4-or-5 iovec scheme Al hates. If he still hates it after the code
is readable, we'll probably go that direction...

And we have an infant fuzzer that we've already crashed the kernel with (and
made an easy and good fix, I think).

And also this week I have tried to address Linus' concerns about our
old fashioned waiting scheme where we used add_wait_queue and
set_current_state instead of the wait_event() model.

Yi Liu who is also working with us on this project has provided a patch
that changes all the pvfs2 occurrences to orangefs.

These patches will be in our kernel.org tree very soon I hope,
but we won't be done yet...

-Mike "you're never done..."

On Wed, Dec 9, 2015 at 7:48 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Thu, Dec 10, 2015 at 11:23:22AM +1100, Stephen Rothwell wrote:
>> [Just adding the origefs maintainer to the cc list]
>> > -static const char *pvfs2_follow_link(struct dentry *dentry, void **cookie)
>> > +static const char *pvfs2_get_link(struct dentry *dentry, struct inode *inode,
>> > +                             void **cookie)
>> >  {
>> > -   char *target =  PVFS2_I(dentry->d_inode)->link_target;
>
> Better fix is to have inode->link = PVFS2_I(dentry->d_inode)->link_target;
> when we set the latter and use .get_link = simple_get_link...
>
> Said that, there is an unpleasant bug in that area - link_target of a live
> inode can be overwritten, right under the pathname resolution walking the
> old contents of that thing.
>
> copy_attributes_to_inode() is triggered by ->d_revalidate() and by ->getattr()
> and it's really, really unsafe for a live inode.  Just look what it does
> to ->i_mode...  Sure, normally a server won't return different symlink bodies
> on subsequent getattr requests.  As long as it's sane (and not compromised,
> etc.), but relying upon that is not a good idea.
