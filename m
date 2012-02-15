From: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Build fail in hugetlbpage.c with linux-next and
 mpc85xx_defconfig
Date: Wed, 15 Feb 2012 23:32:14 +0000
Message-ID: <CAEsOVNcpBLmsmyZLW2HNe3MDR5cx5oJnPMmGD6Mqz4AjG16=9A@mail.gmail.com>
References: <14174.1329347321@neuling.org>
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:9750 "EHLO
	TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753457Ab2BOXcS convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Feb 2012 18:32:18 -0500
In-Reply-To: <14174.1329347321@neuling.org>
Content-Language: en-US
Content-ID: <5E56C61D747AF34A8CB71A370D12ADC1@freescale.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Neuling <mikey@neuling.org>
Cc: "galak@kernel.crashing.org" <galak@kernel.crashing.org>, Becky Bruce <beckyb@kernel.crashing.org>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Wed, Feb 15, 2012 at 11:08 PM, Michael Neuling <mikey@neuling.org> w=
rote:
> Becky,
>
> This has been broken in linux-next for a while. =A0Looks like a merge
> issue but you were the last to touch it...
>
> arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
> arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'pars=
e_args' makes integer from pointer without a cast
> include/linux/moduleparam.h:317: note: expected 's16' but argument is=
 of type 'int (*)(char *, char *)'
> arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to functi=
on 'parse_args'

A suggest fix has been submitted.

-M
