From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the crypto tree with the arm tree
Date: Wed, 16 May 2012 09:26:53 +0200
Message-ID: <CACRpkdbhyL4eJOLZ0pw_T3LDwPpFJM4BWVAhKh8hZADMJ4PBEA@mail.gmail.com>
References: <20120516151441.59baed915e31738642fd52dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:53518 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759389Ab2EPH0y convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 16 May 2012 03:26:54 -0400
Received: by qcro28 with SMTP id o28so245910qcr.19
        for <linux-next@vger.kernel.org>; Wed, 16 May 2012 00:26:54 -0700 (PDT)
In-Reply-To: <20120516151441.59baed915e31738642fd52dd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>, Andreas Westin <andreas.westin@stericsson.com>

On Wed, May 16, 2012 at 7:14 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:

> Today's linux-next merge of the crypto tree got a conflict in
> arch/arm/mach-ux500/devices-common.h between commit 08956a0e8a69 ("AR=
M:
> 7372/1: ux500: factor out dynamic amba device allocator") from the =A0=
tree
> and commit 585d188f8072 ("mach-ux500: crypto - core support for CRYP/=
HASH
> module") from the crypto tree.
>
> Just context changes (maybe). =A0I fixed it up (see below) and can ca=
rry
> the fix as necessary.
>
> I suspect that there may be something deeper here, though.

This looks correct, thanks Stephen!

Linus Walleij
