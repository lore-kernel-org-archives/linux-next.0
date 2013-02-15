From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure after merge of the drm-intel tree
Date: Fri, 15 Feb 2013 08:16:26 -0800
Message-ID: <20130215081626.6cbb2e74@jbarnes-desktop>
References: <20130215133714.6f55139ad1a037b7b9fa1b70@canb.auug.org.au>
	<CAKMK7uGG4R68ED4M1uYRUZAhxRMzao0vk9oFg_vxZ8ofhx1=yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy9.bluehost.com ([69.89.24.6]:35552 "HELO
	oproxy9.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932625Ab3BOQQD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 15 Feb 2013 11:16:03 -0500
In-Reply-To: <CAKMK7uGG4R68ED4M1uYRUZAhxRMzao0vk9oFg_vxZ8ofhx1=yw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 15 Feb 2013 10:30:16 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> On Fri, Feb 15, 2013 at 3:37 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > After merging the drm-intel tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: "pm_vt_switch_unregister" [drivers/video/fb.ko] undefined!
> >
> > I have dropped the tree for today.
> 
> Meh, that fail was already reported from Wu's kernel builder a few
> days ago, but no patch yet showed up to fix things. Since the i915
> side of that work isn't ready yet either I've dropped the offending
> patches.

I sent a patch yesterday for this.  I'll bounce it over again.

-- 
Jesse Barnes, Intel Open Source Technology Center
