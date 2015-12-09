From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Thu, 10 Dec 2015 09:20:25 +1100
Message-ID: <20151210092025.7c356624@canb.auug.org.au>
References: <20151209121916.1d4cdba4@canb.auug.org.au>
	<CAOg9mSRoyq-yYXh2RMicwvjVPF8EGN=XdvSfZPfbTP62B+szDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39335 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751324AbbLIWU1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2015 17:20:27 -0500
In-Reply-To: <CAOg9mSRoyq-yYXh2RMicwvjVPF8EGN=XdvSfZPfbTP62B+szDg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Marshall <hubcap@omnibond.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andreas Gruenbacher <agruenba@redhat.com>

Hi Mike,

On Wed, 9 Dec 2015 16:30:34 -0500 Mike Marshall <hubcap@omnibond.com> wrote:
>
> I'm having a chicken-and-egg moment here...

not really ...

> I think "posix acls: Remove duplicate xattr name definitions" got into
> linux-next after
> Linus committed  Linux 4.4-rc4.

Yes

> Unless I merge my for-next with Linus' tree at the current (arbitrary)
> point, I need to wait
> until I can merge with rc5 before I can apply this fix.
> 
> I know Linus hates to get pull requests for stuff that's not based on
> a discrete tag,
> I'm not sure what's appropriate for linux-next... ?

That commit is *not* in Linus' tree and won't be until the next merge
window.  There is nothing you can do about it until then.  I will carry
the merge resolution patch in linus-next and then someone needs to let
Linus know what needs to be done when the latter of the two trees is
merged into his.  This is pretty standard when there is a conflict like
this that cannot be automatically resolved by git.

OK, I wrote all that and then I realised that the preferred names
(XATTR_NAME_POSIX_ACL_..) have been in Linus' tree for a long time (in
include/uapi/linux/xattr.h), so you could just change the orangefs tree
to use those already. i.e. my patch should apply cleanly to the
orangefs tree and build and work correctly independently of the vfs
tree change (I think).

BTW, there is also a section just above the bit this patch affects that
could be removed completely (it has "#if 0" around it).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
