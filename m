From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the driver-core tree
Date: Wed, 23 Jan 2013 09:28:25 +0100
Message-ID: <CACRpkdavUBdiVr5N1Vm6Bdy2whFP39ewFjitAxSXNZeCdLEdUA@mail.gmail.com>
References: <20130123155852.e8b35c4e85b0c65c4635b422@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:60764 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315Ab3AWI20 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jan 2013 03:28:26 -0500
Received: by mail-ie0-f181.google.com with SMTP id 16so13097190iea.26
        for <linux-next@vger.kernel.org>; Wed, 23 Jan 2013 00:28:26 -0800 (PST)
In-Reply-To: <20130123155852.e8b35c4e85b0c65c4635b422@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@avionic-design.de>, Greg KH <greg@kroah.com>

On Wed, Jan 23, 2013 at 5:58 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the pinctrl tree got a conflict in
> drivers/pinctrl/pinctrl-nomadik.c between commit 9e0c1fb29a7c ("pinctrl:
> Convert to devm_ioremap_resource()") from the driver-core tree and commit
> 50f690d85e4e ("pinctrl/nomadik: simplify GPIO probe") from the pinctrl
> tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Excellent, looking good.

Thanks Stephen!
Linus Walleij
