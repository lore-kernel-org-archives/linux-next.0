From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the tests tree
Date: Wed, 5 Nov 2008 07:06:31 +0100
Message-ID: <20081105060631.GA17079@uranus.ravnborg.org>
References: <20081015170503.1130c183.sfr@canb.auug.org.au> <20081105135211.52bbbd8d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:54453 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbYKEGIQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Nov 2008 01:08:16 -0500
Content-Disposition: inline
In-Reply-To: <20081105135211.52bbbd8d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org

On Wed, Nov 05, 2008 at 01:52:11PM +1100, Stephen Rothwell wrote:
> Hi Ananth,
> 
> On Wed, 15 Oct 2008 17:05:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the tests tree got a conflicts in lib/Kconfig.debug.
> > 
> > You need to determine if this tree is ever going to be merged into Linus'
> > tree.  I am going to drop it until you decide.
> 
> Given the discussion, I am dropping the tests tree until something is
> decided.  (in which case, I assume the tree will have its conflicts with
> Linus' tree fixed up)

Agreed. We can revisit this when we have a proper framework to execute
small user space test programs.

Ananth - thanks for your effort but I will drop the tree too.

	Sam
