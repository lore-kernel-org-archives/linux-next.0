From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Date: Thu, 7 Sep 2017 19:21:01 +0300
Message-ID: <20170907162101.rxacve5xsnvan3qs@linux.intel.com>
References: <20170907123132.1fef5ca8@canb.auug.org.au>
 <a14159a4-5bb6-ce63-3dcb-985b4247adf6@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59516 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932083AbdIGQVT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 Sep 2017 12:21:19 -0400
Content-Disposition: inline
In-Reply-To: <a14159a4-5bb6-ce63-3dcb-985b4247adf6@canonical.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Colin Ian King <colin.king@canonical.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Colin, Stephen,

Thank you. I'll apply Colin's fix.

/Jarkko

On Thu, Sep 07, 2017 at 09:43:37AM +0100, Colin Ian King wrote:
> Thanks for reporting that Stephen, I've sent a fix to address this issue.
> 
> Colin
> 
> On 07/09/17 03:31, Stephen Rothwell wrote:
> > Hi Jarkko,
> > 
> > After merging the tpmdd tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > drivers/char/tpm/tpm_tis_core.c: In function 'probe_itpm':
> > drivers/char/tpm/tpm_tis_core.c:469:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> >   rc = tpm_tis_send_data(chip, cmd_getticks, len);
> >                                ^
> > drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
> >  static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
> >             ^
> > drivers/char/tpm/tpm_tis_core.c:477:31: warning: passing argument 2 of 'tpm_tis_send_data' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> >   rc = tpm_tis_send_data(chip, cmd_getticks, len);
> >                                ^
> > drivers/char/tpm/tpm_tis_core.c:255:12: note: expected 'u8 * {aka unsigned char *}' but argument is of type 'const u8 * {aka const unsigned char *}'
> >  static int tpm_tis_send_data(struct tpm_chip *chip, u8 *buf, size_t len)
> >             ^
> > 
> > Introduced by commit
> > 
> >   5e35bd8e06b9 ("tpm_tis: make array cmd_getticks static const to shink object code size")
> > 
> 
