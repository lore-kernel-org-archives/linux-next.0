From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH] mfd: fix modular builds of rc5t583 regulator support
Date: Mon, 16 Apr 2012 21:26:41 +0200
Message-ID: <20120416192641.GB24130@sortiz-mobl>
References: <1334549301-32114-1-git-send-email-paul.gortmaker@windriver.com>
 <4F8BC20A.2090105@nvidia.com>
 <4F8C28C5.9070308@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:7458 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754126Ab2DPTRs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Apr 2012 15:17:48 -0400
Content-Disposition: inline
In-Reply-To: <4F8C28C5.9070308@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Hi Paul, Laxman,

On Mon, Apr 16, 2012 at 10:12:21AM -0400, Paul Gortmaker wrote:
> On 12-04-16 02:54 AM, Laxman Dewangan wrote:
> > On Monday 16 April 2012 09:38 AM, Paul Gortmaker wrote:
> >> The combination of commit 1b1247dd75aa5cf5fae54a3bec7280046e9c7957
> >>
> >>      "mfd: Add support for RICOH PMIC RC5T583"
> >>
> >> and commit 6ffc3270210efa2bea526953a142ffc908f5bd86
> >>
> >>      "regulator: Add support for RICOH PMIC RC5T583 regulator"
> >>
> >> are causing the i386 allmodconfig builds to fail with this:
> >>
> >>    ERROR: "rc5t583_update" [drivers/regulator/rc5t583-regulator.ko] undefined!
> >>    ERROR: "rc5t583_set_bits" [drivers/regulator/rc5t583-regulator.ko] undefined!
> >>    ERROR: "rc5t583_clear_bits" [drivers/regulator/rc5t583-regulator.ko] undefined!
> >>    ERROR: "rc5t583_read" [drivers/regulator/rc5t583-regulator.ko] undefined!
> >>
> >> and this:
> >>
> >>    ERROR: "rc5t583_ext_power_req_config" [drivers/regulator/rc5t583-regulator.ko] undefined!
> >>
> >> For the 1st four, make the simple ops static inline, instead of
> >> polluting the namespace with trivial exports.  For the last one,
> >> add an EXPORT_SYMBOL.
> >>
> >> Signed-off-by: Paul Gortmaker<paul.gortmaker@windriver.com>
> >> ---
> >>
> >> [ alternately, make REGULATOR_RC5T583 bool instead of tristate? ]
> > 
> > Why not export all require symbol from mfd core.
> > I am sending the patch to exporting all required apis. Please review.
> 
> As I said in the commit log, it doesn't seem to make sense to export
> them when they are trivial enough to be static inline, since it
> avoids having them pollute the /proc/kallsyms namespace.
I'm applying Paul's patch to my for-linus branch, thanks guys.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
