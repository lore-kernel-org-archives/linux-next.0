From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: Re-add ibft tree to linux-next please
Date: Mon, 12 Dec 2011 18:10:54 -0500
Message-ID: <20111212231054.GA14439@phenom.dumpdata.com>
References: <20111212145330.GA16278@andromeda.dapyr.net>
 <20111213094419.4c0ea2403c6d09751612892a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:43809 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752137Ab1LLXLz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2011 18:11:55 -0500
Content-Disposition: inline
In-Reply-To: <20111213094419.4c0ea2403c6d09751612892a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, pjones@redhat.com

On Tue, Dec 13, 2011 at 09:44:19AM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> On Mon, 12 Dec 2011 10:53:30 -0400 Konrad Rzeszutek Wilk <konrad@kernel.org> wrote:
> >
> > I've one patch for the iBFT and since I am the co-maintainer of said tree,
> > please add this tree to your awesome build system:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/konrad/ibft.git
> > 
> > The branch is "linux-next"
> 
> OK, I have added that from today.  There is currently nothing in that
> branch, right?

Yup. I want to shakedown the patches first in my #testing on first so that
you aren't hit with any compile errors.

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
