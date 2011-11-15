From: Greg KH <greg@kroah.com>
Subject: Re: New Char/Misc tree to be added to linux-next
Date: Mon, 14 Nov 2011 22:01:02 -0800
Message-ID: <20111115060102.GA29942@kroah.com>
References: <20111115001419.GA31817@kroah.com>
 <20111115125939.dd90968640fc7c50bd9a4c77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:53109 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751163Ab1KOGCG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Nov 2011 01:02:06 -0500
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 524DD211ED
	for <linux-next@vger.kernel.org>; Tue, 15 Nov 2011 01:02:06 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111115125939.dd90968640fc7c50bd9a4c77@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 15, 2011 at 12:59:39PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> On Mon, 14 Nov 2011 16:14:19 -0800 Greg KH <greg@kroah.com> wrote:
> >
> > Arnd and I are going to maintain the drivers/char/* and drivers/misc/*
> > directories with the goal of getting them under control, or at least a
> > false-sense of control :)
> > 
> > So could you please add my new git tree:
> > 	git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> > 
> > which contains the two branches, "char-misc-linus" to hold patches to
> > send to Linus for this merge window, and "char-misc-next" to hold
> > patches for the next merge window.
> 
> OK, I will add this tree tomorrow with you and Arnd as contacts.  [Aside:
> did you consider naming the branches merely "fixes" (or something) and
> "next"?]

I was using the same branch naming that I used for my other trees.  If
that's unwieldy, I can easily change them, just let me know, but I would
like to be consistant across all of my trees for the sake of my muscle
memory, and my helper-scripts.

thanks,

greg k-h
