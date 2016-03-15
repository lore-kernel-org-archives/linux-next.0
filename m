From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 05:35:33 +0000
Message-ID: <20160315053533.GH17997@ZenIV.linux.org.uk>
References: <20160314153214.41d7c2fe@canb.auug.org.au>
 <20160314073523.GA16639@lst.de>
 <20160314152438.GG17923@kvack.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:48354 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752709AbcCOFfg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2016 01:35:36 -0400
Content-Disposition: inline
In-Reply-To: <20160314152438.GG17923@kvack.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin LaHaise <bcrl@kvack.org>
Cc: Christoph Hellwig <hch@lst.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 14, 2016 at 11:24:38AM -0400, Benjamin LaHaise wrote:
> On Mon, Mar 14, 2016 at 08:35:23AM +0100, Christoph Hellwig wrote:
> > The aio changes have either been reviewed negatively or not at all.  That 
> > tree should be dropped.
> 
> That isn't solely your decision.  If you have comments, please provide 
> constructive feedback, as there are users and use-cases that need this 
> kind of functionality.

"This kind of functionality" being what, exactly?  Bypassing code review?
It's not that you've made trivial mistakes; everyone does from time to time.
But failing to post patches with non-trivial interactions outside of the
subsystem you are familiar with (be it on fsdevel or privately to people who
work with the areas involved) *AND* failing to recognize that the lack
of review might be a problem even after having been explicitly told so...

For fuck sake, you should know better.  You are not a newbie with a pet set
of half-baked patches for his pet application, refering to (unspecified)
"users that need this kind of functionality" and getting very surprised when
those mean, rude folks on development lists inform them that code review is
more than just a good idea.
