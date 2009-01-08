From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: manual merge of the nommu tree
Date: Thu, 08 Jan 2009 12:46:29 +0000
Message-ID: <28278.1231418789@redhat.com>
References: <20090108153009.96d9d01a.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:46073 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752105AbZAHMqm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 07:46:42 -0500
In-Reply-To: <20090108153009.96d9d01a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, linux-next@vger.kernel.org, Matt Mackall <mpm@selenic.com>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the nommu tree got a conflict in
> mm/tiny-shmem.c between commit 853ac43ab194f5051b27a55060215d696dc9480d
> ("shmem: unify regular and tiny shmem") from Linus' tree and commit
> d10f9907ba3626261f45dbb498867f441f06c486 ("shmem: remove unused
> shmem_get_unmapped_area") from the nommu tree.

I've updated the nommu tree.

David
