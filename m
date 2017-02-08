From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 8 Feb 2017 21:30:03 +1100
Message-ID: <20170208213003.0330d859@canb.auug.org.au>
References: <20170208161113.1b597c01@canb.auug.org.au>
        <20170208084854.qrxnbrtdnbxefwpg@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38963 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752087AbdBHKa3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Feb 2017 05:30:29 -0500
In-Reply-To: <20170208084854.qrxnbrtdnbxefwpg@dell>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Lee,

On Wed, 8 Feb 2017 08:48:54 +0000 Lee Jones <lee.jones@linaro.org> wrote:
>
> On Wed, 08 Feb 2017, Stephen Rothwell wrote:
> 
> > Hi Linus,  
> 
> I believe this patch would need to go in via Greg's tree.

Except his tree does not have the rename and extra arguments for
devm_get_gpiod_from_child(), so it can't unless he merges (part of) the
gpio tree as well ...

-- 
Cheers,
Stephen Rothwell
