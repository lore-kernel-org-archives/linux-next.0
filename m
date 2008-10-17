From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the creds tree
Date: Fri, 17 Oct 2008 11:34:22 +0100
Message-ID: <26927.1224239662@redhat.com>
References: <20081017170825.7da46c80.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:36267 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752191AbYJQKfE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 06:35:04 -0400
In-Reply-To: <20081017170825.7da46c80.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the creds tree got a conflict in
> fs/binfmt_elf_fdpic.c between commit
> 5edc2a5123a7c3d9bcb19ffcf3b91e8d6c246092 ("binfmt_elf_fdpic: wire up
> AT_EXECFD, AT_EXECFN, AT_SECURE") from Linus' tree and commit
> 4865969c64ed7e911fae4e6a275e65789806f823 ("CRED: Wrap current->cred and a
> few other accessors") from the creds tree.

ACK.
