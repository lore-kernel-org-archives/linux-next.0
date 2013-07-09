From: "Nikolova, Tatyana E" <tatyana.e.nikolova@intel.com>
Subject: RE: linux-next: build warnings in Linus' tree
Date: Tue, 9 Jul 2013 21:48:43 +0000
Message-ID: <13AA599688F47243B14FCFCCC2C803BB0D81E71E@FMSMSX104.amr.corp.intel.com>
References: <20130704145852.44975d5801f592d00807d1c0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:4643 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752704Ab3GIVso convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jul 2013 17:48:44 -0400
In-Reply-To: <20130704145852.44975d5801f592d00807d1c0@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Roland Dreier <roland@purestorage.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello Stephen,

Thank you for reporting the error. I removed these variables from the debug statement, because I didn't see that they were defined. It is possible that I manually enabled the nes_debug and the #ifdef CONFIG_INFINIBAND_NES_DEBUG statement these variables are enclosed in wasn't true, so I saw a compilation issue.

Feel free to revert the commit bca1935ccdec ("RDMA/nes: Fix compilation error when nes_debug is enabled") or I will submit a patch to address the issue next week.

Regards,
Tatyana

-----Original Message-----
From: Stephen Rothwell [mailto:sfr@canb.auug.org.au] 
Sent: Wednesday, July 03, 2013 11:59 PM
To: Roland Dreier
Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Nikolova, Tatyana E
Subject: linux-next: build warnings in Linus' tree

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allmodconfig) produced this warning (these have been around for a while):

drivers/infiniband/hw/nes/nes_hw.c:81:23: warning: 'nes_iwarp_state_str' defined but not used [-Wunused-variable]  static unsigned char *nes_iwarp_state_str[] = {
                       ^
drivers/infiniband/hw/nes/nes_hw.c:92:23: warning: 'nes_tcp_state_str' defined but not used [-Wunused-variable]  static unsigned char *nes_tcp_state_str[] = {
                       ^

Introduced by commit bca1935ccdec ("RDMA/nes: Fix compilation error when nes_debug is enabled").

--
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
