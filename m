From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the btrfs-kdave
 tree
Date: Fri, 1 Dec 2017 09:22:49 +1100
Message-ID: <20171201092250.66217bac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38155 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750761AbdK3WWx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Nov 2017 17:22:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Filipe Manana <fdmanana@suse.com>

Hi David,

Commits

  f212bed55c85 ("Btrfs: add support for fallocate's zero range operation")
  2d0d54302a5f ("Btrfs: use cached state when dirtying pages during buffered write")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
