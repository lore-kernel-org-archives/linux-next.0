From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the renesas tree with the arm-soc tree
Date: Mon, 27 Jul 2015 09:27:19 +1000
Message-ID: <20150727092719.22e43573@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59209 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755033AbbGZX1V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Jul 2015 19:27:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Magnus Damm <damm+renesas@opensource.se>

Hi Simon,

Today's linux-next merge of the renesas tree got a conflict in:

  arch/arm/mach-shmobile/setup-r8a7779.c

between commit:

  3017a8804ada ("ARM: appropriate __init annotation for const data")

from the arm-soc tree and commit:

  131c2e0480b0 ("ARM: shmobile: r8a7779: Generic CCF and timer suppor")

from the renesas tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-shmobile/setup-r8a7779.c
index 2321c9de2274,c18d85a96c67..000000000000
--- a/arch/arm/mach-shmobile/setup-r8a7779.c
+++ b/arch/arm/mach-shmobile/setup-r8a7779.c
@@@ -756,7 -96,13 +96,13 @@@ static u32 __init r8a7779_read_mode_pin
  	return mode;
  }
  
+ static void __init r8a7779_init_time(void)
+ {
+ 	r8a7779_clocks_init(r8a7779_read_mode_pins());
+ 	clocksource_of_init();
+ }
+ 
 -static const char *r8a7779_compat_dt[] __initdata = {
 +static const char *r8a7779_compat_dt[] __initconst = {
  	"renesas,r8a7779",
  	NULL,
  };
