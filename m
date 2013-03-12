From: Junio C Hamano <gitster@pobox.com>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 13:02:19 -0700
Message-ID: <7vobeo75f8.fsf@alter.siamese.dyndns.org>
References: <20130312100950.e45ef0e721492ff0d5fd7c8d@canb.auug.org.au>
 <alpine.LRH.2.02.1303121510270.25612@tundra.namei.org>
 <20130312041641.GE18595@thunk.org>
 <CA+55aFzFLDcN-1GKae6Xqrns59K1xOD_HPzuv2Lv1__fZpqFMw@mail.gmail.com>
 <7vsj40760d.fsf@alter.siamese.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from b-pb-sasl-quonix.pobox.com ([208.72.237.35]:42864 "EHLO
	smtp.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755533Ab3CLUCW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Mar 2013 16:02:22 -0400
In-Reply-To: <7vsj40760d.fsf@alter.siamese.dyndns.org> (Junio C. Hamano's
 message of "Tue, 12 Mar 2013 12:49:38 -0700")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Theodore Ts'o <tytso@mit.edu>, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>

Junio C Hamano <gitster@pobox.com> writes:

> Then under the "--no-ff activates the magic" rule:
>
> 	git merge v3.9-rc2
>
> will fast-forward, but this
>
> 	git merge --no-ff v3.9-rc2
>
> creates a real merge with the "mergetag" signature block.  The one
> that caused trouble in the "security tree", i.e.
>
>         git pull linus v3.9-rc2
>
> or its equivalent
>
>         git fetch linus v3.9-rc2
>         git merge FETCH_HEAD
>
> would still fast-forward under this rule.  The maintainer needs to
> do
>
> 	git pull --no-ff git://git.kernel.org/... for-linus
>
> if the pull could fast-forward under this rule, though.

Scratch the last sentence.  It should have been

"whether the pull fast-forwards or not".  You'd always need to.
