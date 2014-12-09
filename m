From: Aaron Lu <aaron.lu@intel.com>
Subject: Re: linux-next: build failure after merge of the thermal tree
Date: Tue, 09 Dec 2014 10:31:33 +0800
Message-ID: <54865F05.2060103@intel.com>
References: <20141209131744.084929df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:31948 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753190AbaLICbf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2014 21:31:35 -0500
In-Reply-To: <20141209131744.084929df@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Sorry for the trouble.

Hi Rui,

Please let me know if you want an update to the original patch
or an incremental one.

Thanks,
Aaron

On 12/09/2014 10:17 AM, Stephen Rothwell wrote:
> Hi Zhang,
> 
> After merging the thermal tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/thermal/Kconfig:265: can't open file "drivers/thermal/int340x_thermal/Kconfig"
> 
> Caused by commit 4152c8bc018d ("Thermal: introduce INT3406 thermal
> driver").  Presumable a new file was missed.
> 
> I have used teh thermal tree from next-20141208 for today.
> 
