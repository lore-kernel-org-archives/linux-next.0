From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: Tree for Aug 21 [ screen corruption in graphical mode ]
Date: Thu, 22 Aug 2013 13:32:16 +0200
Message-ID: <CAKMK7uHfPb67Mshczxv6aPwwjQMb-tFwmdg8aH0VVSHnSyLiwA@mail.gmail.com>
References: <CA+icZUUkS-UptLRM1CfcaHH=8UD-ZaHbXr8wFkA+YKyk-rPjvg@mail.gmail.com>
	<20130821134441.GE26909@phenom.ffwll.local>
	<CA+icZUVLau7AgZvcnWKjx=tc4WeuJ3qEH7qQta+YLKDmxk6QvA@mail.gmail.com>
	<20130821212012.GH26909@phenom.ffwll.local>
	<CA+icZUUoZ3WRNChLJ8vfP_MxJhTu2annkWCmB8jnqOxNKSEtOg@mail.gmail.com>
	<20130822072417.GM26909@phenom.ffwll.local>
	<CA+icZUXoebf4p1pp6wkaOMFbfVjjL1+wDbYF+SvLUjkm991Rcg@mail.gmail.com>
	<CAKMK7uG5AntN=nQ6TWUwNgXJh7tATu5TacccYah36sXnLAmAiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKMK7uG5AntN=nQ6TWUwNgXJh7tATu5TacccYah36sXnLAmAiQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, Stephen Rothwell <sfr@canb.auug.org.au>, "s.dilek" <s.dilek@jpberlin.de>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 22, 2013 at 1:30 PM, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Thu, Aug 22, 2013 at 1:13 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> dmesg (a lot of traces) and kernel-config attached.
>>
>> UXA causes still screen corruption.
>
> Hm, was only a slim chance that this patch would fix anything - I
> think you'd always see an oops when you'd hit this bug instead of just
> a bit of corruption.

Ok, I think it's time to throw in the towel a bit. I've dropped


commit d46f1c3f1372e3a72fab97c60480aa4a1084387f
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Thu Aug 8 14:41:06 2013 +0100

    drm/i915: Allow the GPU to cache stolen memory

from my queue. I guess we can retry for 3.13 again.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
