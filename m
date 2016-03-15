From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: linux-next: manual merge of the aio tree with the vfs tree
Date: Tue, 15 Mar 2016 09:12:44 -0400
Message-ID: <20160315131244.GM17923@kvack.org>
References: <20160315150640.02a4db30@canb.auug.org.au> <20160315043448.GE17997@ZenIV.linux.org.uk> <20160315050712.GF17997@ZenIV.linux.org.uk> <20160315051939.GG17997@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:60075 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751615AbcCONMt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Mar 2016 09:12:49 -0400
Content-Disposition: inline
In-Reply-To: <20160315051939.GG17997@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org

On Tue, Mar 15, 2016 at 05:19:39AM +0000, Al Viro wrote:
> On Tue, Mar 15, 2016 at 05:07:12AM +0000, Al Viro wrote:
> 
> > There *is* a reason for code review.  Or, at least, asking somebody familiar
> > with the code you are working with whether some assumption you are making
> > is true or false.  Me, for example, in our conversation regarding earlier parts
> > of aio.git queue about a week ago.  Or at any other point.
> 
> While we are at it, 150a0b49 ("aio: add support for async openat()") is also
> crap.  fs_struct and files_struct is nowhere near enough.  And yes, I realize
> that your application probably doesn't step into it.  Which means that these
> patches are just fine for your private kernel.  _Not_ for mainline.
> 
> Reviewed-and-NAKed-by: Al Viro <viro@zeniv.linux.org.uk>

You've had two months to make this comment, so I'm glad you've finally 
done so.

		-ben
-- 
"Thought is the essence of where you are now."
