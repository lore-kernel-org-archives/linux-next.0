From: Colin Ian King <colin.king@canonical.com>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Date: Thu, 7 Sep 2017 09:43:37 +0100
Message-ID: <a14159a4-5bb6-ce63-3dcb-985b4247adf6@canonical.com>
References: <20170907123132.1fef5ca8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60591 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754776AbdIGInj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Sep 2017 04:43:39 -0400
In-Reply-To: <20170907123132.1fef5ca8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Thanks for reporting that Stephen, I've sent a fix to address this issue.

Colin

On 07/09/17 03:31, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> After merging the tpmdd tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/char/tpm/tpm_tis_core.c: In function 'probe_itpm':
> drivers/char/tpm/tpm_tis_core.c:469:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   rc = tpm_tis_send_data(chip, cmd_getticks, len);
>                                ^
> drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
>  static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
>             ^
> drivers/char/tpm/tpm_tis_core.c:477:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>   rc = tpm_tis_send_data(chip, cmd_getticks, len);
>                                ^
> drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
>  static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
>             ^
> 
> Introduced by commit
> 
>   5e35bd8e06b9 ("tpm_tis: make array cmd_getticks static const to shink object code size")
> 
