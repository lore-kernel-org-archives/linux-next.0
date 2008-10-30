From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 30
Date: Thu, 30 Oct 2008 16:55:32 -0700
Message-ID: <20081030165532.802375f8.randy.dunlap@oracle.com>
References: <20081030173030.d8847df6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from agminet01.oracle.com ([141.146.126.228]:58350 "EHLO
	agminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752946AbYJ3X4C (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 19:56:02 -0400
In-Reply-To: <20081030173030.d8847df6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh <greg@kroah.com>

On Thu, 30 Oct 2008 17:30:30 +1100 Stephen Rothwell wrote:


Greg told me that he would fix these, but they are still around:

drivers/staging/poch/poch.c:388: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'

drivers/usb/misc/vstusb.c:623: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'


Otherwise it's a quiet randconfig tree.  Must be short of new commits.  ;)

---
~Randy
