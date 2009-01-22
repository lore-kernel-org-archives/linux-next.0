From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for January 22 (staging/rtl8187se)
Date: Thu, 22 Jan 2009 09:14:29 -0800
Message-ID: <4978A975.60002@oracle.com>
References: <20090122180543.1ab0baa6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:61025 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754537AbZAVROp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Jan 2009 12:14:45 -0500
In-Reply-To: <20090122180543.1ab0baa6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090121:


drivers/staging/rtl8187se/r8180_core.c:5973: error: 'struct net_device' has no member named 'wireless_handlers'
drivers/staging/rtl8187se/r8180_core.c:5982: error: 'struct net_device' has no member named 'wireless_handlers'


-- 
~Randy
