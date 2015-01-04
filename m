From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: linux-next: bad commit in the luto-misc tree
Date: Sun, 4 Jan 2015 15:42:31 -0800
Message-ID: <CALCETrU47KbYVJ0XA4HnA+A4=Zck49ubuutT+SZNDUw+PBxQVw@mail.gmail.com>
References: <20150105103547.40ef87fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:33756 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836AbbADXmx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 4 Jan 2015 18:42:53 -0500
Received: by mail-la0-f41.google.com with SMTP id hv19so17228326lab.14
        for <linux-next@vger.kernel.org>; Sun, 04 Jan 2015 15:42:52 -0800 (PST)
In-Reply-To: <20150105103547.40ef87fd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On Sun, Jan 4, 2015 at 3:35 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Andy,
>
> I noticed commit 7d032e5b1042 ("[TEST ONLY] Force RCU NMI nesting") has
> no Signed-off-by ... I understand that this is for testing, but that
> is *not* what linux-next is really for.  Especially given that that
> commit is x86 only, it should be used for unit testing. not a wider
> audience like this.

Sorry.  I totally failed here.  I swear I rebased onto the latest RCU
tree, double-checked it, and pushed that exact revision to luto/next.
Somehow I pushed a much older development commit.  I have no idea how
I did that.  I didn't even know I still had that commit around at all.

Fixed now, I think.  Next time I will push to luto/next and
double-check that I pushed the commit I thought I pushed.

Sorry for causing trouble.

--Andy



>
> I am also not sure about 9f29ed3365cd ("[DO NOT APPLY] rcu: Make
> rcu_nmi_enter() handle nesting") ...  (it is, in particular, not
> Signed-off-by the committer, you).
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au



-- 
Andy Lutomirski
AMA Capital Management, LLC
