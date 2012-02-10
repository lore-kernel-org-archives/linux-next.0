From: Cong Wang <amwang@redhat.com>
Subject: Re: linux-next: manual merge of the kmap_atomic tree with Linus'
 tree
Date: Fri, 10 Feb 2012 13:26:47 +0800
Message-ID: <1328851607.12308.5.camel@cr0>
References: <20120210161714.a769968c1569bcd30ec79956@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33401 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745Ab2BJF1G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 10 Feb 2012 00:27:06 -0500
In-Reply-To: <20120210161714.a769968c1569bcd30ec79956@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>

On Fri, 2012-02-10 at 16:17 +1100, Stephen Rothwell wrote:
> Hi Cong,
> 
> Today's linux-next merge of the kmap_atomic tree got a conflict in
> drivers/staging/pohmelfs/inode.c between commit 67435319866f ("staging:
> pohmelfs: remove drivers/staging/pohmelfs") from Linus' tree and commit
> 709bc0d6b5c6 ("pohmelfs: remove the second argument of k[un]map_atomic
> ()") from the kmap_atomic tree.
> 
> The former removes the file, so I did that.

Ok, I will drop that commit.

Thanks.
