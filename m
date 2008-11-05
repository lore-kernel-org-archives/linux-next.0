From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Wed, 05 Nov 2008 12:08:16 +0000
Message-ID: <26171.1225886896@redhat.com>
References: <20081105155620.8da6ac84.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:56514 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750890AbYKEMI3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 07:08:29 -0500
In-Reply-To: <20081105155620.8da6ac84.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: dhowells@redhat.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>


Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got a conflict in
> security/selinux/hooks.c between commit
> 41d9f9c524a53477467b7e0111ff3d644198f191 ("SELinux: hold tasklist_lock
> and siglock while waking wait_chldexit") from security-testing tree and
> commit a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve()
> take advantage of copy-on-write credentials") from the creds tree.
> 
> I can't see how to fix this easily, so I will have to drop the tree for
> today.  Please try the merge for yourself and see if you can come up with
> a solution, thanks.

James: is it worth you pulling my patches into your tree?

David
