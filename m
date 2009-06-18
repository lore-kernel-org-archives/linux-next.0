From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for June 11 (cnic)
Date: Thu, 18 Jun 2009 15:46:20 +0530
Message-ID: <20090618101620.GB16657@linux.vnet.ibm.com>
References: <20090611191420.1f4d5e4f.sfr@canb.auug.org.au> <4A318358.20804@oracle.com>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp03.in.ibm.com ([59.145.155.3]:48157 "EHLO
	e28smtp03.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756815AbZFRKQU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2009 06:16:20 -0400
Content-Disposition: inline
In-Reply-To: <4A318358.20804@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>

* Randy Dunlap <randy.dunlap@oracle.com> [2009-06-11 15:21:12]:

> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090610:
> 
> 
> In 2 separate builds:
> 
> ERROR: "ip_route_output_key" [drivers/net/cnic.ko] undefined!
> 
> when CONFIG_INET=n
> 
> and
> 
> drivers/net/cnic.c:2520: error: implicit declaration of function '__symbol_get'
> 
> when CONFIG_MODULES=n

this build failure is also visible with 20090618.
> 
> 
> -- 
> ~Randy
> LPC 2009, Sept. 23-25, Portland, Oregon
> http://linuxplumbersconf.org/2009/

-- 
Kamalesh
