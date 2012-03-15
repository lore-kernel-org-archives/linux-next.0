From: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] cpuidle : fix random hangs with intel_idle
Date: Wed, 14 Mar 2012 17:23:26 -0700 (PDT)
Message-ID: <alpine.LSU.2.00.1203141720360.2003@eggly.anvils>
References: <alpine.LSU.2.00.1203131454500.1335@eggly.anvils> <1331770181-800-1-git-send-email-daniel.lezcano@linaro.org> <20120315111415.cd119171ac86967aebe85545@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120315111415.cd119171ac86967aebe85545@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, akpm@linux-foundation.org, rob.lee@linaro.org, j-pihet@ti.com, khilman@ti.com, deepthi@linux.vnet.ibm.com, dan.carpenter@oracle.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org
List-Id: linux-next.vger.kernel.org

On Thu, 15 Mar 2012, Stephen Rothwell wrote:
> On Thu, 15 Mar 2012 01:09:41 +0100 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >
> > The cpuidle consolidation inverts the local_irq_enable for
> > the poll_idle function with CPU_RELAX.
> > 
> > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Reported-by: Hugh Dickins <hughd@google.com>
> 
> So this needs to go into Rob's tree.  Maybe after Hugh verifies that it
> fixes his problem.

Yes, Daniel got me to try it offline before he posted it.

Tested-by: Hugh Dickins <hughd@google.com>

Personally, I'd recommend including it even before it gets into Rob's
tree (where it may well be improved upon first): it does a lot to
improve the usability of linux-next.

Hugh
