From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [Intel-gfx] [PATCH 2/5] i915: Add native backlight control
Date: Fri, 21 Jan 2011 06:36:54 +0100
Message-ID: <AANLkTimogiJMKkcgfOCJHxpyZHcB36+xzRFgkqWPOiv_@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:47272 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750695Ab1AUFg7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 21 Jan 2011 00:36:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Matthew Garrett <mjg@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

( Original posting from [1] )

I have the backlight-type patchset for months in my patch-series (and
maintained them if necessary against daily linux-next).
Also the last series from 14-Jan-2011 (see 1-5 patch from [2] and the
following ones at dri-devel ML).

If you couldn't find the updated v2 radeon-backlight-type patch, here
the extract from my patch-series:
...
# Patch from <https://patchwork.kernel.org/patch/491351/>
+ backlight-type/v2-drm-radeon-kms-Expose-backlight-class-device-for-legacy-LVDS-encoder.patch
...

I can only speak for the radeon(-KMS) part with
CONFIG_BACKLIGHT_CLASS_DEVICE=y set and against linux-next: It worked,
it works.

I am a bit angry that someone of the "big 5" gets immediately an
answer where mine is ignored [3].
So dear Mr. AKPM, if you can standstill for a few moments to answer
only one of my questions, through which kernel-tree will this patchset
walk trough?
Thanks in advance.

- Sedat -

[1] http://lists.freedesktop.org/archives/dri-devel/2011-January/007378.html
[2] http://lists.freedesktop.org/archives/dri-devel/2011-January/007168.html
[3] http://lists.freedesktop.org/archives/dri-devel/2011-January/007193.html
