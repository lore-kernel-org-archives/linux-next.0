From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree
Date: Wed, 10 Dec 2008 14:01:41 -0500
Message-ID: <1228935701.3524.3.camel@localhost.localdomain>
References: <20081209175726.682d77cd.sfr@canb.auug.org.au>
	 <13157.1228935509@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:34923 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756863AbYLJTBw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 14:01:52 -0500
In-Reply-To: <13157.1228935509@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Serge Hallyn <serue@us.ibm.com>

On Wed, 2008-12-10 at 18:58 +0000, David Howells wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the audit tree got a lot of conflict in
> > include/linux/audit.h, kernel/auditsc.c, kernel/capability.c and
> > security/commoncap.c against commits in the security-testing tree.
> > 
> > Its not obvious how to resolve these, so can you, Eric, James and Dave
> > have a conversation and see what you can come up with.  Some will be
> > easy, but there are several overlapping changes here.
> > 
> > Looking harder, it looks like some (all?) of Eric's patches may already
> > be in the security-testing tree ...
> > 
> > I have dropped the audit tree for today.
> 
> I've looked at all the conflicting bits, and I think you should take what's in
> the security tree over what's in Al's tree for all of them.  I think the
> security tree already has everything that Al's tree applies in the conflicting
> areas, it's just that the security tree has further changes parked on top.
> 
> David

I think David is right, all the conflicts should come from
security-testing.  Al does have other good stuff in his tree though, Al
do you want to just kick all of my patches out?

-Eric
