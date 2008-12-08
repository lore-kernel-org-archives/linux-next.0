From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Mon, 08 Dec 2008 10:46:48 +0000
Message-ID: <24032.1228733208@redhat.com>
References: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:50241 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751461AbYLHKrQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 05:47:16 -0500
In-Reply-To: <20081208190708.1d2c37ec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Paul Moore <paul.moore@hp.com>, linux-next@vger.kernel.org, James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the lblnet tree got a conflicts in
> security/smack/smack_lsm.c and security/smack/smackfs.c between commits
> 86a264abe542cfececb4df129bc45a0338d8cdb9 ("CRED: Wrap current->cred and a
> few other accessors") and d84f4f992cbd76e8f39c488cf0c5d123843923b1
> ("CRED: Inaugurate COW credentials") from the security-testing tree and
> commit d936691ab765fbac809e9a05c7f0c36ce2c2119e ("smack: Add support for
> unlabeled network hosts and networks") from the lblnet tree.
> 
> I fixed it up (see below) and can carry the fixes as necessary.

That looks reasonable, I think.

David
