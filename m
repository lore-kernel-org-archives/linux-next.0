From: Kees Cook <keescook@google.com>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Tue, 27 Jun 2017 15:16:40 -0700
Message-ID: <CAGXu5jLW9Hnng=bS11g98sXUiEk7fE6mizemD_au974hb-qJVQ@mail.gmail.com>
References: <20170620145655.4b7f3efb@canb.auug.org.au> <fbcb7bd9-ca6e-eab1-350e-974c9df2875a@canonical.com>
 <CAGXu5jLneuMbmEOvYNKU1Q0wwe55uV7hCzQ+jCGFQ35_Zd=eeA@mail.gmail.com> <alpine.LRH.2.20.1706271333010.11229@namei.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:32903 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752923AbdF0WQm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 27 Jun 2017 18:16:42 -0400
Received: by mail-it0-f47.google.com with SMTP id x12so4087908itb.0
        for <linux-next@vger.kernel.org>; Tue, 27 Jun 2017 15:16:41 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.20.1706271333010.11229@namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: John Johansen <john.johansen@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 26, 2017 at 8:33 PM, James Morris <jmorris@namei.org> wrote:
> On Mon, 26 Jun 2017, Kees Cook wrote:
>
>> >> Fixes: 8014370f1257 ("apparmor: move path_link mediation to using labels")
>> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> > Acked-by: John Johansen <john.johansen@canonical.com>
>>
>> Hi James,
>>
>> Just a ping; this needs to get into -next to avoid build errors.
>
> Surely Linus will resolve this when he pulls the trees in?

It's not a merge glitch, it's a refactoring glitch. John's commit in
security-next ("apparmor: move path_link mediation to using labels")
undid an earlier commit 8486adf0d755 ("apparmor: use designated
initializers") from v4.11. This patch is needed for security-next.

-Kees

-- 
Kees Cook
Pixel Security
