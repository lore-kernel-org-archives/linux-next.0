From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bad base of the h8300 tree
Date: Mon, 31 Aug 2015 07:43:04 +1000
Message-ID: <20150831074304.0ce16f9f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40655 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751704AbbH3VnI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 30 Aug 2015 17:43:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Yoshinori,

The h8300 tree today has been based on linux-next.  This cannto work.
Please rebase this onto Linus' tree (or some other stable base).

I cannot use your tree in this state, so it will be dropped from
linux-next until it is fixed.  Also, Linus cannot pull it in this state.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
