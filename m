From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: Tree for Apr 18 [ call-trace: drm | x86 | smp | rcu
 related? ]
Date: Thu, 18 Apr 2013 21:48:06 +0200
Message-ID: <CAKMK7uFEaiT_1siQBcp_-S0RwLvy3XSjqLn1ksq70VhNTZSfLw@mail.gmail.com>
References: <CA+icZUVWC+Rgd9wh4Z4CPZkEa9Pm2=2udnY5=UD1nnH0Wot1pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:45522 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752860Ab3DRTsH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Apr 2013 15:48:07 -0400
Received: by mail-ie0-f181.google.com with SMTP id tp5so1373988ieb.26
        for <linux-next@vger.kernel.org>; Thu, 18 Apr 2013 12:48:06 -0700 (PDT)
In-Reply-To: <CA+icZUVWC+Rgd9wh4Z4CPZkEa9Pm2=2udnY5=UD1nnH0Wot1pQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Paul McKenney <paul.mckenney@linaro.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>

On Thu, Apr 18, 2013 at 3:05 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Thu, Apr 18, 2013 at 10:28 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Changes since 20130417:
>>
>> New Trees:      rpmsg (actually added yesterday)
>>                 ppc-temp (replacing powerpc for this week)
>>
>> The ceph tree gained a conflict against Linus' tree.
>>
>> The net-next tree gained a conflict against the infiniband tree.
>>
>> The usb tree gained a build failure so I used the version from
>> next-20130417.
>>
>> I added two merge fix patches after the gen-gpio tree.
>>
>> The ppc-temp tree gained a conflict against the metag tree.
>>
>> The akpm tree lost a patch that turned up elsewhere.
>>
>> ----------------------------------------------------------------------------
>>
>
> Not sure what the root-cause for this call-trace is (see screenshot).
>
> This is reproducible when running my kernel build-script (4 parallel-make-jobs).
>
> Any hints welcome!

The panic handlers in our modeset code are pretty decent fubar - they
take mutexes all over the place. So I think the backtrace you see
there is actually a secondary effect. I've looked into fixing this up,
but the issue is that drivers themselves have tons of state protected
with mutexes, which all potentially affects the panic handler. So I've
given up on that for now ...
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
