From: Neil Brown <neilb@suse.de>
Subject: [PULL REQUEST] md: there was a bug in the bugfix.
Date: Wed, 27 May 2009 21:45:55 +1000
Message-ID: <18973.10227.160582.824313@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45320 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753135AbZE0Lpc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 May 2009 07:45:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


Hi Linus,
 on of those bug fixes in the recent pull had a bug, found by Stephen
 and his linux-next testing (thanks Stephen).

 I was using 'min()' wrongly and have replaced it with "min_t()".

Thanks,
NeilBrown


The following changes since commit b492b852cd8c99505708152c29a5e09a787af9de:
  NeilBrown (1):
        md: don't use locked_ioctl.

are available in the git repository at:

  git://neil.brown.name/md/ for-linus

NeilBrown (1):
      md: raid5: change incorrect usage of 'min' macro to 'min_t'

 drivers/md/raid5.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
