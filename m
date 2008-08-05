From: ian <spyro@f2s.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 05 Aug 2008 19:46:18 +0100
Message-ID: <1217961978.18866.36.camel@wirenth>
References: <20080806000856.a5609577.sfr@canb.auug.org.au>
	 <1217950794.18866.32.camel@wirenth>
	 <20080806020540.c22b1fa0.sfr@canb.auug.org.au>
	 <20080805160840.GC6335@caravaggio>
	 <20080806021614.965a5389.sfr@canb.auug.org.au>
	 <20080805174047.GE6335@caravaggio>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mk-outboundfilter-3.mail.uk.tiscali.com ([212.74.114.23]:6533
	"EHLO mk-outboundfilter-3.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757580AbYHESqX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 14:46:23 -0400
In-Reply-To: <20080805174047.GE6335@caravaggio>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Samuel Ortiz <sameo@openedhand.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, 2008-08-05 at 19:40 +0200, Samuel Ortiz wrote:
> 
> All TMIO devices depend on ARM, and the MMC and NAND drivers now
> depend on a new symbol (MFD_TMIO) selected when choosing one of the
> TMIO devices.

Sounds good.

Whens the merge date for mainline btw ?
