From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 3 (xfrm4)
Date: Mon, 3 Aug 2009 08:49:19 -0700
Message-ID: <20090803084919.e1af90d3.randy.dunlap@oracle.com>
References: <20090803185203.a96063fd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:44280 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753830AbZHCPtb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Aug 2009 11:49:31 -0400
In-Reply-To: <20090803185203.a96063fd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, netdev <netdev@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 3 Aug 2009 18:52:03 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20090731:


when PROC_FS=n, PROC_SYSCTL=n:

(.init.text+0x41ed): undefined reference to `net_ipv4_ctl_path'
(.init.text+0x420b): undefined reference to `register_net_sysctl_table'
xfrm4_policy.c:(.exit.text+0x3c3): undefined reference to `unregister_net_sysctl_table'


---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
