From: Sachin Sant <sachinp@in.ibm.com>
Subject: [-next Sept 10] Build break - arch/s390/mm/pgtable.c (INIT_RCU_HEAD)
Date: Fri, 10 Sep 2010 13:43:20 +0530
Message-ID: <4C89E8A0.1050905@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp01.au.ibm.com ([202.81.31.143]:56738 "EHLO
	e23smtp01.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753522Ab0IJIN0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 10 Sep 2010 04:13:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-s390@vger.kernel.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>

Today's next fails to build on a s390 box with

arch/s390/mm/pgtable.c: In function 'rcu_table_freelist_finish':
arch/s390/mm/pgtable.c:79: error: implicit declaration of function 'INIT_RCU_HEAD'
make[2]: *** [arch/s390/mm/pgtable.o] Error 1

This code in question was added via following commit:

commit e726023d9ff7e4968e3e0622782174a4695d68a4
S390] lockless get_user_pages_fast()

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
