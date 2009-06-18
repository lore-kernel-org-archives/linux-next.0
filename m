From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/2] Revert and reimplement Add SGMII support to UCC
 GETH
Date: Wed, 17 Jun 2009 18:53:38 -0700 (PDT)
Message-ID: <20090617.185338.20860763.davem@davemloft.net>
References: <20090617231306.7051.56146.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51079
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752131AbZFRBxe (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2009 21:53:34 -0400
In-Reply-To: <20090617231306.7051.56146.stgit@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: grant.likely@secretlab.ca
Cc: sfr@canb.auug.org.au, subrata@linux.vnet.ibm.com, netdev@vger.kernel.org, galak@kernel.crashing.org, leoli@freescale.com, ntl@pobox.com, sachinp@linux.vnet.ibm.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, balbir@linux.vnet.ibm.com, Linuxppc-dev@ozlabs.org, tony@bakeyournoodle.com, michael@ellerman.id.au, Haiying.Wang@freescale.com

From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 17 Jun 2009 17:15:58 -0600

> (REPOST; I messed up an email address first time around and apparently my
> posting got rejected.  If you've already received this message, then
> I apologize for the noise)
> 
> Here is a fix for the build failure discovered during the 2.6.31 merge
> window on ucc_geth.c.  I decided to revert and reapply a fixed version
> of the patch to make the new version easier to review and bisect if I
> got the fixup wrong.  I've compile tested both patches, but I do not have
> hardware to run test.
> 
> Haiying, please confirm that I haven't horribly trashed your hard work
> with my changes.

I've applied these to net-next-2.6, thanks!
