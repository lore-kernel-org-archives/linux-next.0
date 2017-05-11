From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: error when fetching the target-bva tree
Date: Fri, 12 May 2017 09:33:25 +1000
Message-ID: <20170512093325.1149d1ae@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41355 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753128AbdEKXd2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 May 2017 19:33:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bart Van Assche <bart.vanassche@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Bart,

Fetching the tagret-bva tree
(git://git.kernel.org/pub/scm/linux/kernel/git/bvanassche/linux.git#for-next)
today produces this error:

fatal: Couldn't find remote ref refs/heads/for-next

-- 
Cheers,
Stephen Rothwell
