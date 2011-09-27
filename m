From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: manual merge of the moduleh tree with the mfd tree
Date: Tue, 27 Sep 2011 10:54:45 -0400
Message-ID: <CAP=VYLqybADeb=nMgbyK-J0NWAF7jtrTnS212qDez5WcpQADoQ@mail.gmail.com>
References: <20110927162919.1bf769d918a16a35d91ac1da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50469 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770Ab1I0Oyw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Sep 2011 10:54:52 -0400
In-Reply-To: <20110927162919.1bf769d918a16a35d91ac1da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>

On Tue, Sep 27, 2011 at 2:29 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Paul,
>
> Today's linux-next merge of the moduleh tree got a conflict in
> drivers/mfd/ab3550-core.c between commit e085f9a2e27d ("mfd: Delete
> ab3550 driver") from the mfd tree and commit afb68c4877b2 ("mfd: Add
> module.h to the implicit drivers/mfd users") from the moduleh tree.
>
> The former removes this file, so I did that.

Thanks -- I'll simply drop the changes to that file.  I'll have an alte=
rnate
pull site for linux-next to you by your tomorrow morning as well.

P.

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
