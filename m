From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: unnecessary merge in the ubifs tree
Date: Thu, 26 Mar 2015 09:13:11 +0200
Message-ID: <1427353991.30360.87.camel@sauron.fi.intel.com>
References: <20150326113217.580fe7e8@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:2596 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750881AbbCZHNU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Mar 2015 03:13:20 -0400
In-Reply-To: <20150326113217.580fe7e8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-03-26 at 11:32 +1100, Stephen Rothwell wrote:
> Hi Artem,
> 
> I noticed merge commit 3527a86b7ae1 ("Merge tag 'v4.0-rc5' into
> linux-next").  Just a note that if you had merged the commit that the
> tag points to, you would have just had a fast forward instead of a
> "real" merge.  Merging the tag forces the --no-ff flag on git merge
> (and adding --ff does not change that).  You could have merged
> "v4.0-rc5^0" (I think) or (apparently) pass --ff-only to get the fast
> forward.

You are right, and thank you for telling about this. I hope Linus won't
flame me for this. I'll definitely keep this in mind next time.

Artem.
