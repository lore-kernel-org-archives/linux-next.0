From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: A few tree inclusion update requests
Date: Sat, 10 Apr 2010 15:42:23 +0200
Message-ID: <20100410134221.GC5204@nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f209.google.com ([209.85.218.209]:40808 "EHLO
	mail-bw0-f209.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab0DJNm2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 10 Apr 2010 09:42:28 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Next <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

I have some requests for you about tree inclusions for linux-next.

My reiserfs/kill-bkl branch had no updates for a next release
for some time now. You can safely remove it from -next. If
I get updates for it later, I'll tell you. But for now it's
only here to host fixes for the current release.

Also I have two new branches aimed for .35

Could you please integrate the two following?

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	bkl/core

git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracing.git
	bkl/procfs

Thanks a lot!
