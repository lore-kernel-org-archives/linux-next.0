From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: linux-next: manual merge of the sh tree with Linus' tree
Date: Mon, 8 Aug 2011 16:26:00 +0900
Message-ID: <20110808072559.GG32513@linux-sh.org>
References: <20110808123627.2c151560593ead828dd2f001@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from linux-sh.org ([111.68.239.195]:42584 "EHLO linux-sh.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753224Ab1HHH0f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Aug 2011 03:26:35 -0400
Content-Disposition: inline
In-Reply-To: <20110808123627.2c151560593ead828dd2f001@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Mon, Aug 08, 2011 at 12:36:27PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the sh tree got a conflict in
> drivers/tty/serial/sh-sci.c between commit fc97114b8d67 ("sh: Fix boot
> crash related to SCI") from Linus' tree and commit ad75b88ac379 ("serial:
> sh-sci: Fix up default regtype probing") from the sh tree.
> 
> These do the same thing slightly differently ("ret" v. "ret != 0").  I
> used the version from Linus' tree.

I've done the same, should be fixed for tomorrow, thanks.
