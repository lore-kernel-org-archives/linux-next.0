From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the irqdomain tree with Linus' tree
Date: Mon, 13 Feb 2012 21:44:18 -0700
Message-ID: <CACxGe6uvbyT9Jwg3+nzjF36cSAPqSWOdpKeiPT+JtbeEz5h7tw@mail.gmail.com>
References: <20120214153652.7850e2bd7b87e92008c15c4c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:40829 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1759402Ab2BNEoi convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Feb 2012 23:44:38 -0500
In-Reply-To: <20120214153652.7850e2bd7b87e92008c15c4c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

On Mon, Feb 13, 2012 at 9:36 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> Today's linux-next merge of the irqdomain tree got a conflict in
> drivers/mfd/twl-core.c between commit 6252547b8a7a ("ARM: omap: fix
> broken twl-core dependencies and ifdefs") from Linus' tree and commit
> 7da5a66bbf1f ("irq_domain: Remove 'new' irq_domain in favour of the p=
pc
> one") from the irqdomain tree.
>
> The latter removes the code modified by the former, so I did that.

Thanks Stephen. I'll respin the tree after the next rc

g.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
