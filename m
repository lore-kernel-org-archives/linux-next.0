From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Wed, 30 Aug 2017 23:07:12 +1000
Message-ID: <20170830230712.55db7911@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751345AbdH3NHO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 30 Aug 2017 09:07:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Rezvanov <dmitry.rezvanov@yandex.ru>, Alexandre Belloni <alexandre.belloni@free-electrons.com>

Hi all,

Commit

  1a9f9af07e80 ("ARM: dts: at91: at91sam9g45: add AC97")

is missing a Signed-off-by from its author.

-- 
Cheers,
Stephen Rothwell
