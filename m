From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/i915: fix command parser debug print
	format mismatches
Date: Wed, 02 Apr 2014 08:26:23 -0700
Message-ID: <533C2C1F.5010303@infradead.org>
References: <533B106B.8090408@infradead.org>
 <1396427060-12539-1-git-send-email-jani.nikula@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <1396427060-12539-1-git-send-email-jani.nikula@intel.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 04/02/2014 01:24 AM, Jani Nikula wrote:
> Drop the cast from the pointer diff to fix:
> 
> drivers/gpu/drm/i915/i915_cmd_parser.c:405:4: warning: format '%td' expects
> argument of type 'ptrdiff_t', but argument 5 has type 'long unsigned int'
> [-Wformat]
> 
> While at it, use %u for u32.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Randy, try as I might, I wasn't able to coerce gcc to spit out that
> warning. Please enlighten me! (Does this fix the warn?)

Yes, it does.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> Thanks for the report.
> ---
>  drivers/gpu/drm/i915/i915_cmd_parser.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
> index 71ac3b4eaa0d..e5c4e99a22fb 100644
> --- a/drivers/gpu/drm/i915/i915_cmd_parser.c
> +++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
> @@ -811,10 +811,10 @@ int i915_parse_cmds(struct intel_ring_buffer *ring,
>  			length = ((*cmd & desc->length.mask) + LENGTH_BIAS);
>  
>  		if ((batch_end - cmd) < length) {
> -			DRM_DEBUG_DRIVER("CMD: Command length exceeds batch length: 0x%08X length=%d batchlen=%td\n",
> +			DRM_DEBUG_DRIVER("CMD: Command length exceeds batch length: 0x%08X length=%u batchlen=%td\n",
>  					 *cmd,
>  					 length,
> -					 (unsigned long)(batch_end - cmd));
> +					 batch_end - cmd);
>  			ret = -EINVAL;
>  			break;
>  		}
> 


-- 
~Randy
