From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] linux-next: manual merge of the drm-intel tree with
 the drm-intel-fixes tree
Date: Wed, 30 Apr 2014 08:12:07 +0200
Message-ID: <CAKMK7uGWZeURcopQT1oUw4sDnY2-QhjXr3xaTWx=o=V91dNhEg@mail.gmail.com>
References: <20140430123753.16dd13b23d29e09548a4bd56@canb.auug.org.au>
	<87r44fidgp.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:51100 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbaD3GMJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Apr 2014 02:12:09 -0400
Received: by mail-ie0-f170.google.com with SMTP id rd18so1433857iec.29
        for <linux-next@vger.kernel.org>; Tue, 29 Apr 2014 23:12:08 -0700 (PDT)
In-Reply-To: <87r44fidgp.fsf@intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>

On Wed, Apr 30, 2014 at 7:38 AM, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 30 Apr 2014, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> Today's linux-next merge of the drm-intel tree got a conflict in
>> drivers/gpu/drm/i915/i915_gem_gtt.c between commitcfa7c862982b
>> ("drm/i915: Sanitize the enable_ppgtt module option once") from the
>> drm-intel-fixes tree tree and commit 5db6c735ead5 ("drm/i915: dmesg
>> output for VT-d testing") from the drm-intel tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>
> Hi Stephen -
>
> [off-list to not confuse everyone; I'll confuse just you instead!]

Re-adding linux-next since it might be interesting for others.

> IIUC you pull both our for-linux-next-fixes and for-linux-next
> branches. There's bound to be occasional conflicts, as the former is
> based on Linus' tree with fixes for -rc and -stable, and the latter
> contains the new development for -next.
>
> Now, every time Daniel or I push to either one, we reconstruct our
> drm-intel-nightly branch [1] which merges both (and then some). Which
> means we've already resolved any conflicts once (and have some tooling
> to share the conflict resolutions between ourselves). If you look at the
> merge commits there, you'll see how we have resolved the conflicts.
>
> As far as I can tell you and the other linux-next maintainers have done
> a good job resolving our conflicts for -next (also this time), but I am
> wondering whether that's a burden that could be reduced. At the very
> least there's our -nightly branch you can look at if in doubt.
>
> Thoughts?

On that topic we have a rerere-cache branch in the drm-intel.git repo
which contains the .git/rr-cache directory plus any manual fixup
patches we need. That might be easier for peeking merge resolutions.

Another issue I wonder about is topic branches. We've started to use
them a bit more the past releases, but most of them are fairly
temporary in nature. I.e. I pull in reviewed patches into a new topic/
branch, let it soak for a bit and then either send the pull request to
Dave directly or merge it into drm-intel-next-queued. topic/core-stuff
is the only stable topic branch (contains random non-i915 drm patches
I pick up) so would imo make sense to add it to linux-next. But I'm
not sure about the others.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
