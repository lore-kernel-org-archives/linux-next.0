From: Theodore Tso <tytso@mit.edu>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Tue, 10 Jun 2008 18:52:22 -0400
Message-ID: <20080610225222.GG8397@mit.edu>
References: <20080610190540.GA25066@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.church-of-our-saviour.org ([69.25.196.31]:50147 "EHLO
	thunker.thunk.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752444AbYFJWwc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Jun 2008 18:52:32 -0400
Content-Disposition: inline
In-Reply-To: <20080610190540.GA25066@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Jun 10, 2008 at 12:05:40PM -0700, Greg KH wrote:
> PURPOSE
> 
> The linux-staging tree was created to hold drivers and filesystems and
> other semi-major additions to the Linux kernel that are not ready to be
> merged at this point in time.  It is here for companies and authors to
> get a wider range of testing, and to allow for other members of the
> community to help with the development of these features for the
> eventual inclusion into the main kernel tree.
> 
> This tree will be included in the daily linux-next builds, and will get
> testing by all users of that tree.

Does this mean that the nature of linux-next is changing?  I thought
the whole point of linux-next was only to have what would be pushed to
Linus in the near future, so we could check for patch compatibility
issues.  For that reason, for example, I don't push the unstable set
of patches in the ext4 tree to linux-next, since they aren't ready for
merging yet in their current form.  

But if linux-staging is going to be pushed to linux-next, doesn't that
violate the ground rules of Linux-next?  Or are we allowing in this
case because these are filesystems and/or device drivers that don't
exist at all in the mainline tree yet?

						- Ted

