From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the akpm-current tree
Date: Fri, 29 Apr 2016 16:45:43 +1000
Message-ID: <20160429164543.039df436@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38235 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752817AbcD2Gpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 02:45:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Quinn Tran <quinn.tran@qlogic.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/scsi/ipr.c: In function 'ipr_show_device_id':
drivers/scsi/ipr.c:4462:34: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
   len = snprintf(buf, PAGE_SIZE, "0x%llx\n", be64_to_cpu(res->dev_id));
                                  ^

Lots and lots like this :-(

Probably introduced by commit

  eef17fb79096 ("byteswap: try to avoid __builtin_constant_p gcc bug")

I guess __builtin_bswap64() has type "unsigned long int" :-(

-- 
Cheers,
Stephen Rothwell
