From: Olof Johansson <olof@lixom.net>
Subject: Re: linux-next: taking a break
Date: Thu, 19 Sep 2013 21:56:55 -0700
Message-ID: <CAOesGMjO0JQ8Whm_MEXrOnFFPAG8MXBiQpddV6e8jRR6rcCkTQ@mail.gmail.com>
References: <20130920144612.5741656ad6ffa8e6739d391c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:41934 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464Ab3ITE44 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2013 00:56:56 -0400
Received: by mail-wi0-f172.google.com with SMTP id hn9so6573263wib.17
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2013 21:56:55 -0700 (PDT)
In-Reply-To: <20130920144612.5741656ad6ffa8e6739d391c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, "ksummit-2013-discuss@lists.linuxfoundation.org" <ksummit-2013-discuss@lists.linuxfoundation.org>

On Thu, Sep 19, 2013 at 9:46 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> I will be having a 3 week break leading up to the kernel
> summit.  This means that next-20130927 (next Friday) will be the last
> linux-next release until next-20131028 (or maybe 29 depending on
> jetlag).  I presume that Linus will be up to v3.12-rc7 by then and -rc7
> is often the last before a release ... Please plan accordingly.

This brings up a subject that could be good to discuss at KS: Do you
want a backup to share your workload and for hand-off at times like
this?

You've been carrying the load of linux-next alone for years now, and
having someone that can take over every now and then seems like a good
idea. You've been doing an outstanding job but everybody need downtime
sometimes.

Linux-next is incredibly valuable for _so_ many of us, and a big part
of the value is in the continuous frequent releases that allows us to
catch issues quickly when they are staged, and keep bisectability as
high as possible. It also helps us discover early on when someone is
merging code through a maintainer they shouldn't (due to conflicts).
It will be very much missed during your well-deserved vacation.


-Olof
