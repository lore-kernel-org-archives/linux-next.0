From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Wed, 3 May 2017 08:14:25 +1000
Message-ID: <20170503081425.3b4199b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751270AbdEBWO3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 May 2017 18:14:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans-Christian Noren Egtvedt <egtvedt@samfundet.no>, =?UTF-8?B?SMOldmFyZA==?= Skinnemoen <hskinnemoen@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>

Hi Masahiro,

Today's linux-next merge of the kbuild tree got a conflict in:

  arch/avr32/include/uapi/asm/Kbuild

between commit:

  26202873bb51 ("avr32: remove support for AVR32 architecture")

from Linus' tree and commit:

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree.

I fixed it up (I removed the file) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
