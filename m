From: Eric Dumazet <edumazet@google.com>
Subject: Re: Kernel crash on startup - bisected to commit 3b24d854cb35
Date: Fri, 8 Apr 2016 22:33:25 -0700
Message-ID: <CANn89iJ6sfeNgB4BBmAw5SewqSHe_50+6POLJn=fhTDnNcY6kQ@mail.gmail.com>
References: <570892F9.9030700@lwfinger.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f169.google.com ([209.85.161.169]:32827 "EHLO
	mail-yw0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750897AbcDIFd0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 9 Apr 2016 01:33:26 -0400
Received: by mail-yw0-f169.google.com with SMTP id t10so157305348ywa.0
        for <linux-next@vger.kernel.org>; Fri, 08 Apr 2016 22:33:26 -0700 (PDT)
In-Reply-To: <570892F9.9030700@lwfinger.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: "David S. Miller" <davem@davemloft.net>, linux-next <linux-next@vger.kernel.org>, linux-netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 8, 2016 at 10:28 PM, Larry Finger <Larry.Finger@lwfinger.net> wrote:
> Following a recent pull of the wireless-drivers-next repo. my system got a
> kernel panic on startup at native_apic_msr_write+0x27. The problem was
> bisected to commit 3b24d854cb35 ("tcp/dccp: do not touch listener sk_refcnt
> under synflood"). I am confident of the bisection as a kernel built with the
> previous commit (3a5d1c0) boots OK.
>
> I have not yet captured the entire traceback for the crash, but I do have a
> crappy photo of the screen that I have attached. The RIP is at
> native_apic_msr_write+0x27. As this crash is likely configuration dependent,
> a copy of my .config is also attached. Note that IPv6 is turned off on my
> machine.
>
> Please let me know if any other info is needed.

Can you double check you have this fix ?

commit 8501786929de4616b10b8059ad97abd304a7dddf
Author: Eric Dumazet <edumazet@google.com>
Date:   Wed Apr 6 22:07:34 2016 -0700

    tcp/dccp: fix inet_reuseport_add_sock()

    David Ahern reported panics in __inet_hash() caused by my recent commit.

    The reason is inet_reuseport_add_sock() was still using
    sk_nulls_for_each_rcu() instead of sk_for_each_rcu().
    SO_REUSEPORT enabled listeners were causing an instant crash.

    While chasing this bug, I found that I forgot to clear SOCK_RCU_FREE
    flag, as it is inherited from the parent at clone time.

    Fixes: 3b24d854cb35 ("tcp/dccp: do not touch listener sk_refcnt
under synflood")
    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Reported-by: David Ahern <dsa@cumulusnetworks.com>
    Tested-by: David Ahern <dsa@cumulusnetworks.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>
