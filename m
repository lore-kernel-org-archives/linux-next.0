From: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: linux-next: build warning after merge of the final tree
Date: Wed, 28 Mar 2012 00:59:36 -0700
Message-ID: <CABE8wwtqSC01O+DsjQp5U0shQh99e0vctHqRRY8e4OfxD+TaxA@mail.gmail.com>
References: <20120326151147.30727745f5a3410d87f391dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:12981 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751683Ab2C1H7h (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 03:59:37 -0400
Received: by iage36 with SMTP id e36so1488273iag.25
        for <linux-next@vger.kernel.org>; Wed, 28 Mar 2012 00:59:36 -0700 (PDT)
In-Reply-To: <20120326151147.30727745f5a3410d87f391dc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 25, 2012 at 9:11 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> produced these warnings (and many similar):
>
> In file included from drivers/scsi/hosts.c:41:0:
> drivers/scsi/scsi_priv.h:166:1: warning: "__enabled_CONFIG_PM" is not defined [-Wundef]
> drivers/scsi/scsi_priv.h:166:1: warning: "__enabled_CONFIG_PM_MODULE" is not defined [-Wundef]
>
> Introduced by commit a6a95fad44f1 ("scsi, sd: limit the scope of the
> async probe domain").

So, sparc does not source kernel/power/Kconfig or define config PM
locally.  Compiling out this list_head (scsi_sd_probe_domain) in the
!PM && !BLK_DEV_SD case may be more trouble then it is worth.  I'll
re-spin the patch without the IS_ENABLED conditionals.

--
Dan
