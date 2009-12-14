From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: sparc tree build warning
Date: Sun, 13 Dec 2009 23:40:36 -0800 (PST)
Message-ID: <20091213.234036.26987805.davem@davemloft.net>
References: <20091214163338.f811722f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:39497
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751250AbZLNHkg (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Dec 2009 02:40:36 -0500
In-Reply-To: <20091214163338.f811722f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 14 Dec 2009 16:33:38 +1100

>     inlined from 'pktgen_if_write' at net/core/pktgen.c:867:
> arch/sparc/include/asm/uaccess_32.h:276: warning: call to 'copy_from_user_overflow' declared with attribute warning: copy_from_user() buffer size is not provably correct

BTW, you should be getting the same exact warnings on x86
32-bit with gcc-4.4 or later.
