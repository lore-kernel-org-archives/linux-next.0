From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: Re: linux-next: build failure after merge of the gpio tree
Date: Wed, 12 Oct 2011 16:21:00 +0900
Message-ID: <CABMQnV+S2WbW0YZBiMXfs81b2dyLzj9wBxPmNuFrYErKfXsWtg@mail.gmail.com>
References: <20111006144826.a69a5ea59d4ca94f8f7414cf@canb.auug.org.au>
 <20111011173714.d54bbcee6c0676ddcc37a1f3@canb.auug.org.au>
 <4E93EA10.4030405@dsn.lapis-semi.com> <20111012152451.66ce5ddffb4c5b3a4f6a31cf@canb.auug.org.au>
 <4E9525AC.9080909@dsn.lapis-semi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37354 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967Ab1JLHVW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Oct 2011 03:21:22 -0400
In-Reply-To: <4E9525AC.9080909@dsn.lapis-semi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>

Hi,

2011=E5=B9=B410=E6=9C=8812=E6=97=A514:29 Tomoya MORINAGA <tomoya-linux@=
dsn.lapis-semi.com>:
> Hi, Stephen
>
> (2011/10/12 13:24), Stephen Rothwell wrote:
>>
>> Just try building gpio-pch and gpio-ml-ioh as modules ...
>> irq_setup_generic_chip() does not have an EXPORT_SYMBOL (and didn't =
in
>> v3.0 either).
>>
>
> Your report looks like the same as ours.
> In our develop environment,
> build becomes success only gpio-pch/gpio-ml-ioh is integrated as buil=
t-in.
> In case of integrated as modules, build becomes failure.
>
> I understood this behavior is specification/limitation of GPIO interr=
upt
> function.
> Is it true ?
>

This is a problem of generic-chip.
I created the patch and contributed the point to LKML.
He forgot to put you into CC, sorry.

Please check LKML for subject of "[PATCH] irq: Add EXPORT_SYMBOL to
function of irq generic-chip".

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6
