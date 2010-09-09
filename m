From: Sachin Sant <sachinp@in.ibm.com>
Subject: [-next Sept 9] S309 Build break (mm/percpu.c)
Date: Thu, 09 Sep 2010 18:05:22 +0530
Message-ID: <4C88D48A.3070702@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:40967 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098Ab0IIMf0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 9 Sep 2010 08:35:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-s390@vger.kernel.org
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Tejun Heo <tj@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Today's Next (next-20100909) fails to build on s390 with :

mm/percpu.c: In function 'pcpu_embed_first_chunk':
mm/percpu.c:1581: error: implicit declaration of function 'pcpu_build_alloc_info'
mm/percpu.c:1582: warning: assignment makes pointer from integer without a cast

Probable cause seems to be following commit :

commit bbddff0545878a8649c091a9dd7c43ce91516734
percpu: use percpu allocator on UP too

CONFIG_NEED_PER_CPU_ .. and CONFIG_HAVE_SETUP_PER_CPU_AREA
options are not enabled in the .config

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
