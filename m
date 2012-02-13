From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with the
 staging tree
Date: Mon, 13 Feb 2012 17:02:18 +0800
Message-ID: <1329123738.2647.44.camel@cr0>
References: <20120213160821.e223fac74fb6fa53315f3dbe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:14352 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751132Ab2BMJCc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Feb 2012 04:02:32 -0500
In-Reply-To: <20120213160821.e223fac74fb6fa53315f3dbe@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, Greg KH <greg@kroah.com>

On Mon, 2012-02-13 at 16:08 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/hv/storvsc_drv.c between various commits from the staging
> tree and commit c41a603a7235 ("hv: remove the second argument of k
> [un]map_atomic()") from the kmap_atomic tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Sounds fine, thanks!
