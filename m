From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the keys tree
Date: Mon, 13 Nov 2017 07:49:26 +1100
Message-ID: <20171113074926.10801176@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59731 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750921AbdKLUt3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 12 Nov 2017 15:49:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi David,

Commit

  1f654bff6126 ("KEYS: Add support for directly-specified uids and gids in key ACLs")

is missing a Signed-off-by from its author and committer.

-- 
Cheers,
Stephen Rothwell
