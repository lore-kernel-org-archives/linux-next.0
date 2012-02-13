From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 staging tree
Date: Mon, 13 Feb 2012 17:01:16 +0800
Message-ID: <1329123676.2647.43.camel@cr0>
References: <20120213161537.3cf109d3f9c4c577f8fcb789@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:27947 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619Ab2BMJBb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Feb 2012 04:01:31 -0500
In-Reply-To: <20120213161537.3cf109d3f9c4c577f8fcb789@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Seth Jennings <sjenning@linux.vnet.ibm.com>, Dan Magenheimer <dan.magenheimer@oracle.com>, Greg KH <greg@kroah.com>

On Mon, 2012-02-13 at 16:15 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/zcache/zcache-main.c between commit a49aeb1de585
> ("staging: zcache: replace xvmalloc with zsmalloc") (and mayb others)
> from the staging tree and commit 1edbcaee3bbe ("zcache: remove the second
> argument of k [un]map_atomic()") from the kmap_atomic tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good.

Thanks!
