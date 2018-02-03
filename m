From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the s390 tree
Date: Sat, 3 Feb 2018 13:03:48 +1100
Message-ID: <20180203130348.74f7b89b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58089 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751669AbeBCCDv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Feb 2018 21:03:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Commits

  a39892ed47bf ("s390/runtime_instrumentation: re-add signum system call parameter")
  279d2cea3aad ("s390/cio: fix kernel-doc usage")

are missing a Signed-off-by from their committer.

-- 
Cheers,
Stephen Rothwell
