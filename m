From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Date: Wed, 27 Sep 2017 09:25:48 +1000
Message-ID: <20170927092548.45760bef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40039 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964864AbdIZXZv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Sep 2017 19:25:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Steffen <Alexander.Steffen@infineon.com>

Hi Jarkko,

Commit

  254a616c7425 ("tpm_tis_spi: Use DMA-safe memory for SPI transfers")

is missing a Signed-off-by from its committer.

-- 
Cheers,
Stephen Rothwell
