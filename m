From: Sachin Sant <sachinp@in.ibm.com>
Subject: next tree for October 27:  znet build failure
Date: Tue, 27 Oct 2009 15:05:03 +0530
Message-ID: <4AE6BEC7.2030703@in.ibm.com>
References: <20091027190850.9694fb39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp09.au.ibm.com ([202.81.31.142]:51972 "EHLO
	e23smtp09.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752788AbZJ0JfD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Oct 2009 05:35:03 -0400
In-Reply-To: <20091027190850.9694fb39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>

Fails to build on x86_32 with lots of errors related to znet

drivers/net/znet.c:107:29: error: wireless/i82593.h: No such file or directory
drivers/net/znet.c:133: error: field 'i593_init' has incomplete type
drivers/net/znet.c: In function 'znet_set_multicast_list':
drivers/net/znet.c:235: error: invalid application of 'sizeof' to incomplete type 'struct i82593_conf_block'
drivers/net/znet.c:247: error: dereferencing pointer to incomplete type
.....

Commit 879e9304... moved wireless/i82593.h to drivers/staging/wavelan/i82593.h

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------
