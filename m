From: Axel Lin <axel.lin@gmail.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Wed, 20 Jun 2012 12:55:41 +0800
Message-ID: <CAF+7xWkMSuS3hcWMjKX8OdaLW038eQ-Es+WZeVja3iUiTXMWeQ@mail.gmail.com>
References: <20120620145044.599244256884c96a9131a06f@canb.auug.org.au>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120620145044.599244256884c96a9131a06f@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kim, Milo" <Milo.Kim@ti.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: linux-next.vger.kernel.org

2012/6/20 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi all,
>
> After merging the regulator tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "devm_gpio_request_one" [drivers/regulator/lp872x.ko] undefined!
>
> Caused by commit af8b5fc31099 ("regulator: add new regulator driver for
> lp872x").

Milo already sent a patch for this:

[PATCH] gpio: add EXPORT_SYMBOL() for devm_gpio_request_one
https://lkml.org/lkml/2012/6/19/58

Also CCed Grant
