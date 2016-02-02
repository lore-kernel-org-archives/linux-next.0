From: Chandan Rajendra <chandan@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the btrfs-kdave tree with Linus' tree
Date: Tue, 02 Feb 2016 10:46:20 +0530
Message-ID: <3386269.jJKUEthxLy@localhost.localdomain>
References: <20160202102216.60d1d550@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([125.16.236.7]:45307 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750779AbcBBFQi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2016 00:16:38 -0500
Received: from localhost
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <chandan@linux.vnet.ibm.com>;
	Tue, 2 Feb 2016 10:46:35 +0530
In-Reply-To: <20160202102216.60d1d550@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Sterba <dsterba@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On Tuesday 02 Feb 2016 10:22:16 Stephen Rothwell wrote:
> Hi David,
> 
> Today's linux-next merge of the btrfs-kdave tree got a conflict in:
> 
>   fs/btrfs/file.c
> 
> between commit:
> 
>   5955102c9984 ("wrappers for ->i_mutex access")
> 
> from Linus' tree and commit:
> 
>   9703fefe0b13 ("Btrfs: fallocate: Work with sectorsized blocks")
> 
> from the btrfs-kdave tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

The fixes look good to me. Thanks for doing this.

-- 
chandan
