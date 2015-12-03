From: Imre Deak <imre.deak@intel.com>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-intel-fixes tree
Date: Thu, 03 Dec 2015 16:52:09 +0200
Message-ID: <1449154329.23688.1.camel@intel.com>
References: <20151203144741.8c03178c8344950783fa32db@kernel.org>
Reply-To: imre.deak@intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:9966 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964978AbbLCOwN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2015 09:52:13 -0500
In-Reply-To: <20151203144741.8c03178c8344950783fa32db@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.jakobsson@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On to, 2015-12-03 at 14:47 +0000, Mark Brown wrote:
> Hi Dave,
> 
> Today's linux-next merge of the drm tree got a conflict in
> drivers/gpu/drm/i915/i915_drv.h and
> drivers/gpu/drm/i915/i915_debugfs.c between
> commit ac9b8236551d ("drm/i915: Introduce a gmbus power domain") from
> the
> drm-intel-fixes tree and commit dfa5762793a40b4b03 ("drm/i915: Add a
> modeset
> power domain") from the drm tree.
> 
> I notice that the modeset commit is missing a signoff from Imre who
> is the
> committer by the way, the commiter should have a signoff.

Yes, sorry for that, I simply forgot to add those (it's also missing
from a few others around the one you found). I'll make sure to sign off
such commits in the future.

--Imre

> I fixed it up (resulting in a null diff) and can carry the fix as
> necessary (no
> action is required).
