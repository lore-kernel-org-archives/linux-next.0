From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
Date: Mon, 21 Dec 2015 09:44:58 +0100
Message-ID: <CACRpkda3vtU=Gk+52_RH4xZtLDqb7BGnDZyvqYNBoNbGiqhz9Q@mail.gmail.com>
References: <20151221155811.04a84bf1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33551 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbbLUIo7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 03:44:59 -0500
Received: by mail-ob0-f180.google.com with SMTP id bx1so1382435obb.0
        for <linux-next@vger.kernel.org>; Mon, 21 Dec 2015 00:44:59 -0800 (PST)
In-Reply-To: <20151221155811.04a84bf1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pramod Kumar <pramodku@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>

On Mon, Dec 21, 2015 at 5:58 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Argh damned, I pushed a oneliner fix in accordance with Pramod's
report. Sorry about the mess.

Yours,
Linus Walleij
