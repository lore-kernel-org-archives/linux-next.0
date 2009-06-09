From: Ryusuke Konishi <ryusuke@osrg.net>
Subject: Re: linux-next: manual merge of the vfs tree with the nilfs tree
Date: Tue, 09 Jun 2009 14:41:25 +0900 (JST)
Message-ID: <20090609.144125.88495131.ryusuke@osrg.net>
References: <20090609111114.2e879a50.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sh.osrg.net ([192.16.179.4]:40538 "EHLO sh.osrg.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752275AbZFIFle (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2009 01:41:34 -0400
In-Reply-To: <20090609111114.2e879a50.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, viro@ZenIV.linux.org.uk
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, konishi.ryusuke@lab.ntt.co.jp

Hi,
On Tue, 9 Jun 2009 11:11:14 +1000, Stephen Rothwell wrote:
> Hi Al,
> 
> Today's linux-next merge of the vfs tree got a conflicts in
> fs/nilfs2/super.c between commits from the nilfs tree and similar commits
> from the vfs tree.
> 
> The vfs and nilfs trees have different versions of the following patches:
> 
> nilfs2: get rid of sget use for checking if current mount is present
> nilfs2: simplify remaining sget() use
> nilfs2: correct exclusion control in nilfs_remount function
> 
> And the vfs tree has further commits that affect this files as well.
> 
> For now, I have used the vfs tree version.  Please sort this out.

I've confirmed that the patch series is applied to the vfs tree.

To avoid the conflict, I will remove them from my nilfs2 tree.

Thanks,
Ryusuke Konishi
