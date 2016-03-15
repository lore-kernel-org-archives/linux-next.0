From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 05:07:12 +0000
Message-ID: <20160315050712.GF17997@ZenIV.linux.org.uk>
References: <20160315150640.02a4db30@canb.auug.org.au>
 <20160315043448.GE17997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:48271 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751259AbcCOFHR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Mar 2016 01:07:17 -0400
Content-Disposition: inline
In-Reply-To: <20160315043448.GE17997@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Tue, Mar 15, 2016 at 04:34:48AM +0000, Al Viro wrote:

> Incidentally, why the hell has that thing never landed in my mailbox?  Not
> directly, not Cc'd, not via fsdevel either.
> 
> Ben, what the fuck going on?  OK, you don't feel necessary to mention
> that to me (or have me take a look through it).  Your business.  You also
> don't bother to bring it on fsdevel.  Again, your estimates of the
> usefulness of said list and review there are your business.  But it looks
> like you also do not bother to check what has landed in the mainline two
> months ago.  WTF?

While we are at it, aio.git commit in question is crap anyway.  What is the
semantics of that LOOKUP_NONBLOCK thing and what makes you think that
it will *not* block prior to reaching do_last()?  LOOKUP_RCU that was
originally there?  Sorry, wrong.  RCU pathwalk will happily fall back to
non-RCU one if it can do so without restart from scratch.  And proceed
to lock directories, hit the disk over nbd over wet string, do automounts,
etc.  Anything and everything.  IOW, this is complete BS and had been such
for at least ~5 years.

There *is* a reason for code review.  Or, at least, asking somebody familiar
with the code you are working with whether some assumption you are making
is true or false.  Me, for example, in our conversation regarding earlier parts
of aio.git queue about a week ago.  Or at any other point.

						Al "Really annoyed" Viro
