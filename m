From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: build failure after merge of the
	drm-intel tree
Date: Tue, 18 Mar 2014 21:18:42 -0400
Message-ID: <20140318211842.017be730@gandalf.local.home>
References: <20140319115350.7860f102a804a9975ba6e93d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20140319115350.7860f102a804a9975ba6e93d@canb.auug.org.au>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

On Wed, 19 Mar 2014 11:53:50 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:


> Caused by commit a25ca17c1eac ("drm/i915: Do not dereference pointers
> from ring buffer in evict event").
> 
> I have used the drm-intel tree from next-20140318 for today.
> 

Bah! I'm still suffering from jet lag (just came back from Linux-Tage
in Chemnitz).

The next time I compile test a patch for a module, I'll make sure I have
that module's config option set :-(  The woe of using localmodconfig. I
should have picked the box with the i915. :-/

Below is the fix. I'll repost a v2 of the original patch.

Sorry about that.

-- Steve

diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
index f3e8a90..783ae08 100644
--- a/drivers/gpu/drm/i915/i915_trace.h
+++ b/drivers/gpu/drm/i915/i915_trace.h
@@ -243,7 +243,7 @@ TRACE_EVENT(i915_gem_evict_vm,
 			    ),
 
 	    TP_fast_assign(
-			   __entry->dev = dev->primary->index;
+			   __entry->dev = vm->dev->primary->index;
 			   __entry->vm = vm;
 			  ),
