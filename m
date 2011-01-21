From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Intel-gfx] [PATCH 2/5] i915: Add native backlight control
Date: Thu, 20 Jan 2011 21:55:02 -0800
Message-ID: <20110120215502.2305532b.akpm@linux-foundation.org>
References: <AANLkTimogiJMKkcgfOCJHxpyZHcB36+xzRFgkqWPOiv_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <AANLkTimogiJMKkcgfOCJHxpyZHcB36+xzRFgkqWPOiv_@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: sedat.dilek@gmail.com
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, linux-next@vger.kernel.org, Sedat Dilek <sedat.dilek@googlemail.com>, Matthew Garrett <mjg@redhat.com>
List-Id: linux-next.vger.kernel.org

On Fri, 21 Jan 2011 06:36:54 +0100 Sedat Dilek <sedat.dilek@googlemail.com> wrote:

> ( Original posting from [1] )
> 
> I have the backlight-type patchset for months in my patch-series (and
> maintained them if necessary against daily linux-next).
> Also the last series from 14-Jan-2011 (see 1-5 patch from [2] and the
> following ones at dri-devel ML).
> 
> If you couldn't find the updated v2 radeon-backlight-type patch, here
> the extract from my patch-series:
> ...
> # Patch from <https://patchwork.kernel.org/patch/491351/>
> + backlight-type/v2-drm-radeon-kms-Expose-backlight-class-device-for-legacy-LVDS-encoder.patch
> ...
> 
> I can only speak for the radeon(-KMS) part with
> CONFIG_BACKLIGHT_CLASS_DEVICE=y set and against linux-next: It worked,
> it works.
> 
> I am a bit angry that someone of the "big 5" gets immediately an
> answer where mine is ignored [3].

Well, who were they sent to?

If it was dri-devel then perhaps the people there felt it was
inappropriate to their tree, or they were all busy fixing
100000000000000 regressions.

If it was Richard then he's been distracted by other things for some
time, which is why I recently started handling backlight and leds
patches.

If it was me then kick me, but I don't think it was.

In general, if you think that patches aren't getting attention then let
me know and send them to me - harassing people for you is part of my
job description.

> So dear Mr. AKPM, if you can standstill for a few moments to answer
> only one of my questions, through which kernel-tree will this patchset
> walk trough?

leds and backlight patches are presently getting merged into my tree
and I'm sending them into Linus.  I make sure that Richard sees them
all and when he finds time he helps review them for us.

They should turn up in linux-next too - we're working on that.


This particular patch series is theoretically a bit late for 2.6.38,
but if anyone thinks that's a wrong decision, feel free to explain why.
