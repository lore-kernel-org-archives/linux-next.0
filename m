From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Wed, 28 Jun 2017 15:48:23 +1000 (AEST)
Message-ID: <alpine.LRH.2.20.1706281548090.32070@namei.org>
References: <20170620145655.4b7f3efb@canb.auug.org.au> <fbcb7bd9-ca6e-eab1-350e-974c9df2875a@canonical.com> <CAGXu5jLneuMbmEOvYNKU1Q0wwe55uV7hCzQ+jCGFQ35_Zd=eeA@mail.gmail.com> <alpine.LRH.2.20.1706271333010.11229@namei.org>
 <CAGXu5jLW9Hnng=bS11g98sXUiEk7fE6mizemD_au974hb-qJVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from namei.org ([65.99.196.166]:41069 "EHLO namei.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751010AbdF1Fse (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 01:48:34 -0400
In-Reply-To: <CAGXu5jLW9Hnng=bS11g98sXUiEk7fE6mizemD_au974hb-qJVQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@google.com>
Cc: John Johansen <john.johansen@canonical.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, 27 Jun 2017, Kees Cook wrote:

> On Mon, Jun 26, 2017 at 8:33 PM, James Morris <jmorris@namei.org> wrote:
> > On Mon, 26 Jun 2017, Kees Cook wrote:
> >
> >> >> Fixes: 8014370f1257 ("apparmor: move path_link mediation to using labels")
> >> >> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> > Acked-by: John Johansen <john.johansen@canonical.com>
> >>
> >> Hi James,
> >>
> >> Just a ping; this needs to get into -next to avoid build errors.
> >
> > Surely Linus will resolve this when he pulls the trees in?
> 
> It's not a merge glitch, it's a refactoring glitch. John's commit in
> security-next ("apparmor: move path_link mediation to using labels")
> undid an earlier commit 8486adf0d755 ("apparmor: use designated
> initializers") from v4.11. This patch is needed for security-next.
> 

Thanks.

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git next


-- 
James Morris
<jmorris@namei.org>
