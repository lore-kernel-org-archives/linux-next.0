From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Date: Fri, 29 Jun 2012 11:01:45 +0200
Message-ID: <CAKMK7uE=Jh8Sh_knC7L2=nmCiwPrt0Q5f4Cv4djpgsncOxFfpQ@mail.gmail.com>
References: <20120629133046.f6c65d4d6017d2ae486cfd2b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:48987 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751391Ab2F2JBq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jun 2012 05:01:46 -0400
Received: by gglu4 with SMTP id u4so2486030ggl.19
        for <linux-next@vger.kernel.org>; Fri, 29 Jun 2012 02:01:46 -0700 (PDT)
In-Reply-To: <20120629133046.f6c65d4d6017d2ae486cfd2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 29, 2012 at 5:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Dave,
>
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/intel_display.c between commit 7aa1e7f06d6e ("Revert
> "drm/i915: allow PCH PWM override on IVB"") from Linus' tree and commit
> 7cf416014813 ("drm/i915: clear up backlight #define confusion on gen4+")
> from the drm tree.
>
> The former removed the function ivb_pch_pwm_override() that is modified
> by the latter, so I did that - or should I have just ignored the revert
> patch?

Nope, the revert should take precedence because that code is bogus -
the change in -next is just replacing a magic value with a proper
#define.

Cheers, Daniel
-- 
Daniel Vetter
daniel.vetter@ffwll.ch - +41 (0) 79 365 57 48 - http://blog.ffwll.ch
