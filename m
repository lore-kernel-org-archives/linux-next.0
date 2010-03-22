From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 22 (net-sysfs.c)
Date: Mon, 22 Mar 2010 08:31:09 -0700
Message-ID: <4BA78D3D.9090007@oracle.com>
References: <20100322171937.d753bdba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:43129 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753808Ab0CVPbZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Mar 2010 11:31:25 -0400
In-Reply-To: <20100322171937.d753bdba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>

On 03/21/10 23:19, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100319:
> 
> 
> The net tree lost its build failures.


When CONFIG_SYSFS is not enabled:

net/core/net-sysfs.c:742: error: implicit declaration of function 'rx_queue_remove_kobjects'
net/core/net-sysfs.c:783: error: implicit declaration of function 'rx_queue_register_kobjects'

-- 
~Randy
