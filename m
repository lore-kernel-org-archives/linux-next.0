From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: clean up the vfs-miklos tree
Date: Mon, 10 Oct 2016 11:37:01 +1100
Message-ID: <20161010113701.43a17ee5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58945 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750786AbcJJAhD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Oct 2016 20:37:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Miklos,

It looks like everything in the vfs-miklos tree is now in Linus' tree or
the vfs tree but as different commits and so is causing merge conflicts.
Could you please clean it up, or should I just drop it now?

-- 
Cheers,
Stephen Rothwell
