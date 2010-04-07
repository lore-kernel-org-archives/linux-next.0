From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 7 (other build fixes)
Date: Wed, 7 Apr 2010 10:15:46 -0700
Message-ID: <20100407101546.0c41e418.randy.dunlap@oracle.com>
References: <20100407174123.81b32310.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:46343 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758073Ab0DGRP6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2010 13:15:58 -0400
In-Reply-To: <20100407174123.81b32310.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 7 Apr 2010 17:41:23 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100401:
> 
> My fixes tree contains:
> 	a patch for a pktcdvd build error from Arnd Bergmann
> 	a fix for the commit that broke virtual consoles on PowerPC


My fixes series (not-a-tree) contains:
. build fix for gspca=m, INPUT=[mn] (from me)
. build fix for hid-picolcd=y and other dependencies=m (from bonbons@linux-vserver.org)
. build fix for staging/dt3155/ when builtin (from me)
. build fix for usbserial generic.c when CONFIG_MAGIC_SYSRQ is not enabled (from me)
. build fix for xen/manage.c when CONFIG_MAGIC_SYSRQ is not enabled (from me)


---
~Randy
