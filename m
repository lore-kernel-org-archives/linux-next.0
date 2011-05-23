From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 23 (hwmon/coretemp.c)
Date: Mon, 23 May 2011 10:49:58 -0700
Message-ID: <20110523104958.98ef4d1a.randy.dunlap@oracle.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:57619 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755574Ab1EWRvQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 13:51:16 -0400
In-Reply-To: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rudolf Marek <r.marek@assembler.cz>, lm-sensors@lm-sensors.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Fenghua Yu <fenghua.yu@intel.com>

On Mon, 23 May 2011 15:45:18 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20110520:

when CONFIG_SMP is not enabled:

drivers/hwmon/coretemp.c:765: error: implicit declaration of function 'cpu_sibling_mask'


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
