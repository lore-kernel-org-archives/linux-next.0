Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5A7C433FE
	for <linux-next@archiver.kernel.org>; Thu, 20 Oct 2022 08:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiJTIK6 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 20 Oct 2022 04:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiJTIKy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Oct 2022 04:10:54 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A714109D47;
        Thu, 20 Oct 2022 01:10:41 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id A44B1C0011;
        Thu, 20 Oct 2022 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1666253440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fZZxtSOsN3J1AuvBKJ/9b53UP3QinqnediEI0uwfBJU=;
        b=n9wRC/Ji0sIy8VyOtKUYg94/vb8IPNmO9U0FW1hiLsRvYKs+OiNL2E2g1+xS0P7CYJ4cWj
        CYEZzqv/s6ge4I7T5CFzA4VFe8SM2aDbrxggv064iIR7pAjvL8V4cFX0PcyKkeqjV02b57
        S9rJhwh/eUaHxmpUAaRs+6pU+NxjBjrCtwciNbntAIkhfsqcjiWTu+tB7skoLCFpzav4h4
        A8Lwyuo9TnQKwjaPu/aGfgdss54vCZmJhIBgO3FWOHkZlPGmwGbXZPkzPnm6Pe/aN9PnZV
        VECLW5fV82j/6Vtmdolwjs+KuyQ3Tdw6ihmC0nCA5xYL1ZJNV6f+nyUDPLXn4g==
Date:   Thu, 20 Oct 2022 10:10:36 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Richard Weinberger <richard.weinberger@gmail.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the mtd tree with the mtd-fixes
 tree
Message-ID: <20221020101036.6ebecc75@xps-13>
In-Reply-To: <20221020010629.3e6e3d03@oak.ozlabs.ibm.com>
References: <20221019092812.7d370b06@canb.auug.org.au>
        <23d311953ef13608be2283a05b2e853d@milecki.pl>
        <20221019180807.6dac24a0@canb.auug.org.au>
        <20221019154907.33bbcb52@xps-13>
        <20221020010629.3e6e3d03@oak.ozlabs.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

sfr@canb.auug.org.au wrote on Thu, 20 Oct 2022 01:06:47 +1100:

> Hi Miquel,
>=20
> On Wed, 19 Oct 2022 15:49:07 +0200 Miquel Raynal <miquel.raynal@bootlin.c=
om> wrote:
> >
> > Thanks Rafa=C5=82 for the right resolution and Stephen for carrying the=
 fix.
> > I'll send the fixes PR soon and rebase on top of an -rc containing it
> > to avoid this conflict resolution to be needed when sending the final
> > PR to Linus during the next MW. =20
>=20
> Why not just merge your mtd/fixes branch into your mtd/branch (rather
> than rebasing)?
>=20

Yes, actually I usually wait for the next -rc and merge Linus' tag.

Thanks,
Miqu=C3=A8l
