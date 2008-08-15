From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 15 (bnx2) [resend/lost]
Date: Fri, 15 Aug 2008 08:41:16 -0700
Message-ID: <20080815084116.340ac526.randy.dunlap@oracle.com>
References: <20080815184032.3acd8032.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:52355 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1755685AbYHOWLk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Aug 2008 18:11:40 -0400
Received: from chimera.site ([72.90.117.230]) by xenotime.net for <linux-next@vger.kernel.org>; Fri, 15 Aug 2008 15:11:34 -0700
In-Reply-To: <20080815184032.3acd8032.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, mchan@broadcom.com, netdev <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

When VLAN is not enabled, bnx2 build fails with:

drivers/net/bnx2.c: In function 'bnx2_rx_int':
drivers/net/bnx2.c:2959: error: dereferencing pointer to incomplete type
drivers/net/bnx2.c:2960: error: dereferencing pointer to incomplete type
make[2]: *** [drivers/net/bnx2.o] Error 1


on these lines:

				ve->h_vlan_proto = htons(ETH_P_8021Q);
				ve->h_vlan_TCI = htons(vtag);


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
