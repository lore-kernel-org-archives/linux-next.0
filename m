From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 14:30:04 -0700
Message-ID: <7vtxog5msj.fsf@alter.siamese.dyndns.org>
References: <20130312100950.e45ef0e721492ff0d5fd7c8d@canb.auug.org.au>
 <alpine.LRH.2.02.1303121510270.25612@tundra.namei.org>
 <20130312041641.GE18595@thunk.org>
 <CA+55aFzFLDcN-1GKae6Xqrns59K1xOD_HPzuv2Lv1__fZpqFMw@mail.gmail.com>
 <20130312212027.GE14792@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from b-pb-sasl-quonix.pobox.com ([208.72.237.35]:43565 "EHLO
	smtp.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932707Ab3CLVaH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Mar 2013 17:30:07 -0400
In-Reply-To: <20130312212027.GE14792@thunk.org> (Theodore Ts'o's message of
 "Tue, 12 Mar 2013 17:20:27 -0400")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

Theodore Ts'o <tytso@mit.edu> writes:

> What if we added the ability to do something like this:
>
> [remote "origin"]
> 	url = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> 	fetch = +refs/heads/master:refs/heads/master
> 	mergeoptions = --ff-only
>
> This would be an analog to branch.<name>.mergeoptions, but it would
> apply to the source of the pull request, instead of the destination.
>
> That way, people who do a "git pull" from Linus's tree would get the
> protection of --ff-only, while pulls from submaintainer trees would
> automatically get a merge commit, which is what we want.
>
> It doesn't handle the case of a submaintainer pulling from a
> maintainer in a back-merge scenario, but that should be a pretty rare
> case, so maybe that's OK.

Is there an escape hatch for that rare case?  IOW, how does a
submaintainer who configured the above to override --ff-only?
