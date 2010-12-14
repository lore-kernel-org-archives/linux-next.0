From: Yong Shen <yong.shen@linaro.org>
Subject: Re: linux-next: build failure after merge of the voltage tree
Date: Tue, 14 Dec 2010 13:10:20 +0800
Message-ID: <AANLkTimxnunX6rmV8vCTCmwMuDoD3HTppHjkHGxg4ZKJ@mail.gmail.com>
References: <20101214154933.a4b36f69.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:43239 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005Ab0LNFKW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2010 00:10:22 -0500
In-Reply-To: <20101214154933.a4b36f69.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Stephen,

I had already noticed Liam. Mc13892's patch depends on other two
patches which are not applied yet.

Yong

On Tue, Dec 14, 2010 at 12:49 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Liam,
>
> After merging the voltage tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/regulator/mc13892-regulator.c:21:21: error: mc13xxx.h: No suc=
h file or directory
> drivers/regulator/mc13892-regulator.c:261: error: array type has inco=
mplete element type
> drivers/regulator/mc13892-regulator.c:262: error: implicit declaratio=
n of function 'MC13xxx_DEFINE'
> drivers/regulator/mc13892-regulator.c:262: error: 'MC13892_' undeclar=
ed here (not in a function)
>
> and on and on ....
>
> Caused by commit b0e2417cdbc12b1649245315a607ae8f1072b2bf ("regulator=
:
> support PMIC mc13892"). =A0A file missing from the commit, I assume.
>
> I have used the voltage tree form next-20101213 for today.
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
