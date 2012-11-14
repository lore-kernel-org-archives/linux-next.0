From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Nov 14 (gpu/drm/i915)
Date: Wed, 14 Nov 2012 12:17:47 -0800
Message-ID: <20121114121747.46ffe05f.akpm@linux-foundation.org>
References: <20121114163042.64f0c0495663331b9c2d60d6@canb.auug.org.au>
	<50A3F3FD.4070707@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A3F3FD.4070707@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>
List-Id: linux-next.vger.kernel.org

On Wed, 14 Nov 2012 11:41:49 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 11/13/2012 09:30 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > News: next-20121115 (i.e. tomorrow) will be the last release until
> > next-20121126 (which should be just be after -rc7, I guess - assuming
> > that Linus does not release v3.7 before then), so if you want something
> > in linux-next for a reasonable amount of testing, it should probably be
> > committed tomorrow.
> > 
> > Changes since 20121113:
> > 
> 
> 
> 
> on i386:
> 
> ERROR: "__build_bug_on_failed" [drivers/gpu/drm/i915/i915.ko] undefined!
> 
> Reference to that symbol is found in
> i915_gem_execbuffer.o.  Reference to BUILD_BUG_ON() is found in
> i915_gem_execbuffer.c:
> 
> static struct eb_objects *
> eb_create(int size)
> {
> 	struct eb_objects *eb;
> 	int count = PAGE_SIZE / sizeof(struct hlist_head) / 2;
> 	BUILD_BUG_ON(!is_power_of_2(PAGE_SIZE / sizeof(struct hlist_head)));
> 

Where to start.

- eb_create() has no business assuming that the hlist_head has any
  particular size.  We could easily add some conditionally-compiled
  debug fields in there, and drm blows up.

- The assertion is obviously true at present, so I assume that gcc
  screwed up and failed to reduce all that to a compile-time constant.

- We have a BUILD_BUG_ON_NOT_POWER_OF_2().  Use it?

- This code is using PAGE_SIZE to scale a kernel data structure. 
  PAGE_SIZE can vary by a factor of 16, depending on Kconfig.  This
  can result in 64k PAGE_SIZE machines exhibiting different beahviour
  from that which the testers saw.

  Don't do it.  It's better to hard-wire 4096.
