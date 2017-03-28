From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the char-misc tree
Date: Tue, 28 Mar 2017 14:31:34 +1100
Message-ID: <20170328143134.186d91e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50205 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753884AbdC1Dbm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Mar 2017 23:31:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cyril Bur <cyrilbur@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

./usr/include/linux/aspeed-lpc-ctrl.h:44: found __[us]{8,16,32,64} type without #include <linux/types.h>

Introduced by commit

  6c4e97678501 ("drivers/misc: Add Aspeed LPC control driver")

Probably exposed by commit

  65017bab8a9e ("uapi: export all headers under uapi directories")

from the kbuild tree (since this header had not been explicitly exported).

-- 
Cheers,
Stephen Rothwell
