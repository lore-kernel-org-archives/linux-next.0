From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the watchdog tree with Linus' tree
Date: Mon, 27 Nov 2017 11:06:48 +1100
Message-ID: <20171127110648.56946adf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58015 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752097AbdK0AGu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Nov 2017 19:06:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Guenter Roeck <linux@roeck-us.net>

Hi Wim,

Today's linux-next merge of the watchdog tree got a conflict in:

  drivers/watchdog/mpc8xxx_wdt.c

between commit:

  e99e88a9d2b0 ("treewide: setup_timer() -> timer_setup()")

from Linus' tree and commit:

  fbdec655375c ("watchdog: mpc8xxx: use the core worker function")

from the watchdog tree.

I fixed it up (I used the latter which removed the setup_timer call) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
