From: Len Brown <lenb@kernel.org>
Subject: Re: [SFI-devel] linux-next: sfi tree build warning
Date: Wed, 08 Jul 2009 11:26:48 -0400 (EDT)
Message-ID: <alpine.LFD.2.00.0907081123360.9604@localhost.localdomain>
References: <20090708164400.f2138d79.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from vms173003pub.verizon.net ([206.46.173.3]:49182 "EHLO
	vms173003pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753821AbZGHP1M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2009 11:27:12 -0400
In-reply-to: <20090708164400.f2138d79.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: sfi-devel@simplefirmware.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


> Today's linux-next build (x86_64 allmodconfig) produced this warning:

ah good, this means the SFI tree actually made it into linux-next:-)

> arch/x86/kernel/sfi.c: In function 'sfi_init_memory_map':
> arch/x86/kernel/sfi.c:99: warning: cast to pointer from integer of different size
> arch/x86/kernel/sfi.c:100: warning: cast to pointer from integer of different size

This should go away when you pull the patch below for tomorrow's build.

thanks,
Len Brown, Intel Open Source Technology Center


commit 6a099c4dfc3e3fa95e55ea13ce836a6ed98ee689
Author: Feng Tang <feng.tang@intel.com>
Date:   Wed Jul 8 17:35:45 2009 +0800

    SFI: fix the compile warning for x86_64
