From: Sachin Sant <sachinp@in.ibm.com>
Subject: next June 10: S390 build failure [arch/s390/kvm/kvm.ko]
Date: Thu, 10 Jun 2010 18:08:15 +0530
Message-ID: <4C10DCB7.7090903@in.ibm.com>
References: <20100610160012.30ea7606.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:57186 "EHLO
	e23smtp09.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752079Ab0FJMiU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2010 08:38:20 -0400
In-Reply-To: <20100610160012.30ea7606.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

Today's next fails to build on a s390 box with

ERROR: "__kvm_s390_vcpu_store_status" [arch/s390/kvm/kvm.ko] undefined!

Yesterday's next was good.

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
