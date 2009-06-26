From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for June 26 (cyclades)
Date: Fri, 26 Jun 2009 09:04:29 -0700
Message-ID: <4A44F18D.2000608@oracle.com>
References: <20090626154605.ac73b738.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:52191 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750747AbZFZQEg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2009 12:04:36 -0400
In-Reply-To: <20090626154605.ac73b738.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090625:


drivers/char/cyclades.c:3332: error: assignment of read-only location

(it's const)


-- 
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
