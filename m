From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 09:24:55 -0400
Message-ID: <20160315132455.GN17923@kvack.org>
References: <20160314153214.41d7c2fe@canb.auug.org.au> <20160314073523.GA16639@lst.de> <20160314152438.GG17923@kvack.org> <20160315053533.GH17997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:60083 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932449AbcCONY4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 09:24:56 -0400
Content-Disposition: inline
In-Reply-To: <20160315053533.GH17997@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 15, 2016 at 05:35:33AM +0000, Al Viro wrote:
> On Mon, Mar 14, 2016 at 11:24:38AM -0400, Benjamin LaHaise wrote:
> > On Mon, Mar 14, 2016 at 08:35:23AM +0100, Christoph Hellwig wrote:
> > > The aio changes have either been reviewed negatively or not at all.  That 
> > > tree should be dropped.
> > 
> > That isn't solely your decision.  If you have comments, please provide 
> > constructive feedback, as there are users and use-cases that need this 
> > kind of functionality.
> 
> "This kind of functionality" being what, exactly?  Bypassing code review?
> It's not that you've made trivial mistakes; everyone does from time to time.
> But failing to post patches with non-trivial interactions outside of the
> subsystem you are familiar with (be it on fsdevel or privately to people who
> work with the areas involved) *AND* failing to recognize that the lack
> of review might be a problem even after having been explicitly told so...

I'm not bypassing code review.  The code was sent out back in January, 
you were cc'd on it and has been waiting for you to provide some feedback 
on the mailing lists, which you haven't done until yesterday.  Given that 
review has not occurred, I fully well don't expect this series to be 
merged until further work is done.

> For fuck sake, you should know better.  You are not a newbie with a pet set
> of half-baked patches for his pet application, refering to (unspecified)
> "users that need this kind of functionality" and getting very surprised when
> those mean, rude folks on development lists inform them that code review is
> more than just a good idea.

No, my comment was based on HCH essentially saying that exposure in 
linux-next is a bad thing and the tree should be removed.  Quite the 
opposite -- it's useful in that it lets people see what is going on and 
lets me know about conflicts with other work.  Removing the tree from 
linux-next gets rid of those benefits, and that is what I was objecting 
to.  Fwiw, I don't think someone should have a veto over what goes in 
linux-next.  People should provide feedback, not a blanket "drop that".

		-ben
-- 
"Thought is the essence of where you are now."
