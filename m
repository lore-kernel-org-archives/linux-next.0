From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 1 (virtio_blk warning)
Date: Thu, 1 Apr 2010 09:13:12 -0700
Message-ID: <20100401091312.85775242.randy.dunlap@oracle.com>
References: <20100401172317.80b6d961.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:28871 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755565Ab0DAQPM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2010 12:15:12 -0400
In-Reply-To: <20100401172317.80b6d961.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 1 Apr 2010 17:23:17 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100331:


drivers/block/virtio_blk.c:228:13: warning: multi-character character constant

due to:

	if (cmd == 'VBID') {

---
~Randy
