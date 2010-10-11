From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: linux-next: "hugetlb: hugepage migration core" breaks compilation
 on s390
Date: Mon, 11 Oct 2010 13:11:31 +0200
Message-ID: <20101011111131.GA10270@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate4.uk.ibm.com ([194.196.100.164]:39328 "EHLO
	mtagate4.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114Ab0JKLLe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 07:11:34 -0400
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate4.uk.ibm.com (8.13.1/8.13.1) with ESMTP id o9BBBXwF013073
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 11:11:33 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id o9BBBXV93412200
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 12:11:33 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id o9BBBWdD016614
	for <linux-next@vger.kernel.org>; Mon, 11 Oct 2010 12:11:33 +0100
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, Andi Kleen <ak@linux.intel.com>
Cc: linux-next@vger.kernel.org, Jun'ichi Nomura <j-nomura@ce.jp.nec.com>, Mel Gorman <mel@csn.ul.ie>, Martin Schwidefsky <schwidefsky@de.ibm.com>

"hugetlb: hugepage migration core" in linux-next breaks compilation on s390:

  CC      mm/migrate.o
mm/migrate.c: In function 'remove_migration_pte':
mm/migrate.c:143:3: error: implicit declaration of function 'pte_mkhuge'
mm/migrate.c:143:7: error: incompatible types when assigning to type 'pte_t' from type 'int'
make[1]: *** [mm/migrate.o] Error 1
make: *** [mm/migrate.o] Error 2

This is simply because a lot of CONFIG_HUGETLB_PAGE dependent code was added
to mm/migration.c which does not depend on that config option. Please fix.

Thanks.
