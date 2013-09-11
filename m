From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 10 Sep 2013 17:01:23 -0700
Message-ID: <CA+55aFwMdZAVJLakx=xxY2QXaRdOxaPGMttU=P=2tH6+RNJeog@mail.gmail.com>
References: <20130910143807.4c32d548e08d2184061f52cb@canb.auug.org.au>
	<20130910152753.662599171456233c5f91edb4@linux-foundation.org>
	<20130910222924.GB13318@ZenIV.linux.org.uk>
	<20130910153520.14e49cd32feb16d45eb8abac@linux-foundation.org>
	<20130910223624.GC13318@ZenIV.linux.org.uk>
	<20130910154116.cc4afe048213a779040ea3cc@linux-foundation.org>
	<20130910224823.GE13318@ZenIV.linux.org.uk>
	<20130910225934.GF13318@ZenIV.linux.org.uk>
	<CA+55aFwXXsk47WrAqF6yuVXOQHuNpxT7x-=MmLsNBptyzjH1zQ@mail.gmail.com>
	<20130910235349.GG13318@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:48812 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750971Ab3IKABY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Sep 2013 20:01:24 -0400
In-Reply-To: <20130910235349.GG13318@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Chinner <dchinner@redhat.com>, Glauber Costa <glommer@openvz.org>

On Tue, Sep 10, 2013 at 4:53 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> list_lru_add() can fail if it's already on the list; leaving the counter
> alone should've been conditional on that, setting the flag - no.  Said
> that, it probably should be WARN_ON(!...); this_cpu_inc(); ... |= ...;

That WARN_ON_(!..) might indeed be better (maybe just WARN_ON_ONCE())..

That DCACHE_LRU_LIST bit needs to be coherent with "the dentry->d_lru
entry is on _some_ list" (whether it's the dentry one or the shrinker
one), so if that list_lru_add() ever fails, that would be a sign of
badness.

And that whole function is very performance-critical, to the point
where we not only don't want to call down to list_lry_add(), we don't
even want to touch the d_lru list entry itself to even _look_ if it's
empty or not, because that will take a cache miss. Which was obviously
the whole reason for that DCACHE_LRU_LIST bit existing...

           Linus
