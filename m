From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the audit tree
Date: Wed, 10 Dec 2008 23:28:52 +0000
Message-ID: <20081210232851.GH28946@ZenIV.linux.org.uk>
References: <20081209175726.682d77cd.sfr@canb.auug.org.au> <13157.1228935509@redhat.com> <1228935701.3524.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:49865 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011AbYLJX3F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 18:29:05 -0500
Content-Disposition: inline
In-Reply-To: <1228935701.3524.3.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Paris <eparis@redhat.com>
Cc: David Howells <dhowells@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Serge Hallyn <serue@us.ibm.com>

On Wed, Dec 10, 2008 at 02:01:41PM -0500, Eric Paris wrote:
> On Wed, 2008-12-10 at 18:58 +0000, David Howells wrote:
> > Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Today's linux-next merge of the audit tree got a lot of conflict in
> > > include/linux/audit.h, kernel/auditsc.c, kernel/capability.c and
> > > security/commoncap.c against commits in the security-testing tree.
> > > 
> > > Its not obvious how to resolve these, so can you, Eric, James and Dave
> > > have a conversation and see what you can come up with.  Some will be
> > > easy, but there are several overlapping changes here.
> > > 
> > > Looking harder, it looks like some (all?) of Eric's patches may already
> > > be in the security-testing tree ...
> > > 
> > > I have dropped the audit tree for today.
> > 
> > I've looked at all the conflicting bits, and I think you should take what's in
> > the security tree over what's in Al's tree for all of them.  I think the
> > security tree already has everything that Al's tree applies in the conflicting
> > areas, it's just that the security tree has further changes parked on top.
> > 
> > David
> 
> I think David is right, all the conflicts should come from
> security-testing.  Al does have other good stuff in his tree though, Al
> do you want to just kick all of my patches out?

They are already gone from later branch...

Anyway, by now the only thing from that tree that is not in mainline or
security tree is s390 patchlet and I'll throw it to s390 folks anyway.
There are additional patches in my local tree and I'll push them tonight,
but that'll be for linux-audit testing.  _Then_ they might go to -next;
for now, just drop audit tree from -next.
