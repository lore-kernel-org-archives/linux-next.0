From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 10 Sep 2013 23:48:23 +0100
Message-ID: <20130910224823.GE13318@ZenIV.linux.org.uk>
References: <20130910143807.4c32d548e08d2184061f52cb@canb.auug.org.au>
 <20130910152753.662599171456233c5f91edb4@linux-foundation.org>
 <20130910222924.GB13318@ZenIV.linux.org.uk>
 <20130910153520.14e49cd32feb16d45eb8abac@linux-foundation.org>
 <20130910223624.GC13318@ZenIV.linux.org.uk>
 <20130910154116.cc4afe048213a779040ea3cc@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:59346 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230Ab3IJWs2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Sep 2013 18:48:28 -0400
Content-Disposition: inline
In-Reply-To: <20130910154116.cc4afe048213a779040ea3cc@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>

On Tue, Sep 10, 2013 at 03:41:16PM -0700, Andrew Morton wrote:

> Obtained from where?  There are a whole pile of fixes resulting from
> review and linux-next testing.  Are they included?

-next and yes.  The trivial ones - folded into the commits they are fixing
(I mean, ones directly following the commit being fixed).  The rest included
as individual commits.

I'm looking through the DCACHE_LRU_LIST mess right now...
