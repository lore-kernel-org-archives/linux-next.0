From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 11 (nouveau)
Date: Mon, 11 Oct 2010 09:29:15 -0700
Message-ID: <20101011092915.66afd35b.randy.dunlap@oracle.com>
References: <20101011162959.86e40961.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:60609 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755366Ab0JKQah (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2010 12:30:37 -0400
In-Reply-To: <20101011162959.86e40961.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>

On Mon, 11 Oct 2010 16:29:59 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20101008:


When CONFIG_HWMON is not enabled:

drivers/built-in.o: In function `nouveau_pm_fini':
(.text+0x1c680f): undefined reference to `hwmon_device_unregister'
drivers/built-in.o: In function `nouveau_hwmon_init':
nouveau_pm.c:(.text+0x1c6f93): undefined reference to `hwmon_device_register'
nouveau_pm.c:(.text+0x1c7094): undefined reference to `hwmon_device_unregister'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
