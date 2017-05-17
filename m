From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the file-locks tree
Date: Wed, 17 May 2017 10:27:52 +1000
Message-ID: <20170517102752.3bd4da91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751181AbdEQA1z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 May 2017 20:27:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeff Layton <jlayton@poochiereds.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jeff,

After merging the file-locks tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

fs/fcntl.c: In function 'SYSC_fcntl64':
fs/fcntl.c:414:30: error: 'argp' undeclared (first use in this function)
   if (copy_from_user(&flock, argp, sizeof(flock)))
                              ^
fs/fcntl.c:414:30: note: each undeclared identifier is reported only once for each function it appears in
fs/fcntl.c:416:23: error: 'filp' undeclared (first use in this function)
   err = fcntl_getlk64(filp, cmd, &flock);
                       ^

Caused by commit

  0416b792294c ("fs/locks: pass kernel struct flock to fcntl_getlk/setlk")

This build has BITS_PER_LONG == 32.

I have used the file-locks tree from next-20170516 for today.

-- 
Cheers,
Stephen Rothwell
