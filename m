From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: New pinctrl-samsung repo + fixes in my existing ones
Date: Fri, 24 Mar 2017 09:03:53 +0300
Message-ID: <20170324060353.bs77vud4lap6pbxv@kozik-lap>
References: <20170323185531.5xpgzopemxqzu2es@kozik-lap>
 <20170324011819.5tsymiaca3m5l7hj@wfg-t540p.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34976 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932488AbdCXGD7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Mar 2017 02:03:59 -0400
Received: by mail-wm0-f65.google.com with SMTP id z133so1181788wmb.2
        for <linux-next@vger.kernel.org>; Thu, 23 Mar 2017 23:03:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170324011819.5tsymiaca3m5l7hj@wfg-t540p.sh.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kbuild@lists.01.org, linux-next@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

On Fri, Mar 24, 2017 at 09:18:19AM +0800, Fengguang Wu wrote:
> Hi Krzysztof,
> 
> On Thu, Mar 23, 2017 at 08:55:31PM +0200, Krzysztof Kozlowski wrote:
> > Hi,
> > 
> > Could you add a new repo to 0-day build testing service:
> > 	git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
> > 
> > Details:
> > 	Owners: Krzysztof Kozlowski <krzk@kernel.org>
> > 		Sylwester Nawrocki <s.nawrocki@samsung.com>
> > 	integration_testing_branches: for-next
> > 	subsystems:
> > 	- pinctrl
> > 	- exynos
> > 
> > If possible, building coverage for all branches and also push build
> > notifications after every git push.
> 
> OK, I just added this accordingly:
> 
> https://github.com/fengguang/lkp-tests/blob/master/repo/linux/pinctrl-samsung
> 
> > I am also the owner of these:
> > - Samsung Exynos ARM maintainer tree:
> > 	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk
> > - My personal (work) tree:
> > 	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk-github
> > Can you change my email address to krzk@kernel.org (my address
> > @samsung.com does not work anymore)?
> 
> Sure, done.

Thank you!

Best regards,
Krzysztof
