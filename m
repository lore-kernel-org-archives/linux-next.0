From: "J.H." <warthog9@kernel.org>
Subject: Re: patchwork.kernel.org down
Date: Mon, 10 Jan 2011 16:45:18 -0800
Message-ID: <4D2BA81E.50600@kernel.org>
References: <AANLkTik4ktaeyDG3ihh-YRB+WVLxA46wSLOgWy6iY_68@mail.gmail.com>	<20101220204936.GA21290@huya.qualcomm.com>	<4D0FFC4B.9050301@kernel.org> <ada62u3dkv2.fsf@cisco.com>	<adaei8k8ubh.fsf@cisco.com> <4D2B664F.7050106@kernel.org> <ada1v4k8pnw.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ada1v4k8pnw.fsf@cisco.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roland Dreier <rdreier@cisco.com>
Cc: David Brown <davidb@codeaurora.org>, sedat.dilek@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ftpadmin@kernel.org, webmaster@kernel.org
List-Id: linux-next.vger.kernel.org

On 01/10/2011 12:33 PM, Roland Dreier wrote:
>  > Not yet, I'm adding it in this afternoon.  I did the upgrade to Fedora
>  > 14 (and thus 2.6.35.10) and seem to be getting, if not the same bug, a
>  > darned similar one:
>  > 
>  > http://pastebin.osuosl.org/36644
> 
> Actually that looks pretty different; the trace is
> 
>  put_ldisc+0x8d/0xb4
>  tty_ldisc_reinit+0x43/0x5c
>  tty_ldisc_hangup+0x10d/0x19d
>  do_tty_hangup+0x108/0x343
>  ? __raw_local_irq_save+0x1d/0x23
>  tty_vhangup_self+0x27/0x34
>  sys_vhangup+0x22/0x29
>  system_call_fastpath+0x16/0x1b
> 
> which doesn't involve any /proc/net file being closed at all.
> 
> Hmm...

My thoughts on why it was possibly similar is that it happens

[  793.932076] kernel BUG at mm/slub.c:2834!

where as 20702 is

kernel BUG at mm/slub.c:2835!

the rest didn't line up, and like I said I haven't specifically dug into it.

As a note I did end up with a full panic in the last hour, but nothing
got recorded (sadly).  I'm working on getting the kernel compiled up
with everything now so hopefully I'll start getting some additional data
to share.

- John 'Warthog9' Hawley
