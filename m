From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: next phase of tmem into linux-next
Date: Tue, 31 May 2011 17:49:21 -0700 (PDT)
Message-ID: <80f7ab04-7ae6-48cb-b254-e99343147bf0@default>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:32522 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932663Ab1FAAtq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 31 May 2011 20:49:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>

Hi Stephen --

Please re-include the following tree into linux-next.  The
commit series is for frontswap, the complement of cleancache
handling swap pages, which is the next phase in tmem.  It also
includes the shim code to Xen tmem for frontswap.  It applies
cleanly on linux-3.0-rc1, but if there are any problems or
you have any questions, please let me know!

git://git.kernel.org/pub/scm/linux/kernel/git/djm/tmem.git#linux-next

Thanks,
Dan
