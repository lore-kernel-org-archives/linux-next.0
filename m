From: "Shaikh, Azhar" <azhar.shaikh@intel.com>
Subject: RE: linux-next: build warning after merge of the tpmdd tree
Date: Tue, 2 Jan 2018 04:05:49 +0000
Message-ID: <5FFFAD06ADE1CA4381B3F0F7C6AF5828989FE8@ORSMSX109.amr.corp.intel.com>
References: <20180102135048.09b3338b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180102135048.09b3338b@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

Thanks for reporting this.

I have uploaded new patchset to tpmdd mailing list.

Regards,
Azhar Shaikh

>-----Original Message-----
>From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
>Sent: Monday, January 1, 2018 6:51 PM
>To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mailing
>List <linux-kernel@vger.kernel.org>; Shaikh, Azhar <azhar.shaikh@intel.com>
>Subject: linux-next: build warning after merge of the tpmdd tree
>
>Hi Jarkko,
>
>After merging the tpmdd tree, today's linux-next build (x86_64
>allmodconfig) produced this warning:
>
>drivers/char/tpm/tpm_tis.c: In function 'tpm_tis_pnp_remove':
>drivers/char/tpm/tpm_tis.c:274:23: warning: unused variable 'priv' [-
>Wunused-variable]
>  struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
>                       ^
>drivers/char/tpm/tpm_tis.c: In function 'tpm_tis_plat_remove':
>drivers/char/tpm/tpm_tis.c:324:23: warning: unused variable 'priv' [-
>Wunused-variable]
>  struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
>                       ^
>
>Introduced by commit
>
>  6d0866cbc2d3 ("tpm: Keep CLKRUN enabled throughout the duration of
>transmit_cmd()")
>
>--
>Cheers,
>Stephen Rothwell
