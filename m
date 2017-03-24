From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: New pinctrl-samsung repo + fixes in my existing ones
Date: Fri, 24 Mar 2017 09:18:19 +0800
Message-ID: <20170324011819.5tsymiaca3m5l7hj@wfg-t540p.sh.intel.com>
References: <20170323185531.5xpgzopemxqzu2es@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:13256 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752344AbdCXBSY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Mar 2017 21:18:24 -0400
Content-Disposition: inline
In-Reply-To: <20170323185531.5xpgzopemxqzu2es@kozik-lap>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kbuild@lists.01.org, linux-next@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Krzysztof,

On Thu, Mar 23, 2017 at 08:55:31PM +0200, Krzysztof Kozlowski wrote:
>Hi,
>
>Could you add a new repo to 0-day build testing service:
>	git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
>
>Details:
>	Owners: Krzysztof Kozlowski <krzk@kernel.org>
>		Sylwester Nawrocki <s.nawrocki@samsung.com>
>	integration_testing_branches: for-next
>	subsystems:
>	- pinctrl
>	- exynos
>
>If possible, building coverage for all branches and also push build
>notifications after every git push.

OK, I just added this accordingly:

https://github.com/fengguang/lkp-tests/blob/master/repo/linux/pinctrl-samsung

>I am also the owner of these:
> - Samsung Exynos ARM maintainer tree:
>	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk
> - My personal (work) tree:
>	https://github.com/01org/lkp-tests/blob/master/repo/linux/krzk-github
>Can you change my email address to krzk@kernel.org (my address
>@samsung.com does not work anymore)?

Sure, done.

Thanks,
Fengguang
