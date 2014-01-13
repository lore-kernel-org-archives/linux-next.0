From: Chris Ball <chris@printf.net>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Mon, 13 Jan 2014 17:49:35 +0000
Message-ID: <86iotndb68.fsf@void.printf.net>
References: <20131213125716.f432c59bf8782a489400a5a7@canb.auug.org.au>
	<20131217132838.cc16a4dbac2f4d3218bbed1d@canb.auug.org.au>
	<CAA+hA=Shwn1P25+xB+VogD+9n7gdvCmJ-EG6khgf3a2gjGwTJQ@mail.gmail.com>
	<20131217031600.GG6691@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from void.printf.net ([89.145.121.20]:35041 "EHLO void.printf.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752228AbaAMRtl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jan 2014 12:49:41 -0500
In-Reply-To: <20131217031600.GG6691@S2101-09.ap.freescale.net> (Shawn Guo's
	message of "Tue, 17 Dec 2013 11:16:01 +0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Dong Aisheng <dongas86@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng <b29396@freescale.com>

Hi,

On Tue, Dec 17 2013, Shawn Guo wrote:
> Please drop fc4fafac9656 ("ARM: dts: sabresd: add usdhc4 support") from
> your tree.  It should go via my tree (with a rebase).  Sorry, I did not
> notice it early.

Sorry for missing this thread, everyone -- I've dropped this patch
from mmc-next now.

- Chris.
-- 
Chris Ball   <chris@printf.net>   <http://printf.net/>
