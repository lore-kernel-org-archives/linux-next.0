From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the s5p tree
Date: Tue, 3 Jan 2012 08:28:44 -0800
Message-ID: <20120103162844.GA26265@kroah.com>
References: <20120103180854.e9bff732db50c0fa9afd2967@canb.auug.org.au>
 <010601ccc9ef$7e784640$7b68d2c0$%kim@samsung.com>
 <CA+55aFzuEP7poPj_TiC28+T7Xn-6G1Lydt=q5FMVTj_XhOVf3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:43936 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754038Ab2ACQ2z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Jan 2012 11:28:55 -0500
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 90CB220B8F
	for <linux-next@vger.kernel.org>; Tue,  3 Jan 2012 11:28:54 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <CA+55aFzuEP7poPj_TiC28+T7Xn-6G1Lydt=q5FMVTj_XhOVf3w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 03, 2012 at 08:20:20AM -0800, Linus Torvalds wrote:
> On Tue, Jan 3, 2012 at 12:12 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> >
> > OK, I see. Firstly, I will rebase my for-next as per your suggestion. As you
> > know, I just wanted to avoid known conflicts with driver-core tree.
> 
> Please, in general you should *not* rebase on top of other peoples
> trees either. What's the conflict and why do you need that other tree
> in the first place?

There's lots of merge conflicts with the driver-next tree due to some
changes we made there.  We'll work them out before they get pushed to
your tree.

thanks,

greg k-h
