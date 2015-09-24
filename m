From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Sep 24 (drivers/mfd/intel_soc_pmic_bxtwc.c)
Date: Thu, 24 Sep 2015 10:00:27 -0700
Message-ID: <56042C2B.3060401@infradead.org>
References: <20150924145335.2674d15d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52829 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805AbbIXRA3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2015 13:00:29 -0400
In-Reply-To: <20150924145335.2674d15d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Qipeng Zh <qipeng.zha@intel.com>, Samuel Ortiz <sameo@linux.intel.com>

On 09/23/15 21:53, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150923:
> 

on x86_64:

when CONFIG_ACPI is not enabled:

../drivers/mfd/intel_soc_pmic_bxtwc.c: In function 'bxtwc_probe':
../drivers/mfd/intel_soc_pmic_bxtwc.c:342:2: error: implicit declaration of function 'acpi_evaluate_integer' [-Werror=implicit-function-declaration]
  status = acpi_evaluate_integer(handle, "_HRV", NULL, &hrv);
  ^



-- 
~Randy
