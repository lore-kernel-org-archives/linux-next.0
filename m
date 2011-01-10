From: "J.H." <warthog9@kernel.org>
Subject: Re: patchwork.kernel.org down
Date: Mon, 10 Jan 2011 12:04:31 -0800
Message-ID: <4D2B664F.7050106@kernel.org>
References: <AANLkTik4ktaeyDG3ihh-YRB+WVLxA46wSLOgWy6iY_68@mail.gmail.com>	<20101220204936.GA21290@huya.qualcomm.com>	<4D0FFC4B.9050301@kernel.org> <ada62u3dkv2.fsf@cisco.com> <adaei8k8ubh.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:41568 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab1AJUEl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Jan 2011 15:04:41 -0500
In-Reply-To: <adaei8k8ubh.fsf@cisco.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <rdreier@cisco.com>
Cc: David Brown <davidb@codeaurora.org>, sedat.dilek@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ftpadmin@kernel.org, webmaster@kernel.org

On 01/10/2011 10:52 AM, Roland Dreier wrote:
>  >  > More excitement from https://bugzilla.kernel.org/show_bug.cgi?id=20702
>  >  > 
>  >  > Anyone want to take a stab at it?  I know I'd be appreciative.  I am
>  >  > running a debug kernel with everything I could find and enable I even
>  >  > remotely thought might prove helpful.  Nothing has jumped out yet though.
>  > 
>  > A little late, but perhaps running with the patch below might help us
>  > make a bit of progress.  The idea is to dump the last /proc/net file
>  > opened and closed, so we can at least have a clue as to where the crash
>  > is coming from.  This should add lines like 
>  > 
>  >     last procfs open:  /proc/2443/net/arp
>  >     last procfs close: /proc/2443/net/arp
>  > 
>  > to the oops output, so maybe we can zero in on things after you get a
>  > crash with this applied.
> 
> Just curious -- did you get a chance to run with this patch applied?
> Did you collect any oopses yet?

Not yet, I'm adding it in this afternoon.  I did the upgrade to Fedora
14 (and thus 2.6.35.10) and seem to be getting, if not the same bug, a
darned similar one:

http://pastebin.osuosl.org/36644

I haven't added it to 20702 yet as I haven't had time to confirm if it's
the same issue, but at first glance it looks it.  My plan is to compile
up a mainline kernel, with the above patch, and with debugging turned on
and to capture as much as I can from that.

- John 'Warthog9' Hawley
