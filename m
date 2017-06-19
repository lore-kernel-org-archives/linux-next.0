From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Mon, 19 Jun 2017 11:40:28 +1000
Message-ID: <20170619114028.704e6438@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/i915/intel_dp.c:1551:12: warning: 'rate_to_index' defined but not used [-Wunused-function]
 static int rate_to_index(int find, const int *rates)
            ^

Introduced by commit

  925344ccc91d ("BackMerge tag 'v4.12-rc5' into drm-next")

This commit reintroduced the above function after it was renamed and
moved by commit

  8001b7541aa7 ("drm/i915/dp: rename rate_to_index() to intel_dp_rate_index() and reuse")

-- 
Cheers,
Stephen Rothwell
