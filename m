From: Sachin Sant <sachinp@in.ibm.com>
Subject: Next March 26: s390 allnoconfig build failure still exists
Date: Thu, 26 Mar 2009 15:26:53 +0530
Message-ID: <49CB5165.4060401@in.ibm.com>
References: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([59.145.155.6]:33278 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753798AbZCZJ5Z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2009 05:57:25 -0400
In-Reply-To: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, heiko.carstens@de.ibm.com

I still see the following s390 allnoconfig build failure
with today's next (and previous trees as well ).

arch/s390/include/asm/smp.h:96: error: redefinition of smp_send_stop
include/linux/smp.h:125: error: previous definition of smp_send_stop was here



-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
