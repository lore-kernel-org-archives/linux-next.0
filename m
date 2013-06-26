From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the regmap tree
Date: Wed, 26 Jun 2013 21:59:02 +0200
Message-ID: <CACRpkdYrxdNqLtWvLd09nZD8+-FYCB2EY8tcgTawUSVrUn1HPQ@mail.gmail.com>
References: <20130626160603.7747e9db0f30c06a243c5aa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:43707 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752065Ab3FZT7D (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Jun 2013 15:59:03 -0400
Received: by mail-ob0-f182.google.com with SMTP id va7so13713695obc.41
        for <linux-next@vger.kernel.org>; Wed, 26 Jun 2013 12:59:02 -0700 (PDT)
In-Reply-To: <20130626160603.7747e9db0f30c06a243c5aa5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas KANDAGATLA <srinivas.kandagatla@st.com>, Mark Brown <broonie@kernel.org>, Jingchang Lu <b35083@freescale.com>

On Wed, Jun 26, 2013 at 8:06 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Linus,
>
> Today's linux-next merge of the pinctrl tree got a conflict in
> drivers/pinctrl/Makefile between commit 701016c0cba5 ("pinctrl: st: Add
> pinctrl and pinconf support") from the regmap tree and commit
> 78bafc66180d ("pinctrl: add VF610 pinctrl driver") from the pinctrl tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Aha yes Mark is carrying that driver in the regmap tree so should
be expected. Solution is correct, thanks.

Yours,
Linus Walleij
