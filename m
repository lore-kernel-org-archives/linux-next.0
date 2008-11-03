From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: next-20081103: error: asm/ftrace.h: No such file or directory
Date: Mon, 3 Nov 2008 16:58:14 +0300
Message-ID: <20081103135814.GB3432@x200.localdomain>
References: <20081103183214.aac32543.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.188]:15953 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754104AbYKCNy6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 3 Nov 2008 08:54:58 -0500
Content-Disposition: inline
In-Reply-To: <20081103183214.aac32543.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, srostedt@redhat.com

Alpha is busted:

  CC      init/main.o
In file included from include/linux/interrupt.h:12,
                 from include/linux/rtc.h:102,
                 from include/linux/efi.h:19,
                 from init/main.c:45:
include/linux/hardirq.h:8:24: error: asm/ftrace.h: No such file or directory
