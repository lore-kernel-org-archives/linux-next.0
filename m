From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing Signed-off-by in file-locks tree
Date: Fri, 16 Oct 2015 09:19:43 +1100
Message-ID: <20151016091943.344ac095@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49803 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbbJOWTp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Oct 2015 18:19:45 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jeff,

I noticed that the top commit in the file-locks tree

  2d98a1779875 ("locks: Use more file_inode and fix a comment")

has no Signed-off-by tag from you as committer.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
