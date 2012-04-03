From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: fix lcd power build failure in collie_defconfig
Date: Mon, 2 Apr 2012 21:55:20 -0700
Message-ID: <20120403045520.GA21904@quad.lixom.net>
References: <1333405037-3053-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:51831 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751643Ab2DCEzV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 Apr 2012 00:55:21 -0400
Received: by dake40 with SMTP id e40so3240039dak.11
        for <linux-next@vger.kernel.org>; Mon, 02 Apr 2012 21:55:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1333405037-3053-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, arm@kernel.org

On Mon, Apr 02, 2012 at 06:17:17PM -0400, Paul Gortmaker wrote:
> Commit 086ada54abaa4316e8603f02410fe8ebc9ba2de1
> 
>   "FB: sa1100: remove global sa1100fb_.*_power function pointers"
> 
> got rid of all instances but one in locomolcd.c -- which was
> conditional on CONFIG_SA1100_COLLIE.  The associated .power
> field which replaces the global is populated in mach-sa1100/collie.c
> so move the assignment there, but make it conditional on the
> locomolcd support, so use CONFIG_BACKLIGHT_LOCOMO in that file.
> 
> Cc: arm@kernel.org
> Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Thanks, applied to fixes.


-Olof
