From: Randy Dunlap <RANDY.DUNLAP@ORACLE.COM>
Subject: next-20080515 IB warnings
Date: Thu, 15 May 2008 13:43:30 -0500 (CDT)
Message-ID: <4076165.1210877010629.JavaMail.oracle@acsmt302.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:17245 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760388AbYEOSnh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 May 2008 14:43:37 -0400
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdreier@ciscom.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


on x86_64:

next-20080515/drivers/infiniband/hw/ipath/ipath_sdma.c:348: warning: format '%016llx' expects type 'long long unsigned int', but argument  3 has type 'long unsigned int'
next-20080515/drivers/infiniband/hw/ipath/ipath_sdma.c:618: warning: format '%016llx' expects type 'long long unsigned int', but argument  3 has type 'long unsigned int'


---
~Randy

