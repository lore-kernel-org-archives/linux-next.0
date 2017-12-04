From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
Date: Sun, 3 Dec 2017 19:41:30 -0800
Message-ID: <CAOesGMh_YT1TH_c0xs614HoK8iAOoaxPofxQtmSuPa8h7HpHKQ@mail.gmail.com>
References: <20171204083256.262c4b7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35886 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752094AbdLDDle (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Dec 2017 22:41:34 -0500
Received: by mail-lf0-f51.google.com with SMTP id f20so17553910lfe.3
        for <linux-next@vger.kernel.org>; Sun, 03 Dec 2017 19:41:33 -0800 (PST)
In-Reply-To: <20171204083256.262c4b7c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>

Thanks, Stephen. I need to get a similar script going to catch these
things in our own tree.

Since this was a clean revert, I've redone it myself, carrying over
descriptions from the pull request and keeping attribution to Kevin.

Kevin; hope this is alright with you. We can revisit if not.


-Olof


On Sun, Dec 3, 2017 at 1:32 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   5f56b7f4854a ("Revert "Merge tag 'scpi-updates-4.15' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into next/drivers"")
>
> is missing a Signed-off-by from its author or committer.
>
> Reverts are commits as well and so need an explanation of why they
> are done and Signed-off-by tags.
>
> --
> Cheers,
> Stephen Rothwell
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
