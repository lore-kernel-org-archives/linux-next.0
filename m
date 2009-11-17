From: Sachin Sant <sachinp@in.ibm.com>
Subject: [-next Nov 17] s390 build break(arch/s390/kernel/compat_wrapper.S)
Date: Tue, 17 Nov 2009 17:36:19 +0530
Message-ID: <4B0291BB.3090005@in.ibm.com>
References: <20091117195309.6cc3ead0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp04.au.ibm.com ([202.81.31.146]:33885 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754116AbZKQMGV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Nov 2009 07:06:21 -0500
In-Reply-To: <20091117195309.6cc3ead0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-s390@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Eric Paris <eparis@redhat.com>

Today's next 20091117 build failed on s390 with

arch/s390/kernel/compat_wrapper.S: Assembler messages:
arch/s390/kernel/compat_wrapper.S:1871: Error: operand out of range (164 is not between 0 and 15)
arch/s390/kernel/compat_wrapper.S:1871: Error: junk at end of line: `(%r15)'
make[1]: *** [arch/s390/kernel/compat_wrapper.o] Error 1

The code in question was added by commit 9db3031ac785b068eb4636465eebb7b346c48dbb

fanotify: sys_fanotify_mark declartion

I had applied the following patch to get past another build break reported
against yesterday's next (20091116)

http://marc.info/?l=linux-next&m=125844478708886&w=2 <http://marc.info/?l=linux-next&m=125844478708886&w=2>

Thanks
-Sachin

-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
