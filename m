From: Mark Salter <msalter@redhat.com>
Subject: linux-next build failure
Date: Fri, 03 Jan 2014 10:58:49 -0500
Message-ID: <1388764729.2564.32.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:19459 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750947AbaACP6v (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jan 2014 10:58:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, jmarchan@redhat.com

The c6x arch (no MMU) is failing to build in linux-next with:

  kernel/built-in.o:(.fardata+0x3fc): undefined reference to `overcommit_ratio_handler'
  kernel/built-in.o:(.fardata+0x420): undefined reference to `overcommit_kbytes_handler'
  make[1]: *** [vmlinux] Error 1

Looks like this patch adds those functions to mm/mmap.c which
is only used when CONFIG_MMU is defined.

  commit 31bdaf7c8e8a784fd8f889371bdacb24670734c7
  Author: Jerome Marchand <jmarchan@redhat.com>
  Date:   Tue Dec 17 10:45:06 2013 +1100

      mm: add overcommit_kbytes sysctl variable
    
