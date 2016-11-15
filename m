From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tpmdd tree
Date: Tue, 15 Nov 2016 12:01:07 +1100
Message-ID: <20161115120107.35e7db48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53631 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755161AbcKOBBL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 20:01:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nayna Jain <nayna@linux.vnet.ibm.com>

Hi Jarkko,

After merging the tpmdd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/tpm/tpm_of.c: In function 'read_log_of':
drivers/char/tpm/tpm_of.c:37:8: warning: 'np' may be used uninitialized in this function [-Wmaybe-uninitialized]
  sizep = of_get_property(np, "linux,sml-size", NULL);
        ^

Introduced by commit

  4a45d9669ac1 ("tpm: replace of_find_node_by_name() with dev of_node property")

This commit is just wrong :-(

-- 
Cheers,
Stephen Rothwell
