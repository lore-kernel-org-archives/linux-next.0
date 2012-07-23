From: Mark Salter <msalter@redhat.com>
Subject: linux-next link failure
Date: Mon, 23 Jul 2012 14:16:49 -0400
Message-ID: <1343067410.3672.8.camel@deneb.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:21357 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754085Ab2GWSQy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 Jul 2012 14:16:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mel Gorman <mgorman@suse.de>
Cc: linux-next <linux-next@vger.kernel.org>

Today's linux-next has a link failure on no-mmu systems:

  fs/built-in.o: In function `nfs_file_direct_read':
  (.text+0x80968): undefined reference to `get_kernel_page'
  fs/built-in.o: In function `nfs_file_direct_write':
  (.text+0x81178): undefined reference to `get_kernel_page'

The problem is that get_kernel_page does not exist if CONFIG_MMU is not
defined. This is the patch that added get_kernel_page():

  mm: add get_kernel_page[s] for pinning of kernel addresses for I/O

and the reference to get_kernelpage was added with:

  nfs: enable swap on NFS

--Mark
