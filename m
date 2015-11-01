From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the y2038 tree with the staging tree
Date: Mon, 2 Nov 2015 01:44:49 +1100
Message-ID: <20151102014449.5ae120ab@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44833 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752500AbbKAOox (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 09:44:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Deepa Dinamani <deepa.kernel@gmail.com>, Tapasweni Pathak <tapaswenipathak@gmail.com>

Hi Arnd,

Today's linux-next merge of the y2038 tree got conflicts in:

  drivers/staging/ft1000/ft1000-pcmcia/ft1000_hw.c
  drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
  drivers/staging/ft1000/ft1000-usb/ft1000_hw.c
  drivers/staging/ft1000/ft1000.h

between commit:

  6512edec48b2 ("staging: ft1000: remove obsolete driver")

from the staging tree and commit:

  8b37bf430656 ("staging: ft1000: Replace timeval and time_t with time64_t")

from the y2038 tree.

I fixed it up (the former removed the files) and can carry the fix as
necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
