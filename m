From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: scsi tree build failure
Date: Mon, 15 Jun 2009 22:24:37 -0400
Message-ID: <1245119077.3858.51.camel@mulgrave.site>
References: <20090615121716.c5bc0655.sfr@canb.auug.org.au>
	 <1245078707.3858.0.camel@mulgrave.site> <1245102000.12400.44.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:55760 "EHLO
	bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751709AbZFPCZy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Jun 2009 22:25:54 -0400
In-Reply-To: <1245102000.12400.44.camel@pasglop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

On Tue, 2009-06-16 at 07:40 +1000, Benjamin Herrenschmidt wrote:
> On Mon, 2009-06-15 at 10:11 -0500, James Bottomley wrote:
> > OK, dumped the offending patch, so it should be safe to take scsi-misc
> > again.
> > 
> > I'm so used to merging these type of conversions, I didn't check that
> > it
> > was using a ps3 specific wrapper instead of a generic device one.
> 
> Do I have your Ack to merge the patch via the powerpc tree ?

Ack

James
