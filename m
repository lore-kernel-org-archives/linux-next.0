From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: manual merge of the integrity tree with the vfs tree
Date: Mon, 4 Jan 2016 03:16:21 +0000
Message-ID: <20160104031621.GP9938@ZenIV.linux.org.uk>
References: <20160104135221.0e5515ac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:46117 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751974AbcADDQ2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2016 22:16:28 -0500
Content-Disposition: inline
In-Reply-To: <20160104135221.0e5515ac@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>

On Mon, Jan 04, 2016 at 01:52:21PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the integrity tree got a conflict in:
> 
>   security/integrity/ima/ima_fs.c
> 
> between commit:
> 
>   3bc8f29b149e ("new helper: memdup_user_nul()")
> 
> from the vfs tree and commit:
> 
>   6427e6c71c8b ("ima: ima_write_policy() limit locking")
> 
> from the integrity tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

FWIW, I'm going to pull the part that introduces memdup_user_nul() into
a never-rebased branch and if security.git is willing to pull it and handle
that conversion in ima_write_policy() themselves, I'll be only glad to drop
the corresponding chunk in vfs.git#for-next
