From: David Miller <davem@davemloft.net>
Subject: Re: [BUILD_FAILURE] linux-next: 20081125 - 8390 network driver
 build fails
Date: Tue, 25 Nov 2008 13:42:15 -0800 (PST)
Message-ID: <20081125.134215.146717314.davem@davemloft.net>
References: <492C562E.9090302@oracle.com>
	<20081125195756.12317499@lxorguk.ukuu.org.uk>
	<492C5B52.6090803@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40025
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754880AbYKYVmQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 16:42:16 -0500
In-Reply-To: <492C5B52.6090803@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: randy.dunlap@oracle.com
Cc: alan@lxorguk.ukuu.org.uk, kamalesh@linux.vnet.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, p_gortmaker@yahoo.com, netdev@vger.kernel.org, mel@csn.ul.ie, shemminger@linux-foundation.org

From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Tue, 25 Nov 2008 12:08:50 -0800

> Looks like it's due to CONFIG_COMPAT_NET_DEV_OPS.

Right, I've asked Stephen Hemminger to fix this.

> Dave, no need to drop my hp-plus driver patch.

Yes, I knew this :)
