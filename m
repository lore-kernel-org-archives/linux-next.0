From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: unneeded merge in the security tree
Date: Tue, 12 Mar 2013 17:20:27 -0400
Message-ID: <20130312212027.GE14792@thunk.org>
References: <20130312100950.e45ef0e721492ff0d5fd7c8d@canb.auug.org.au>
 <alpine.LRH.2.02.1303121510270.25612@tundra.namei.org>
 <20130312041641.GE18595@thunk.org>
 <CA+55aFzFLDcN-1GKae6Xqrns59K1xOD_HPzuv2Lv1__fZpqFMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from li9-11.members.linode.com ([67.18.176.11]:52956 "EHLO
	imap.thunk.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755682Ab3CLVUe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Mar 2013 17:20:34 -0400
Content-Disposition: inline
In-Reply-To: <CA+55aFzFLDcN-1GKae6Xqrns59K1xOD_HPzuv2Lv1__fZpqFMw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Git Mailing List <git@vger.kernel.org>, Junio C Hamano <gitster@pobox.com>

What if we added the ability to do something like this:

[remote "origin"]
	url = git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
	fetch = +refs/heads/master:refs/heads/master
	mergeoptions = --ff-only

This would be an analog to branch.<name>.mergeoptions, but it would
apply to the source of the pull request, instead of the destination.

That way, people who do a "git pull" from Linus's tree would get the
protection of --ff-only, while pulls from submaintainer trees would
automatically get a merge commit, which is what we want.

It doesn't handle the case of a submaintainer pulling from a
maintainer in a back-merge scenario, but that should be a pretty rare
case, so maybe that's OK.

      	     	       	   	- Ted
