From: Christoph Fritz <chf.fritz@googlemail.com>
Subject: Re: [BUG -next] pcmcia: setup IRQ to be used by PCMCIA drivers at
 card insert
Date: Tue, 03 Aug 2010 12:23:28 +0200
Message-ID: <1280831008.3034.2.camel@lovely.krouter>
References: <1280795899.11158.52.camel@lovely.krouter>
	 <20100803061716.GB9716@isilmar-3.linta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:47344 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755521Ab0HCKU2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2010 06:20:28 -0400
Received: by wyb39 with SMTP id 39so4211574wyb.19
        for <linux-next@vger.kernel.org>; Tue, 03 Aug 2010 03:20:26 -0700 (PDT)
In-Reply-To: <20100803061716.GB9716@isilmar-3.linta.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next <linux-next@vger.kernel.org>

On Tue, 2010-08-03 at 08:17 +0200, Dominik Brodowski wrote:
> Hey,
> 
> On Tue, Aug 03, 2010 at 02:38:19AM +0200, Christoph Fritz wrote:
> > buffer overflow in next-tree's commit 6f0f38c45a8f2f511c25893e33011ff32fc811db:
> 
> this bug is not only present in -next, but also in every 2.6 stable kernel
> released -- the commit you mention merely moved code around.
> 
> > non-tested fix:
> 
> could I get your Signed-off-by, please?

sure, 
 you can add a
Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
 to the patches.

thanks,
 chf
