From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Date: Thu, 03 Aug 2017 11:17:03 +0300
Message-ID: <1501748223.29303.369.camel@linux.intel.com>
References: <20170803063743.1d50a5d2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:46032 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750945AbdHCIRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Aug 2017 04:17:07 -0400
In-Reply-To: <20170803063743.1d50a5d2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Darren Hart <dvhart@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Thu, 2017-08-03 at 06:37 +1000, Stephen Rothwell wrote:
> Hi Darren,
> 
> Commits
> 
>   890f658c101d ("platform/x86: peaq-wmi: silence a static checker
> warning")
>   6d8d55626296 ("platform/x86: msi-wmi: remove unnecessary static in
> msi_wmi_notify()")
>   cd0223c64c60 ("platform/x86: ibm_rtl: remove unnecessary static in
> ibm_rtl_write()")
> 
> are missing Signed-off-by's from their commiter.
> 

I just checked what we have in our for-next branch and mentioned commits
have mine SoB. Should they have something else?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
