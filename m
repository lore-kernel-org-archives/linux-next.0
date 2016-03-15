From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Wed, 16 Mar 2016 10:58:51 +1100
Message-ID: <20160316105851.015ff688@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Wagner <daniel.wagner@bmw-carit.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: linux-next.vger.kernel.org

Hi Michal,

After merging the kbuild tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/gma500/mdfld_dsi_output.c:407:39: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .dpms = /*drm_helper_connector_dpms*/mdfld_dsi_connector_dpms,
                                       ^

Caused by commit

  ea8daa7b9784 ("kbuild: Add option to turn incompatible pointer check into error")

Maybe this needs to be optional?

I have reverted that commit for today.

-- 
Cheers,
Stephen Rothwell
