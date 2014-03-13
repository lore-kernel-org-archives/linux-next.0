From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: manual merge of the devicetree tree with the arm-soc tree
Date: Thu, 13 Mar 2014 12:55:21 +0000
Message-ID: <20140313125521.19449C41038@trevor.secretlab.ca>
References: <20140312220350.3c35bce7dff139a73a9c8262@kernel.org> < CAOesGMiK-8_0vt7jWSMT3oaoPUz5fS92ztknC-HhsEYt2XCNZQ@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:62486 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751308AbaCMMzb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 13 Mar 2014 08:55:31 -0400
Received: by mail-ea0-f171.google.com with SMTP id n15so468221ead.2
        for <linux-next@vger.kernel.org>; Thu, 13 Mar 2014 05:55:30 -0700 (PDT)
In-Reply-To: <CAOesGMiK-8_0vt7jWSMT3oaoPUz5fS92ztknC-HhsEYt2XCNZQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, 12 Mar 2014 15:36:58 -0700, Olof Johansson <olof@lixom.net> wrote:
> On Wed, Mar 12, 2014 at 3:03 PM, Mark Brown <broonie@kernel.org> wrote:
> > Hi Grant,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in include/asm-generic/vmlinux.lds.h between commit 6c3ff8b11a16ec69 ("ARM: Introduce CPU_METHOD_OF_DECLARE() for cpu hotplug/smp") from the  tree and commit f618c4703a14672d27 ("drivers: of: add support for custom reserved memory drivers") from the devicetree tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> 
> LGTM from the arm-soc side.

Ditto

g.

> 
> 
> -Olof
