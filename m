From: viresh kumar <viresh.linux@gmail.com>
Subject: Re: "clk: add non CONFIG_HAVE_CLK routines" commit
Date: Tue, 12 Jun 2012 11:57:07 +0100
Message-ID: <CAOh2x=mFOPKbzuY__k0RVpFHTdPfa-iN1e3Lpa3iWt9iP6FzFw@mail.gmail.com>
References: <20120522234621.GA3610@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:43939 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752221Ab2FLK5I convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jun 2012 06:57:08 -0400
Received: by obbtb18 with SMTP id tb18so8150023obb.19
        for <linux-next@vger.kernel.org>; Tue, 12 Jun 2012 03:57:07 -0700 (PDT)
In-Reply-To: <20120522234621.GA3610@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Viresh Kumar <viresh.kumar@st.com>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fengguang.wu@intel.com, spear-devel <spear-devel@list.st.com>

Hi Paul/Russell,

On Wed, May 23, 2012 at 12:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Hi Viresh,
>
> The above listed commit, in linux-next as:
>
> commit ebbf0cb5d39cc3e22ef4c425475e76b7f45027de
>
> =A0 =A0"clk: add non CONFIG_HAVE_CLK routines"
>
> shows up as failures in the netx_defconfig, since there
> are duplicate stub functions between your changes and the
> file below:
>
> =A0arch/arm/mach-netx/fb.c:72:6: error: redefinition of 'clk_disable'
> =A0include/linux/clk.h:299:51: note: previous definition of 'clk_disa=
ble' was here
> =A0arch/arm/mach-netx/fb.c:76:5: error: redefinition of 'clk_set_rate=
'
> =A0include/linux/clk.h:306:50: note: previous definition of 'clk_set_=
rate' was here
> =A0arch/arm/mach-netx/fb.c:81:5: error: redefinition of 'clk_enable'
> =A0include/linux/clk.h:294:50: note: previous definition of 'clk_enab=
le' was here
> =A0arch/arm/mach-netx/fb.c:86:13: error: redefinition of 'clk_get'
> =A0include/linux/clk.h:280:58: note: previous definition of 'clk_get'=
 was here
> =A0arch/arm/mach-netx/fb.c:91:6: error: redefinition of 'clk_put'
> =A0include/linux/clk.h:290:51: note: previous definition of 'clk_put'=
 was here
> =A0make[2]: *** [arch/arm/mach-netx/fb.o] Error 1

=46ollowing are present in mach-netx/fb.c:


void clk_disable(struct clk *clk)
{
}

int clk_set_rate(struct clk *clk, unsigned long rate)
{
	return 0;
}

int clk_enable(struct clk *clk)
{
	return 0;
}

void clk_put(struct clk *clk)
{
}

struct clk *clk_get(struct device *dev, const char *id)
{
	return dev && strcmp(dev_name(dev), "fb") =3D=3D 0 ? NULL : ERR_PTR(-E=
NOENT);
}

I can remove first four without any issues, but just can't remove the l=
ast one.
The dummy clk_get() always returns NULL, whereas this one returns NULL =
only for
fb device.

How should I fix this?

--
Viresh
