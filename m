From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the final tree
 (drm-intel tree related)
Date: Wed, 13 Mar 2013 21:23:22 +0100
Message-ID: <20130313202322.GC1896@bremse>
References: <20130312152226.c5965a68f57444c8652eb46a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130312152226.c5965a68f57444c8652eb46a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Tue, Mar 12, 2013 at 03:22:26PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> drivers/built-in.o: In function `i915_min_freq_set':
> i915_debugfs.c:(.text+0xb1adc): undefined reference to `__udivdi3'
> drivers/built-in.o: In function `i915_max_freq_set':
> i915_debugfs.c:(.text+0xb1bac): undefined reference to `__udivdi3'
> 
> Caused by commit 2389cc500686 ("drm/i915: use simple attribute in debugfs
> routines") from the drm-intel tree.
> 
> I have reverted that commit for today.

Should be fixed now, thanks for the report (and my apologies for the
little screw-up).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
