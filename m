From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Tue, 22 May 2012 19:46:22 -0400
Message-ID: <20120522234621.GA3610@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:50303 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932988Ab2EVXrJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 May 2012 19:47:09 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Viresh Kumar <viresh.kumar@st.com>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org

Hi Viresh,

The above listed commit, in linux-next as:

commit ebbf0cb5d39cc3e22ef4c425475e76b7f45027de

    "clk: add non CONFIG_HAVE_CLK routines"

shows up as failures in the netx_defconfig, since there
are duplicate stub functions between your changes and the
file below:

  arch/arm/mach-netx/fb.c:72:6: error: redefinition of 'clk_disable'
  include/linux/clk.h:299:51: note: previous definition of 'clk_disable' was here
  arch/arm/mach-netx/fb.c:76:5: error: redefinition of 'clk_set_rate'
  include/linux/clk.h:306:50: note: previous definition of 'clk_set_rate' was here
  arch/arm/mach-netx/fb.c:81:5: error: redefinition of 'clk_enable'
  include/linux/clk.h:294:50: note: previous definition of 'clk_enable' was here
  arch/arm/mach-netx/fb.c:86:13: error: redefinition of 'clk_get'
  include/linux/clk.h:280:58: note: previous definition of 'clk_get' was here
  arch/arm/mach-netx/fb.c:91:6: error: redefinition of 'clk_put'
  include/linux/clk.h:290:51: note: previous definition of 'clk_put' was here
  make[2]: *** [arch/arm/mach-netx/fb.o] Error 1

Can you have a look please, and delete the overlap?

Thanks,
Paul.
