From: David Sterba <dsterba@suse.cz>
Subject: Re: linux-next: Signed-off-by missing for commit in the btrfs-kdave
 tree
Date: Tue, 13 Feb 2018 12:42:33 +0100
Message-ID: <20180213114233.GS3003@suse.cz>
References: <20180209141152.774f1205@canb.auug.org.au>
Reply-To: dsterba@suse.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34773 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934078AbeBMLov (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Feb 2018 06:44:51 -0500
Content-Disposition: inline
In-Reply-To: <20180209141152.774f1205@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Filipe Manana <fdmanana@suse.com>

Hi,

On Fri, Feb 09, 2018 at 02:11:52PM +1100, Stephen Rothwell wrote:
> Commit
>   7f53a77da963 ("Btrfs: fix btrfs_evict_inode to handle abnormal inodes correctly")
> is missing a Signed-off-by from its committer.

thanks for the notice, this has been fixed.
