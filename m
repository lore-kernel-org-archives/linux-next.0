From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: linux-next tree for s390 and cputime
Date: Fri, 16 Dec 2011 13:37:12 +0100
Message-ID: <20111216133712.56957b33@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:44507 "EHLO
	e06smtp16.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759098Ab1LPMhX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Dec 2011 07:37:23 -0500
Received: from /spool/local
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <schwidefsky@de.ibm.com>;
	Fri, 16 Dec 2011 12:37:18 -0000
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pBGCbEfg2449428
	for <linux-next@vger.kernel.org>; Fri, 16 Dec 2011 12:37:14 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pBGCbExL023567
	for <linux-next@vger.kernel.org>; Fri, 16 Dec 2011 05:37:14 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-next@vger.kernel.org

Hi Stephen,

we completed the move of the s390 tree from marist.edu to kernel.org.
Please update the git pull for linux-next of the s390 and the cputime
tree to use the following two new locations:

git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git cputime

Thank you.

-- 
blue skies,
   Martin.

"Reality continues to ruin my life." - Calvin.
