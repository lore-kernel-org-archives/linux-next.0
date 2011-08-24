From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the fbdev tree
Date: Tue, 23 Aug 2011 21:48:56 -0700
Message-ID: <20110824044856.GA1122@kroah.com>
References: <20110824144134.00bd3a688fb39b5d5563ff13@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:43349 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750754Ab1HXEuf (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Aug 2011 00:50:35 -0400
Content-Disposition: inline
In-Reply-To: <20110824144134.00bd3a688fb39b5d5563ff13@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Mundt <lethal@linux-sh.org>

On Wed, Aug 24, 2011 at 02:41:34PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/xgifb/XGI_main_26.c between commit c42a3d543d2b
> ("staging: xgifb: use display information in info not in var for
> panning") from the fbdev tree and commit c39aada6926c ("staging: xgifb:
> eliminate #ifdef XGIFB_PAN") from the staging tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Wonderful, thanks for the fix.

greg k-h
