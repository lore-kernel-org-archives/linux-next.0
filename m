From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 27 (infiniband: qib)
Date: Thu, 27 May 2010 09:05:03 -0700
Message-ID: <20100527090503.d229dc53.randy.dunlap@oracle.com>
References: <20100527152628.b23a14c6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:59970 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831Ab0E0QGG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 27 May 2010 12:06:06 -0400
In-Reply-To: <20100527152628.b23a14c6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ralph Campbell <ralph.campbell@qlogic.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-rdma@vger.kernel.org

On Thu, 27 May 2010 15:26:28 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> We are in the merge window again.  I remind you all not to add stuff for
> 2.6.36 to your linux-next trees until after 2.6.35-rc1.
> 
> Changes since 20100526:


when CONFIG_INFINIBAND_QIB=y and CONFIG_DCA=m:

drivers/built-in.o: In function `qib_update_sdma_dca':
qib_iba7322.c:(.text+0x409219): undefined reference to `dca3_get_tag'
drivers/built-in.o: In function `qib_update_rhdrq_dca':
qib_iba7322.c:(.text+0x40a1f9): undefined reference to `dca3_get_tag'
drivers/built-in.o: In function `qib_setup_7322_cleanup':
qib_iba7322.c:(.text+0x40f91f): undefined reference to `dca_remove_requester'
drivers/built-in.o: In function `qib_init_iba7322_funcs':
(.text+0x419b6f): undefined reference to `dca_add_requester'


However, it looks like qib needs to handle DCA config in a way that
is similar to how it is handled in drivers/net/{myri10ge,igb,ixgbe}/
instead of assuming that DCA is enabled.


And please fix the linux-next 2010-may-25 reported qib problem:
  http://lkml.org/lkml/2010/5/25/321

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
