From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 12 Jan 2017 15:33:53 -0800
Message-ID: <20170112153353.dfb923ac309edca685378444@linux-foundation.org>
References: <20170112144933.7f161c69@canb.auug.org.au>
        <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:53124 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbdALXdz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2017 18:33:55 -0500
In-Reply-To: <8af7e322-9d1f-112e-3ab3-b8b310939d6f@suse.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Ren <zren@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 12 Jan 2017 13:06:01 +0800 Eric Ren <zren@suse.com> wrote:

> On 01/12/2017 11:49 AM, Stephen Rothwell wrote:
> > Hi Andrew,
> >
> > After merging the akpm tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >
> > In file included from fs/ocfs2/file.c:49:0:
> > fs/ocfs2/file.c: In function 'ocfs2_permission':
> > fs/ocfs2/dlmglue.h:189:29: error: inlining failed in call to always_inline 'ocfs2_is_locked_by_me': function body not available
> >   inline struct ocfs2_holder *ocfs2_is_locked_by_me(struct ocfs2_lock_res *lockres);
> >                               ^
> > fs/ocfs2/file.c:1345:16: error: called from here
> >    has_locked = (ocfs2_is_locked_by_me(lockres) != NULL);
> >                  ^
> ...
> >
> > Caused by commits
> >
> >    984c4659d463 ("ocfs2/dlmglue: prepare tracking logic to avoid recursive cluster lock")
> >    0ca17730270e ("ocfs2: fix deadlocks when taking inode lock at vfs entry points")
> >

(top-posting repaired.  Please don't do that)

> Hi  Stephen,
> 
> Thanks for your report and the fix for it. The 0-day project has reported several days ago,
> but this patch set is still in discussion, so I am waiting for more days to see if  other 
> developers
> have any other questions.
> 
> I am confused that how to deal with your patch if I need to work out the V2 patch set. Perhaps,
> pick up your fix and  add your efforts in the change log?
> 

I'll drop

ocfs2-dlmglue-prepare-tracking-logic-to-avoid-recursive-cluster-lock.patch
and
ocfs2-fix-deadlocks-when-taking-inode-lock-at-vfs-entry-points.patch
