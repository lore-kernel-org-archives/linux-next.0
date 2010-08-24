From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] Fix section mismatch: ata_sff_exit
Date: Tue, 24 Aug 2010 10:47:33 +0200
Message-ID: <4C738725.5070101@kernel.org>
References: <4c72d77a17302aa2a9@agluck-desktop.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:37892 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753372Ab0HXIws (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Aug 2010 04:52:48 -0400
In-Reply-To: <4c72d77a17302aa2a9@agluck-desktop.sc.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>, Jeff Garzik <jgarzik@redhat.com>
Cc: linux-next@vger.kernel.org, linux-ide@vger.kernel.org

On 08/23/2010 10:18 PM, Luck, Tony wrote:
> This build error showed up in linux-next tag next-20100820 for ia64:
> 
> WARNING: vmlinux.o(.init.text+0x4a952): Section mismatch in reference from the function ata_init() to the function .exit.text:ata_sff_exit()
> The function __init ata_init() references
> a function __exit ata_sff_exit().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> ata_sff_exit() so it may be used outside an exit section.
> 
> Sure enough, dropping the __exit fixes the problem.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
> 
> Tejun: I didn't pin down which commit broke this ... but you seem
> to have a number of recent commits here.

It's the scsi transport addition.  It adds an init failure case where
ata_sff_exit() is called to undo initialization, so your fix is
correct.

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
