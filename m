From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the security-testing tree
Date: Tue, 09 Dec 2008 15:28:01 +0000
Message-ID: <31186.1228836481@redhat.com>
References: <20081209164026.022dfa39.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:59594 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750788AbYLIP2l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 10:28:41 -0500
In-Reply-To: <20081209164026.022dfa39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Miloslav Trmac <mitr@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the security-testing tree got a conflict in
> drivers/char/tty_audit.c between commit
> 49518720d67042cf431e7f96aed5b0f5c51a84e3 ("[PATCH] Audit: Log TIOCSTI")
> from the audit-current tree and commit
> 66303bce9b924e35e435d35409d3abc371755767 ("CRED: Wrap task credential
> accesses in the tty driver") from the security-testing tree.
> 
> The former moved the code that the latter was modifying.  I fixed it up
> (see below) and can carry the fix as necessary.

Your changes look okay.

David
