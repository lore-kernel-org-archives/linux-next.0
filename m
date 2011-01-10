From: Roland Dreier <rdreier@cisco.com>
Subject: Re: patchwork.kernel.org down
Date: Mon, 10 Jan 2011 10:52:50 -0800
Message-ID: <adaei8k8ubh.fsf@cisco.com>
References: <AANLkTik4ktaeyDG3ihh-YRB+WVLxA46wSLOgWy6iY_68@mail.gmail.com>
	<20101220204936.GA21290@huya.qualcomm.com>
	<4D0FFC4B.9050301@kernel.org> <ada62u3dkv2.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ada62u3dkv2.fsf@cisco.com> (Roland Dreier's message of "Wed, 05
	Jan 2011 14:52:17 -0800")
Sender: linux-kernel-owner@vger.kernel.org
To: "J.H." <warthog9@kernel.org>
Cc: David Brown <davidb@codeaurora.org>, sedat.dilek@gmail.com, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, ftpadmin@kernel.org, webmaster@kernel.org
List-Id: linux-next.vger.kernel.org

 >  > More excitement from https://bugzilla.kernel.org/show_bug.cgi?id=20702
 >  > 
 >  > Anyone want to take a stab at it?  I know I'd be appreciative.  I am
 >  > running a debug kernel with everything I could find and enable I even
 >  > remotely thought might prove helpful.  Nothing has jumped out yet though.
 > 
 > A little late, but perhaps running with the patch below might help us
 > make a bit of progress.  The idea is to dump the last /proc/net file
 > opened and closed, so we can at least have a clue as to where the crash
 > is coming from.  This should add lines like 
 > 
 >     last procfs open:  /proc/2443/net/arp
 >     last procfs close: /proc/2443/net/arp
 > 
 > to the oops output, so maybe we can zero in on things after you get a
 > crash with this applied.

Just curious -- did you get a chance to run with this patch applied?
Did you collect any oopses yet?

 - R.
