From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 11 (bluetooth/rfkill)
Date: Thu, 11 Jun 2009 15:28:41 -0700
Message-ID: <4A318519.2080708@oracle.com>
References: <20090611191420.1f4d5e4f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:40936 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755720AbZFKWc7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 18:32:59 -0400
In-Reply-To: <20090611191420.1f4d5e4f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, marcel@holtmann.org, Johannes Berg <johannes@sipsolutions.net>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090610:


CONFIG_RFKILL=m
CONFIG_BT=y

(.text+0xb7bf7): undefined reference to `rfkill_unregister'
(.text+0xb7c03): undefined reference to `rfkill_destroy'
(.text+0xb962f): undefined reference to `rfkill_blocked'
(.text+0xba173): undefined reference to `rfkill_alloc'
(.text+0xba187): undefined reference to `rfkill_register'
(.text+0xba197): undefined reference to `rfkill_destroy'


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
