From: Dhananjay Phadke <dhananjay@netxen.com>
Subject: RE: linux-next: net tree build warnings
Date: Sun, 15 Mar 2009 23:05:51 -0700
Message-ID: <9FB481EF4C70734186A21A64437F637C02A10E5663@nxexch.unminc.com>
References: <20090316170310.80afbeba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nxgate.netxen.com ([38.99.60.130]:8141 "EHLO nxexch.unminc.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751274AbZCPGMX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2009 02:12:23 -0400
In-Reply-To: <20090316170310.80afbeba.sfr@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

This has been introduced before 567c6c4e2b92f4b86, I'll post a fix (needs a little work).

Thanks,
-Dhananjay
________________________________________
From: Stephen Rothwell [sfr@canb.auug.org.au]
Sent: Sunday, March 15, 2009 11:03 PM
To: David S. Miller
Cc: linux-next@vger.kernel.org; Dhananjay Phadke
Subject: linux-next: net tree build warnings

Hi Dave,

Today's (and for a while) linux-next build (x86_64 allmodconfig) produced
these warnings:

drivers/net/netxen/netxen_nic_hw.c: In function 'netxen_load_firmware':
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string literal results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string literal results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1146: warning: comparison with string literal results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string literal results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string literal results in unspecified behavior
drivers/net/netxen/netxen_nic_hw.c:1159: warning: comparison with string literal results in unspecified behavior

Introduced by commit 567c6c4e2b92f4b8632b043f9395b216b7e7c3ce ("netxen:
firmware download improvements").
--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
