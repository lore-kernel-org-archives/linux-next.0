From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: add Docs git tree to linux-next
Date: Thu, 5 May 2011 14:02:16 -0700
Message-ID: <20110505140216.3d5f9bf4.rdunlap@xenotime.net>
References: <20110427200424.c1f0858f.rdunlap@xenotime.net>
	<20110428162541.9812f16c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy2-pub.bluehost.com ([67.222.39.60]:38352 "HELO
	oproxy2-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751297Ab1EEVCS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 May 2011 17:02:18 -0400
In-Reply-To: <20110428162541.9812f16c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Thu, 28 Apr 2011 16:25:41 +1000 Stephen Rothwell wrote:

> Hi Randy,
> 
> On Wed, 27 Apr 2011 20:04:24 -0700 Randy Dunlap <rdunlap@xenotime.net> wrote:
> >
> > Please add this git tree to linux-next:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/rdunlap/linux-docs/
> > branch "docs-move"

Hey Stephen,

I changed the git repo name in accordance with
https://korg.wiki.kernel.org/index.php/Userdoc:welcomemail#Cloning, so please use

git://git.kernel.org/pub/scm/linux/kernel/git/rdunlap/linux-docs.git
branch "docs-move"

Thanks.  Sorry about the change.


> Done.
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.
> 
> -- 
> Cheers,
> Stephen Rothwell 
> sfr@canb.auug.org.au
> 
> Legal Stuff:
> By participating in linux-next, your subsystem tree contributions are
> public and will be included in the linux-next trees.  You may be sent
> e-mail messages indicating errors or other issues when the
> patches/commits from your subsystem tree are merged and tested in
> linux-next.  These messages may also be cross-posted to the linux-next
> mailing list, the linux-kernel mailing list, etc.  The linux-next tree
> project and IBM (my employer) make no warranties regarding the linux-next
> project, the testing procedures, the results, the e-mails, etc.  If you
> don't agree to these ground rules, let me know and I'll remove your tree
> from participation in linux-next.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
