From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the
	drm-intel tree
Date: Fri, 15 Feb 2013 10:30:16 +0100
Message-ID: <CAKMK7uGG4R68ED4M1uYRUZAhxRMzao0vk9oFg_vxZ8ofhx1=yw@mail.gmail.com>
References: <20130215133714.6f55139ad1a037b7b9fa1b70@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130215133714.6f55139ad1a037b7b9fa1b70@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

On Fri, Feb 15, 2013 at 3:37 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-intel tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ERROR: "pm_vt_switch_unregister" [drivers/video/fb.ko] undefined!
>
> I have dropped the tree for today.

Meh, that fail was already reported from Wu's kernel builder a few
days ago, but no patch yet showed up to fix things. Since the i915
side of that work isn't ready yet either I've dropped the offending
patches.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
