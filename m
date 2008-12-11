From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the audit tree
Date: Thu, 11 Dec 2008 06:31:38 +0000
Message-ID: <20081211063138.GP28946@ZenIV.linux.org.uk>
References: <1228935701.3524.3.camel@localhost.localdomain> <20081209175726.682d77cd.sfr@canb.auug.org.au> <13157.1228935509@redhat.com> <13530.1228937583@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:39995 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750990AbYLKGbt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Dec 2008 01:31:49 -0500
Content-Disposition: inline
In-Reply-To: <13530.1228937583@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Eric Paris <eparis@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Serge Hallyn <serue@us.ibm.com>

On Wed, Dec 10, 2008 at 07:33:03PM +0000, David Howells wrote:
> Eric Paris <eparis@redhat.com> wrote:
> 
> > I think David is right, all the conflicts should come from
> > security-testing.  Al does have other good stuff in his tree though, Al
> > do you want to just kick all of my patches out?
> 
> Maybe it's worth James taking Al's changes into his tree and resolving all the
> conflicts in favour of what's in his tree.

It's already done.  Everything that used to be in for-linus except
tty_audit.c one went into mainline; tty_audit got rediffed and sent
to James; for-linus..for-next had several Eric's patches that were
in security tree (and thus are dropped from audit one - I couldn't
care less which tree are they merged from as long as they get into
the mainline) and an s390 patch that got sent off to linux-s390@vger
and would be better off going via the s390 tree anyway.

So at this point everything in that branch is taken care of.  I do have
several more in a private queue, but those will need review and testing
before they go into -next.
