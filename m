From: ian <spyro@f2s.com>
Subject: Re: linux-next: mfd tree build failure
Date: Tue, 05 Aug 2008 19:50:09 +0100
Message-ID: <1217962209.18866.38.camel@wirenth>
References: <20080806000856.a5609577.sfr@canb.auug.org.au>
	 <1217950794.18866.32.camel@wirenth>
	 <20080805160524.GE22895@cs181140183.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mk-outboundfilter-5.mail.uk.tiscali.com ([212.74.114.1]:34844
	"EHLO mk-outboundfilter-5.mail.uk.tiscali.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756622AbYHESuL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Aug 2008 14:50:11 -0400
In-Reply-To: <20080805160524.GE22895@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@openedhand.com>, linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, 2008-08-05 at 19:05 +0300, Adrian Bunk wrote:
> 
> The "Multifunction device drivers" menu depends on HAS_IOMEM.

Actually, this is wrong, it shouldnt.
