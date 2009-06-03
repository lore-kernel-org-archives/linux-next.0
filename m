From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: manual merge of the usb tree with the ttydev tree
Date: Wed, 3 Jun 2009 09:55:47 +0100
Message-ID: <20090603095547.1641ca7b@lxorguk.ukuu.org.uk>
References: <20090603180734.f175e04f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:52362 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751985AbZFCIzn (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2009 04:55:43 -0400
In-Reply-To: <20090603180734.f175e04f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Craig Shelley <craig@microtron.org.uk>

> As a side issue, the last patch has no SOB from Craig in the ttydev tree.

Yes it does...

    Signed-off-by: Craig Shelley <craig@microtron.org.uk>
    
    (Fixed some collisions merging)
    
    Signed-off-by: Alan Cox <alan@linux.intel.com>


> So, I just used the ttydev tree version on the assumption that my
> reasoning above is correct.

and the ttydev tree one is the one to use
