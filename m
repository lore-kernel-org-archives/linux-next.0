From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the integrity tree with the vfs tree
Date: Mon, 04 Jan 2016 00:06:37 -0500
Message-ID: <1451883997.2772.27.camel@linux.vnet.ibm.com>
References: <20160104135221.0e5515ac@canb.auug.org.au>
	 <20160104031621.GP9938@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([125.16.236.3]:39443 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750730AbcADFGs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 00:06:48 -0500
Received: from localhost
	by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zohar@linux.vnet.ibm.com>;
	Mon, 4 Jan 2016 10:36:45 +0530
In-Reply-To: <20160104031621.GP9938@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>, James Morris <jmorris@namei.org>

On Mon, 2016-01-04 at 03:16 +0000, Al Viro wrote:
> On Mon, Jan 04, 2016 at 01:52:21PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the integrity tree got a conflict in:
> > 
> >   security/integrity/ima/ima_fs.c
> > 
> > between commit:
> > 
> >   3bc8f29b149e ("new helper: memdup_user_nul()")
> > 
> > from the vfs tree and commit:
> > 
> >   6427e6c71c8b ("ima: ima_write_policy() limit locking")
> > 
> > from the integrity tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).

Thanks!

> FWIW, I'm going to pull the part that introduces memdup_user_nul() into
> a never-rebased branch and if security.git is willing to pull it and handle
> that conversion in ima_write_policy() themselves, I'll be only glad to drop
> the corresponding chunk in vfs.git#for-next

Al,

As memdup_user_nul() is not in the security tree, it would break the
security tree builds.  Having the patch in the linux-integrity/next
branch wouldn't help matters.

Mimi
