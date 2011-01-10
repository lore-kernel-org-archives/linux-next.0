From: Roland Dreier <rdreier@cisco.com>
Subject: Re: patchwork.kernel.org down
Date: Mon, 10 Jan 2011 12:33:23 -0800
Message-ID: <ada1v4k8pnw.fsf@cisco.com>
References: <AANLkTik4ktaeyDG3ihh-YRB+WVLxA46wSLOgWy6iY_68@mail.gmail.com>
	<20101220204936.GA21290@huya.qualcomm.com>
	<4D0FFC4B.9050301@kernel.org> <ada62u3dkv2.fsf@cisco.com>
	<adaei8k8ubh.fsf@cisco.com> <4D2B664F.7050106@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-1.cisco.com ([171.71.176.70]:30562 "EHLO
	sj-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752528Ab1AJUd0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Jan 2011 15:33:26 -0500
In-Reply-To: <4D2B664F.7050106@kernel.org> (J. H.'s message of "Mon, 10 Jan
	2011 12:04:31 -0800")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J.H." <warthog9@kernel.org>
Cc: David Brown <davidb@codeaurora.org>, sedat.dilek@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ftpadmin@kernel.org, webmaster@kernel.org

 > Not yet, I'm adding it in this afternoon.  I did the upgrade to Fedora
 > 14 (and thus 2.6.35.10) and seem to be getting, if not the same bug, a
 > darned similar one:
 > 
 > http://pastebin.osuosl.org/36644

Actually that looks pretty different; the trace is

 put_ldisc+0x8d/0xb4
 tty_ldisc_reinit+0x43/0x5c
 tty_ldisc_hangup+0x10d/0x19d
 do_tty_hangup+0x108/0x343
 ? __raw_local_irq_save+0x1d/0x23
 tty_vhangup_self+0x27/0x34
 sys_vhangup+0x22/0x29
 system_call_fastpath+0x16/0x1b

which doesn't involve any /proc/net file being closed at all.

Hmm...
