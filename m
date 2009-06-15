From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: scsi tree build failure
Date: Tue, 16 Jun 2009 07:40:00 +1000
Message-ID: <1245102000.12400.44.camel@pasglop>
References: <20090615121716.c5bc0655.sfr@canb.auug.org.au>
	 <1245078707.3858.0.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:41019 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754617AbZFOVxe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 17:53:34 -0400
In-Reply-To: <1245078707.3858.0.camel@mulgrave.site>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

On Mon, 2009-06-15 at 10:11 -0500, James Bottomley wrote:
> OK, dumped the offending patch, so it should be safe to take scsi-misc
> again.
> 
> I'm so used to merging these type of conversions, I didn't check that
> it
> was using a ps3 specific wrapper instead of a generic device one.

Do I have your Ack to merge the patch via the powerpc tree ?

Cheers,
Ben.
