From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tpmdd tree
Date: Tue, 2 Jan 2018 13:50:48 +1100
Message-ID: <20180102135048.09b3338b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55371 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751478AbeABCuu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Jan 2018 21:50:50 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Azhar Shaikh <azhar.shaikh@intel.com>

Hi Jarkko,

After merging the tpmdd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/tpm/tpm_tis.c: In function 'tpm_tis_pnp_remove':
drivers/char/tpm/tpm_tis.c:274:23: warning: unused variable 'priv' [-Wunused-variable]
  struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
                       ^
drivers/char/tpm/tpm_tis.c: In function 'tpm_tis_plat_remove':
drivers/char/tpm/tpm_tis.c:324:23: warning: unused variable 'priv' [-Wunused-variable]
  struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
                       ^

Introduced by commit

  6d0866cbc2d3 ("tpm: Keep CLKRUN enabled throughout the duration of transmit_cmd()")

-- 
Cheers,
Stephen Rothwell
