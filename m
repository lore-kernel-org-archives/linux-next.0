From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: Build error in -next due to 'drivers/video/fbdev/atyfb: Replace
 MTRR UC hole with strong UC'
Date: Fri, 31 Jul 2015 13:52:24 -0400
Message-ID: <CAP=VYLoUTKemCoqw8t6mC4Gz+-HrhUzMY7DvTL-yE0Cx6gpJQw@mail.gmail.com>
References: <55BADCB8.3030503@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:35531 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000AbbGaRwy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 13:52:54 -0400
Received: by wibxm9 with SMTP id xm9so43764143wib.0
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2015 10:52:53 -0700 (PDT)
In-Reply-To: <55BADCB8.3030503@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Luis R. Rodriguez" <mcgrof@suse.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

On Thu, Jul 30, 2015 at 10:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> Hi Luis,
>
> probably the zero-day build already told you, but just in case:
>
> Your commit 'drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC'
> causes build errors for architectures which don't support ioremap_uc.
> This affects at least the alpha architecture, though there may be others.

Yep, parisc allmodconfig now sees it as well.  Bisected before seeing
this message.

3cc2dac5be3f23414a4efdee0b26d79bed297cac is the first bad commit
commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac
Author: Luis R. Rodriguez <mcgrof@suse.com>
Date:   Thu Jul 9 18:24:58 2015 -0700

    drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC

http://kisskb.ellerman.id.au/kisskb/buildresult/12475234/

Paul.
--

>
> Here is the build error:
>
> drivers/video/fbdev/aty/atyfb_base.c: In function 'atyfb_setup_generic':
> drivers/video/fbdev/aty/atyfb_base.c:3447:2: error: implicit declaration of
> function 'ioremap_uc'
>
> Thanks,
> Guenter
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
