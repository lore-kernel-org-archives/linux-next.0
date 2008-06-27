From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: gfs2 tree build failure
Date: Fri, 27 Jun 2008 10:48:41 +0100
Message-ID: <1214560121.3469.1.camel@localhost.localdomain>
References: <20080627151225.1fe44918.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:43410 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751573AbYF0Juj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 05:50:39 -0400
In-Reply-To: <20080627151225.1fe44918.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi,

On Fri, 2008-06-27 at 15:12 +1000, Stephen Rothwell wrote:
> Hi Steven,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "gdlm_release_all_locks" [fs/gfs2/locking/dlm/lock_dlm.ko] undefined!
> 
> Commit 98ea8e79ff4dfa804690831248881fa6b2145978 ("[GFS2] Remove all_list
> from lock_dlm") missed one call site of the gdlm_release_all_locks
> function which it removed.  It also neglected to remove the declaration
> of that function from fs/gfs2/locking/dlm/lock_dlm.h. I have reverted
> that commit.
> 
> Sorry, Steven, but I don't see how that could have been build tested ...
> please take a little more care.
> 

Sorry. I've just pushed a fix to that. I'm not sure how that slipped
through other than to say that it did build (I just tried it) so that is
why it wasn't spotted,

Steve.
