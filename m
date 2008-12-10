From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree
Date: Wed, 10 Dec 2008 18:58:29 +0000
Message-ID: <13157.1228935509@redhat.com>
References: <20081209175726.682d77cd.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:34859 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754414AbYLJS7V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 13:59:21 -0500
In-Reply-To: <20081209175726.682d77cd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Eric Paris <eparis@redhat.com>, Serge Hallyn <serue@us.ibm.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the audit tree got a lot of conflict in
> include/linux/audit.h, kernel/auditsc.c, kernel/capability.c and
> security/commoncap.c against commits in the security-testing tree.
> 
> Its not obvious how to resolve these, so can you, Eric, James and Dave
> have a conversation and see what you can come up with.  Some will be
> easy, but there are several overlapping changes here.
> 
> Looking harder, it looks like some (all?) of Eric's patches may already
> be in the security-testing tree ...
> 
> I have dropped the audit tree for today.

I've looked at all the conflicting bits, and I think you should take what's in
the security tree over what's in Al's tree for all of them.  I think the
security tree already has everything that Al's tree applies in the conflicting
areas, it's just that the security tree has further changes parked on top.

David
