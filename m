From: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: [Intel-gfx] linux-next: build failure after merge of the
 drm-intel tree
Date: Tue, 18 Mar 2014 18:54:15 -0700
Message-ID: <20140319015415.GD7956@bwidawsk.net>
References: <20140319115350.7860f102a804a9975ba6e93d@canb.auug.org.au>
 <20140318211842.017be730@gandalf.local.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140318211842.017be730@gandalf.local.home>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Mar 18, 2014 at 09:18:42PM -0400, Steven Rostedt wrote:
> On Wed, 19 Mar 2014 11:53:50 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> 
> > Caused by commit a25ca17c1eac ("drm/i915: Do not dereference pointers
> > from ring buffer in evict event").
> > 
> > I have used the drm-intel tree from next-20140318 for today.
> > 
> 
> Bah! I'm still suffering from jet lag (just came back from Linux-Tage
> in Chemnitz).
> 
> The next time I compile test a patch for a module, I'll make sure I have
> that module's config option set :-(  The woe of using localmodconfig. I
> should have picked the box with the i915. :-/
> 
> Below is the fix. I'll repost a v2 of the original patch.
> 
> Sorry about that.
> 

I was about to send out the same fix when I saw this.

Reviewed-by: Ben Widawsky <ben@bwidawsk.net>

> -- Steve
> 
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index f3e8a90..783ae08 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -243,7 +243,7 @@ TRACE_EVENT(i915_gem_evict_vm,
>  			    ),
>  
>  	    TP_fast_assign(
> -			   __entry->dev = dev->primary->index;
> +			   __entry->dev = vm->dev->primary->index;
>  			   __entry->vm = vm;
>  			  ),
>  
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Ben Widawsky, Intel Open Source Technology Center
