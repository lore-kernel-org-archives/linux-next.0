From: "Dmitry Eremin-Solenikov" <dbaryshkov@gmail.com>
Subject: Re: linux-next: manual merge of the mtd tree
Date: Thu, 11 Dec 2008 13:11:20 +0300
Message-ID: <bc64b4640812110211h294707d8ndd58f611152b893d@mail.gmail.com>
References: <20081211134307.b7ce748d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from an-out-0708.google.com ([209.85.132.248]:17057 "EHLO
	an-out-0708.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754908AbYLKKLW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Dec 2008 05:11:22 -0500
Received: by an-out-0708.google.com with SMTP id d40so423070and.1
        for <linux-next@vger.kernel.org>; Thu, 11 Dec 2008 02:11:20 -0800 (PST)
In-Reply-To: <20081211134307.b7ce748d.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-next@vger.kernel.org, Eric Miao <eric.miao@marvell.com>, Russell King <rmk@arm.linux.org.uk>

2008/12/11 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi David,
>
> Today's linux-next merge of the mtd tree got conflicts in
> arch/arm/mach-pxa/corgi.c, arch/arm/mach-pxa/poodle.c and
> arch/arm/mach-pxa/spitz.c between commits
> 4a9295ccb43ead9ec054d0bd374c992c692b2cf4 ("[ARM] pxa/corgi: add physmap
> mapping for ROM"), 431a2cff07446b0325ec063e5b401ca7c11e0058 ("[ARM]
> pxa/poodle: add physmap mapping for ROM") and
> e5d3bf3c106c0557199076a57800adb85206c1ce ("[ARM] pxa/spitz: add physmap
> mapping for ROM") from the arm tree and commit
> 6af7a8eb1eb2b5a0967fccf61e750b085d60ad48 ("[MTD] sharpsl-nand: move
> registration to board code") from the mtd tree.
>
> They seem to be overlapping changes.  Can you guys rationalise this,
> please, as I am in no position to fix these conflicts up.

Unfortunately those changes are independant, so I don't quite
understand what to do.
If you'd prefer, I can provide merged versions of all 3 files, so that
you can use this
as merge resolution via git-rerere. Is that suitable for you?

>
> I have dropped the mtd tree for today.


-- 
With best wishes
Dmitry
