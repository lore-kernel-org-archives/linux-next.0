From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: manual merge of the tpmdd tree with Linus' tree
Date: Fri, 13 Oct 2017 23:15:12 +0300
Message-ID: <1507925712.29065.0.camel@linux.intel.com>
References: <20171011150107.vft64nx3kccndjlj@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:13610 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751394AbdJMUPR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Oct 2017 16:15:17 -0400
In-Reply-To: <20171011150107.vft64nx3kccndjlj@sirena.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Hamza Attak <hamza@hpe.com>, James Morris <james.l.morris@oracle.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, 2017-10-11 at 16:01 +0100, Mark Brown wrote:
> Hi Jarkko,
> 
> Today's linux-next merge of the tpmdd tree got a conflict in:
> 
>   drivers/char/tpm/tpm2-cmd.c
> 
> between commit:
> 
>    9f3fc7bcddcb51 ("tpm: replace msleep() with  usleep_range() in TPM 1.2/2.0 generic drivers")
> 
> from Linus' tree and commit:
> 
>    217d4dfa87415e ("tpm: Use dynamic delay to wait for TPM 2.0 self test result")
> 
> from the tpmdd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/char/tpm/tpm2-cmd.c
> index e1a41b788f08,f40d20671a78..000000000000
> --- a/drivers/char/tpm/tpm2-cmd.c
> +++ b/drivers/char/tpm/tpm2-cmd.c
> @@@ -900,6 -867,10 +867,11 @@@ static int tpm2_do_selftest(struct tpm_
>   			break;
>   
>   		tpm_msleep(delay_msec);
> ++
> + 		duration -= delay_msec;
> + 
> + 		/* wait longer the next round */
> + 		delay_msec *= 2;
>   	}
>   
>   	return rc;

I guess this is related to that I missed the email from James to LSM that
the branch that I should follow was updated. Apologies.

/Jarkko
