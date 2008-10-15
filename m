From: Shaohua Li <shaohua.li@intel.com>
Subject: Re: linux-next: acpi tree build failure
Date: Wed, 15 Oct 2008 13:15:26 +0800
Message-ID: <20081015051526.GA25322@sli10-desk.sh.intel.com>
References: <20081015160837.71912a6d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8952 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750932AbYJOFQV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 01:16:21 -0400
Content-Disposition: inline
In-Reply-To: <20081015160837.71912a6d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>

On Wed, Oct 15, 2008 at 01:08:37PM +0800, Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "acpi_os_hotplug_execute" [drivers/acpi/dock.ko] undefined!
> 
> Caused by commit 19cd847ab24fefe9e50101ec94479e0400a08650 ("ACPI: fix
> hotplug race").  I added the patch below.
We need make dock driver not a module.

Len,
please check your mail box, I had sent the patch (make dock driver built-int) to you before.

Thanks,
Shaohua
