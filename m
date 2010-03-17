From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 17 (gigaset isdn)
Date: Wed, 17 Mar 2010 08:38:55 -0700
Message-ID: <4BA0F78F.9090804@oracle.com>
References: <20100317160803.78c63f94.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:48113 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752338Ab0CQPkO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2010 11:40:14 -0400
In-Reply-To: <20100317160803.78c63f94.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Hansjoerg Lipp <hjlipp@web.de>, Tilman Schmidt <tilman@imap.cc>

On 03/16/10 22:08, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20100316:


ERROR: "gigaset_isdn_regdev" [drivers/isdn/gigaset/gigaset.ko] undefined!
ERROR: "gigaset_isdn_regdrv" [drivers/isdn/gigaset/gigaset.ko] undefined!
ERROR: "gigaset_isdn_unregdrv" [drivers/isdn/gigaset/gigaset.ko] undefined!
ERROR: "gigaset_isdn_unregdev" [drivers/isdn/gigaset/gigaset.ko] undefined!

when
# CONFIG_ISDN_I4L is not set
# CONFIG_ISDN_CAPI is not set
CONFIG_ISDN_DRV_GIGASET=m # or =y

-- 
~Randy
