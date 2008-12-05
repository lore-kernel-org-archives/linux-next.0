From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: linux-next: "aio: make the lookup_ioctx() lockless" causes s390
	build bug
Date: Fri, 5 Dec 2008 17:41:55 +0100
Message-ID: <20081205164155.GC4491@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate2.uk.ibm.com ([194.196.100.162]:44541 "EHLO
	mtagate2.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbYLEQl5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Dec 2008 11:41:57 -0500
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate2.uk.ibm.com (8.13.1/8.13.1) with ESMTP id mB5GfulI009070
	for <linux-next@vger.kernel.org>; Fri, 5 Dec 2008 16:41:56 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com [9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mB5Gfun3585774
	for <linux-next@vger.kernel.org>; Fri, 5 Dec 2008 16:41:56 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mB5GftKn002871
	for <linux-next@vger.kernel.org>; Fri, 5 Dec 2008 16:41:56 GMT
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Hi Jens,

your patch "aio: make the lookup_ioctx() lockless" in linux-next
causes this build bug on s390:

arch/s390/mm/pgtable.c: In function 's390_enable_sie':
arch/s390/mm/pgtable.c:266: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
arch/s390/mm/pgtable.c:282: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
make[1]: *** [arch/s390/mm/pgtable.o] Error 1
make: *** [arch/s390/mm] Error 2

Could you please fix that? Thanks! ;)
