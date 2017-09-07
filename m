From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tpmdd tree
Date: Thu, 7 Sep 2017 12:31:32 +1000
Message-ID: <20170907123132.1fef5ca8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Colin Ian King <colin.king@canonical.com>
List-Id: linux-next.vger.kernel.org

Hi Jarkko,

After merging the tpmdd tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/tpm/tpm_tis_core.c: In function 'probe_itpm':
drivers/char/tpm/tpm_tis_core.c:469:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  rc = tpm_tis_send_data(chip, cmd_getticks, len);
                               ^
drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
 static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
            ^
drivers/char/tpm/tpm_tis_core.c:477:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
  rc = tpm_tis_send_data(chip, cmd_getticks, len);
                               ^
drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
 static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
            ^

Introduced by commit

  5e35bd8e06b9 ("tpm_tis: make array cmd_getticks static const to shink object code size")

-- 
Cheers,
Stephen Rothwell
