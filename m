From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 3 (driver core)
Date: Wed, 03 Jun 2009 08:50:10 -0700
Message-ID: <4A269BB2.4050508@oracle.com>
References: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:19873 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406AbZFCPrH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 11:47:07 -0400
In-Reply-To: <20090603190952.2dd0cc70.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

Stephen Rothwell wrote:
> Hi all,
> 
> Looks like a real rush since -rc7 ...


drivers/built-in.o: In function `register_mem_sect_under_node':
(.text+0x1d305b): undefined reference to `sysfs_create_link_nowarn'


I can't find this function's implementation when CONFIG_SYSFS=y.


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
