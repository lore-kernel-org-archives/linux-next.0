From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: ARM: fix build failure on ux500 in linux-next
Date: Mon, 19 Mar 2012 00:19:55 +0100
Message-ID: <CACRpkdYzS=wkfUU4gJLTp7djd6J20zVCC_6XhrjwoVpAoSe8iA@mail.gmail.com>
References: <20120316211759.GA18829@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:43382 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755810Ab2CRXT4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 18 Mar 2012 19:19:56 -0400
Received: by obbeh20 with SMTP id eh20so688101obb.19
        for <linux-next@vger.kernel.org>; Sun, 18 Mar 2012 16:19:55 -0700 (PDT)
In-Reply-To: <20120316211759.GA18829@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linus.walleij@stericsson.com, srinidhi.kasagar@stericsson.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, arnd@arndb.de, arm@kernel.org

On Fri, Mar 16, 2012 at 10:18 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> When I 1st saw this build failure, I thought it was me, because of th=
e
> BUG() stuff. =A0But git bisect claims it comes from the arm-soc tree?

Hm yeah looks like that, but we cannot see which commit
I guess, just that it's the merge from ARM SoC?

> In any case, the fix is trivial and self evident, regardless of where
> it came from. =A0I can carry it in my bug-3.4 cleanup tree if need be=
=2E
> Let me know if you want me to do that.

Any way that solves the issue is fine with me, maybe Arnd/Olof
wants to apply it to the ARM SoC tree rather? If they don't say
anything, by all means please keep it in cleanup.

Yours,
Linus Walleij
