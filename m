From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: Tree for Aug 21 [ screen corruption in graphical mode ]
Date: Thu, 22 Aug 2013 13:30:49 +0200
Message-ID: <CAKMK7uG5AntN=nQ6TWUwNgXJh7tATu5TacccYah36sXnLAmAiQ@mail.gmail.com>
References: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
	<20130821134441.GE26909@phenom.ffwll.local>
	<CA+icZUVLau7AgZvcnWKjx=tc4WeuJ3qEH7qQta+YLKDmxk6QvA@mail.gmail.com>
	<20130821212012.GH26909@phenom.ffwll.local>
	<CA+icZUUoZ3WRNChLJ8vfP_MxJhTu2annkWCmB8jnqOxNKSEtOg@mail.gmail.com>
	<20130822072417.GM26909@phenom.ffwll.local>
	<CA+icZUXoebf4p1pp6wkaOMFbfVjjL1+wDbYF+SvLUjkm991Rcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:59441 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444Ab3HVLau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 Aug 2013 07:30:50 -0400
Received: by mail-ob0-f175.google.com with SMTP id xn12so3243826obc.6
        for <linux-next@vger.kernel.org>; Thu, 22 Aug 2013 04:30:50 -0700 (PDT)
In-Reply-To: <CA+icZUXoebf4p1pp6wkaOMFbfVjjL1+wDbYF+SvLUjkm991Rcg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "s.dilek" <s.dilek@jpberlin.de>

On Thu, Aug 22, 2013 at 1:13 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> dmesg (a lot of traces) and kernel-config attached.
>
> UXA causes still screen corruption.

Hm, was only a slim chance that this patch would fix anything - I
think you'd always see an oops when you'd hit this bug instead of just
a bit of corruption.

> $ egrep -i 'uxa|sna|accelmethod' /var/log/Xorg.0.log
> [   118.951] (**) intel(0): Option "AccelMethod" "uxa"
> [   118.960] (II) UXA(0): Driver registered support for the following
> operations:
>
> - Sedat -
>
> Is "drm/i915: More vma fixups around unbind/destroy" the nearly same fix?

Yeah, that version should get rid of the WARN noise in dmesg.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
