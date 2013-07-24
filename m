From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: status of various trees
Date: Wed, 24 Jul 2013 11:01:07 +0100
Message-ID: <CACxGe6uB5wKzaM_X3ROnD0z+wc7WZ=cHF1bm3zD=mm=mb5QJxg@mail.gmail.com>
References: <20130723095513.19b9638ab4a19157e9834dcf@canb.auug.org.au>
 <CACxGe6tjrFG1aLc9Scmmuunjb9hTm5vyH6LqXiys8484YY=Zzw@mail.gmail.com> <20130724102123.6d1156925959e56640c23468@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:61050 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752389Ab3GXKB2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 24 Jul 2013 06:01:28 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so468300oag.0
        for <linux-next@vger.kernel.org>; Wed, 24 Jul 2013 03:01:28 -0700 (PDT)
In-Reply-To: <20130724102123.6d1156925959e56640c23468@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Walleij <linus.walleij@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mark Brown <broonie@kernel.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jul 24, 2013 at 1:21 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> OK, I have done all that.  I also removed the irqdomain-current and
> spi-current trees.
>
> So the trees I have left that you are responsible for are:
>
> devicetree-current      git://git.secretlab.ca/git/linux-2.6#devicetree/merge
> devicetree              git://git.secretlab.ca/git/linux-2.6#devicetree/next
> arm-dt                  git://git.secretlab.ca/git/linux-2.6#devicetree/arm-next

You can drop the arm-dt tree also.

Thanks,
g.
