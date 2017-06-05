From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 5 Jun 2017 12:49:33 +1000
Message-ID: <20170605124933.2ee737db@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33509 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751212AbdFECth (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Jun 2017 22:49:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_dp.c

between commit:

  8001b7541aa7 ("drm/i915/dp: rename rate_to_index() to intel_dp_rate_index() and reuse")

from Linus' tree and commit:

  3194102439f6 ("drm/i915/dp: use known correct array size in rate_to_index")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/intel_dp.c
index fc691b8b317c,4a6feb6a69bd..000000000000
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -1507,17 -1548,37 +1548,6 @@@ static void intel_dp_print_rates(struc
  	DRM_DEBUG_KMS("common rates: %s\n", str);
  }
  
- static int rate_to_index(int find, const int *rates)
 -bool
 -__intel_dp_read_desc(struct intel_dp *intel_dp, struct intel_dp_desc *desc)
--{
- 	int i = 0;
 -	u32 base = drm_dp_is_branch(intel_dp->dpcd) ? DP_BRANCH_OUI :
 -						      DP_SINK_OUI;
--
- 	for (i = 0; i < DP_MAX_SUPPORTED_RATES; ++i)
- 		if (find == rates[i])
- 			break;
 -	return drm_dp_dpcd_read(&intel_dp->aux, base, desc, sizeof(*desc)) ==
 -	       sizeof(*desc);
 -}
--
- 	return i;
 -bool intel_dp_read_desc(struct intel_dp *intel_dp)
 -{
 -	struct intel_dp_desc *desc = &intel_dp->desc;
 -	bool oui_sup = intel_dp->dpcd[DP_DOWN_STREAM_PORT_COUNT] &
 -		       DP_OUI_SUPPORT;
 -	int dev_id_len;
 -
 -	if (!__intel_dp_read_desc(intel_dp, desc))
 -		return false;
 -
 -	dev_id_len = strnlen(desc->device_id, sizeof(desc->device_id));
 -	DRM_DEBUG_KMS("DP %s: OUI %*phD%s dev-ID %*pE HW-rev %d.%d SW-rev %d.%d\n",
 -		      drm_dp_is_branch(intel_dp->dpcd) ? "branch" : "sink",
 -		      (int)sizeof(desc->oui), desc->oui, oui_sup ? "" : "(NS)",
 -		      dev_id_len, desc->device_id,
 -		      desc->hw_rev >> 4, desc->hw_rev & 0xf,
 -		      desc->sw_major_rev, desc->sw_minor_rev);
 -
 -	return true;
--}
--
  int
  intel_dp_max_link_rate(struct intel_dp *intel_dp)
  {
@@@ -1587,16 -1654,13 +1623,15 @@@ intel_dp_compute_config(struct intel_en
  	/* Conveniently, the link BW constants become indices with a shift...*/
  	int min_clock = 0;
  	int max_clock;
- 	int link_rate_index;
  	int bpp, mode_rate;
  	int link_avail, link_clock;
- 	int common_rates[DP_MAX_SUPPORTED_RATES] = {};
  	int common_len;
  	uint8_t link_bw, rate_select;
 +	bool reduce_m_n = drm_dp_has_quirk(&intel_dp->desc,
 +					   DP_DPCD_QUIRK_LIMITED_M_N);
  
- 	common_len = intel_dp_common_rates(intel_dp, common_rates);
+ 	common_len = intel_dp_common_len_rate_limit(intel_dp,
+ 						    intel_dp->max_link_rate);
  
  	/* No common link rates between source and sink */
  	WARN_ON(common_len <= 0);
