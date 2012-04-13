From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Fri, 13 Apr 2012 10:59:56 +0200
Message-ID: <20120413085955.GA4525@phenom.ffwll.local>
References: <20120413133817.f8bbf0f6d95ada9f86b93800@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:53020 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932722Ab2DMI7K (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Apr 2012 04:59:10 -0400
Received: by wibhj6 with SMTP id hj6so6282096wib.1
        for <linux-next@vger.kernel.org>; Fri, 13 Apr 2012 01:59:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20120413133817.f8bbf0f6d95ada9f86b93800@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Kurtz <djkurtz@chromium.org>

On Fri, Apr 13, 2012 at 01:38:17PM +1000, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/intel_i2c.c between commit 6a562e3daee2 ("Revert
> "drm/i915: reenable gmbus on gen3+ again"") from Linus' tree and commits
> 0fb3f969c868 ("drm/i915: enable gmbus on gen2") and 2ed06c93a1fc
> ("drm/i915/intel_i2c: gmbus disabled and reserved ports are invalid")
> from the drm tree.
> 
> I just used the drm tree version.

That's correct, gmbus is too broken for 3.4, but we already have quite a
few fixes for known issues queued for 3.5, so leaving it enabled there is
the right thing for -next. I plan to do a backmerge as soon as -rc3 is out
there, I have a few more patches for drm-intel-next that depend/conflict
with new patches merged to Linus' tree.

Thanks, Daniel
-- 
Daniel Vetter
Mail: daniel@ffwll.ch
Mobile: +41 (0)79 365 57 48
