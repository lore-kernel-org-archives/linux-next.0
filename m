From: Mike Turquette <mturquette@ti.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Mon, 10 Sep 2012 09:51:45 -0700
Message-ID: <20120910165145.20289.71159@nucleus>
References: <20120910161428.879618aea62e5be6340ed93c@canb.auug.org.au>
 <CACRpkdbf94QG59pvqcN_grCG_tcpri7JyypZ9ZMu3R=LwvSoXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from na3sys009aog116.obsmtp.com ([74.125.149.240]:35119 "EHLO
	na3sys009aog116.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756870Ab2IJQvx convert rfc822-to-8bit
	(ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Sep 2012 12:51:53 -0400
Received: by pbbrr13 with SMTP id rr13so2721488pbb.19
        for <linux-next@vger.kernel.org>; Mon, 10 Sep 2012 09:51:52 -0700 (PDT)
In-Reply-To: <CACRpkdbf94QG59pvqcN_grCG_tcpri7JyypZ9ZMu3R=LwvSoXw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org

Quoting Linus Walleij (2012-09-10 08:24:49)
> On Mon, Sep 10, 2012 at 8:14 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the clk tree got a conflict in
> > arch/arm/mach-ux500/clock.c between commit 79964bcd792f ("ARM: ux500:
> > Correct Ux500 family names usage") from the arm-soc tree and commit
> > ebc96db7632f ("ARM: ux500: Switch to use common clock framework") from
> > the clk tree.
> >
> > The latter removed the file so I did that - there may be more fixup
> > required.
> 
> This is the correct solution, thanks!
> 

Yes.  Removal of the file is the only fixup required.

Regards,
Mike

> Yours,
> Linus Walleij
