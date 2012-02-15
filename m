From: Michael Neuling <mikey@neuling.org>
Subject: Re: Build fail in hugetlbpage.c with linux-next and mpc85xx_defconfig
Date: Thu, 16 Feb 2012 10:37:43 +1100
Message-ID: <16098.1329349063@neuling.org>
References: <14174.1329347321@neuling.org> <CAEsOVNcpBLmsmyZLW2HNe3MDR5cx5oJnPMmGD6Mqz4AjG16=9A@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37794 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754552Ab2BOXhp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Feb 2012 18:37:45 -0500
In-reply-to: <CAEsOVNcpBLmsmyZLW2HNe3MDR5cx5oJnPMmGD6Mqz4AjG16=9A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "galak@kernel.crashing.org" <galak@kernel.crashing.org>, Becky Bruce <beckyb@kernel.crashing.org>, "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

> > Becky,
> >
> > This has been broken in linux-next for a while. =A0Looks like a merge
> > issue but you were the last to touch it...
> >
> > arch/powerpc/mm/hugetlbpage.c: In function 'reserve_hugetlb_gpages':
> > arch/powerpc/mm/hugetlbpage.c:313: error: passing argument 5 of 'parse_ar=
> gs' makes integer from pointer without a cast
> > include/linux/moduleparam.h:317: note: expected 's16' but argument is of =
> type 'int (*)(char *, char *)'
> > arch/powerpc/mm/hugetlbpage.c:313: error: too few arguments to function '=
> parse_args'
> 
> A suggest fix has been submitted.

Do you have a link?  Which tree is it going in?

Mikey
