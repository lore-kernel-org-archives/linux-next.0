From: Matt Mackall <mpm@selenic.com>
Subject: Re: linux-next: manual merge of the nommu tree
Date: Thu, 08 Jan 2009 01:20:02 -0600
Message-ID: <1231399203.3178.277.camel@calx>
References: <20090108153009.96d9d01a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from waste.org ([66.93.16.53]:50556 "EHLO waste.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751627AbZAHHUr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 8 Jan 2009 02:20:47 -0500
In-Reply-To: <20090108153009.96d9d01a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>

On Thu, 2009-01-08 at 15:30 +1100, Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the nommu tree got a conflict in
> mm/tiny-shmem.c between commit 853ac43ab194f5051b27a55060215d696dc9480d
> ("shmem: unify regular and tiny shmem") from Linus' tree and commit
> d10f9907ba3626261f45dbb498867f441f06c486 ("shmem: remove unused
> shmem_get_unmapped_area") from the nommu tree.

Thanks for cleaning this up, but this probably shouldn't have happened.
I wrote the remove patch first, then wrote the unify patch on top of it
and sent them both off, numbered, to Hugh. Not sure how or why they went
through different trees.

-- 
Mathematics is the supreme nostalgia of our time.
