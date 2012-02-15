From: Michael Neuling <mikey@neuling.org>
Subject: Build fail in hugetlbpage.c with linux-next and mpc85xx_defconfig
Date: Thu, 16 Feb 2012 10:08:41 +1100
Message-ID: <14174.1329347321@neuling.org>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35121 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751498Ab2BOXIn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Feb 2012 18:08:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: galak@kernel.crashing.org, Becky Bruce <beckyb@kernel.crashing.org>
Cc: linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org

Becky,

This has been broken in linux-next for a while.  Looks like a merge
issue but you were the last to touch it...

arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'parse_args' makes integer from pointer without a cast
include/linux/moduleparam.h:317: note: expected 's16' but argument is of type 'int (*)(char *, char *)'
arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to function 'parse_args'

Mikey
