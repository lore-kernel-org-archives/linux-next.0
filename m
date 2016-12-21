From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: old commit in the y2038 tree
Date: Wed, 21 Dec 2016 11:36:52 +1100
Message-ID: <20161221113652.3586ab19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55743 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756139AbcLUAgz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Dec 2016 19:36:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tina Ruchandani <ruchandani.tina@gmail.com>

Hi Arnd,

The y2038 tree
(git://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git#y2038)
is based on v4.6-rc3 and consists of a single commit:

  549eb7b22e24 ("AFS: Correctly use 64-bit time for UUID")

that was written in October 2015 and commited in April 2016.  I am just
wondering if you have plans for that commit and/or that branch?

-- 
Cheers,
Stephen Rothwell
