From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: git tree with cputime changes
Date: Mon, 03 Nov 2008 16:10:54 +0100
Message-ID: <1225725054.24817.15.camel@localhost>
Reply-To: schwidefsky@de.ibm.com
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.de.ibm.com ([195.212.29.157]:58337 "EHLO
	mtagate8.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788AbYKCPWo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 10:22:44 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id mA3FKnhq643074
	for <linux-next@vger.kernel.org>; Mon, 3 Nov 2008 15:20:49 GMT
Received: from d12av02.megacenter.de.ibm.com (d12av02.megacenter.de.ibm.com [9.149.165.228])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mA3FKnPn4108436
	for <linux-next@vger.kernel.org>; Mon, 3 Nov 2008 16:20:49 +0100
Received: from d12av02.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av02.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mA3FKm1m019567
	for <linux-next@vger.kernel.org>; Mon, 3 Nov 2008 16:20:49 +0100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,
I've created the cputime git branch on git390.osdl.marist.edu with the
improvements for the idle time accounting. I've got feedback from the
ia64 and powerpc maintainers but nothing really conclusive yet. To find
potential problems it would be nice if you could add 

	git://git390.osdl.marist.edu/pub/scm/linux-2.6.git cputime

to linux-next. The branch has four patches:

Martin Schwidefsky (4):
      [S390] fix scaled & unscaled cputime accounting
      [S390] idle cputime accounting
      [S390] improve precision of idle accounting.
      [S390] improve idle cputime accounting

Thanks in advance..

-- 
blue skies,
  Martin.

"Reality continues to ruin my life." - Calvin.
