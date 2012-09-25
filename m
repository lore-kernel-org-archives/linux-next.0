From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Tue, 25 Sep 2012 13:51:34 +0200
Message-ID: <201209251351.35007.rjw@sisk.pl>
References: <20120925143034.f7bda6d8a5a11e87f2e60ef3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([193.178.161.156]:43447 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755818Ab2IYLpB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Sep 2012 07:45:01 -0400
In-Reply-To: <20120925143034.f7bda6d8a5a11e87f2e60ef3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andre Przywara <andre.przywara@amd.com>

On Tuesday, September 25, 2012, Stephen Rothwell wrote:
> Hi Rafael,
> 
> After merging the pm tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> drivers/cpufreq/powernow-k8.c: In function 'transition_frequency_pstate':
> drivers/cpufreq/powernow-k8.c:991:19: error: 'HW_PSTATE_MASK' undeclared (first use in this function)
> drivers/cpufreq/powernow-k8.c:991:19: note: each undeclared identifier is reported only once for each function it appears in
> drivers/cpufreq/powernow-k8.c:992:19: error: 'struct powernow_k8_data' has no member named 'max_hw_pstate'
> drivers/cpufreq/powernow-k8.c:995:2: error: implicit declaration of function 'find_khz_freq_from_pstate' [-Werror=implicit-function-declaration]
> drivers/cpufreq/powernow-k8.c:996:8: error: 'struct powernow_k8_data' has no member named 'currpstate'
> drivers/cpufreq/powernow-k8.c:1004:2: error: implicit declaration of function 'transition_pstate' [-Werror=implicit-function-declaration]
> drivers/cpufreq/powernow-k8.c: At top level:
> drivers/cpufreq/powernow-k8.c:981:12: warning: 'transition_frequency_pstate' defined but not used [-Wunused-function]
> 
> The code causing this was removed by commit e1f0b8e9b04a ("cpufreq:
> Remove support for hardware P-state chips from powernow-k8") but
> reintroduced (presumably incorrectly) by commit d20801be3c11 ("Merge
> branch 'master' into linux-next").
> 
> I have used the pm tree from next-20120924 for today.

It looks like I got the merge wrong.  Sorry about that, I'll fix it up later
today.

Thanks,
Rafael
