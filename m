From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: manual merge of the mfd tree with the input tree
Date: Wed, 15 Feb 2017 11:38:47 -0800
Message-ID: <20170215193847.GA20362@dtor-ws>
References: <20170214131006.4c5ab762@canb.auug.org.au>
 <20170214083840.s36lep65kvecoao3@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34378 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750719AbdBOTiv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Feb 2017 14:38:51 -0500
Content-Disposition: inline
In-Reply-To: <20170214083840.s36lep65kvecoao3@dell>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, Douglas Anderson <dianders@chromium.org>

On Tue, Feb 14, 2017 at 08:38:40AM +0000, Lee Jones wrote:
> On Tue, 14 Feb 2017, Stephen Rothwell wrote:
> 
> > Hi Lee,
> > 
> > Today's linux-next merge of the mfd tree got a conflict in:
> > 
> >   drivers/input/keyboard/cros_ec_keyb.c
> > 
> > between commits:
> > 
> >   2057e15945a8 ("Input: cros_ec_keyb - drop unnecessary call to dev_set_drvdata and other changes")
> >   aef01aad89e4 ("Input: matrix-keypad - switch to using generic device properties")
> > 
> > from the input tree and commit:
> > 
> >   cdd7950e7aa4 ("input: cros_ec_keyb: Add non-matrix buttons and switches")
> > 
> > from the mfd tree.
> > 
> > It looks like the latter introduces a call to dev_get_drvdata(), so I
> > left the dev_set_drvdata() call in.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Morning Stephen,
> 
> It looks like Dmitry is yet to pull from:
> 
>   http://tinyurl.com/ztg68nj

Just pulled and resolved conflicts. Thanks!

-- 
Dmitry
