From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for March 26 (benet)
Date: Thu, 26 Mar 2009 08:46:25 -0700
Message-ID: <49CBA351.2000007@oracle.com>
References: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:28412 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753777AbZCZPrF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2009 11:47:05 -0400
In-Reply-To: <20090326190130.54fc6fde.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, linux-drivers@serverengines.com

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090325:


on i386 build:

drivers/built-in.o: In function `be_worker':
be_main.c:(.text+0x827c7): undefined reference to `__udivdi3'
be_main.c:(.text+0x8286c): undefined reference to `__udivdi3'


Probably one of the called functions (that contains
division) is inlined.


-- 
~Randy
