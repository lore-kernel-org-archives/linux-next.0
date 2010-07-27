From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] fbdev: Make jz4740-fb depends on MACH_JZ4740
Date: Tue, 27 Jul 2010 06:55:46 +0100
Message-ID: <20100727055546.GA5469@linux-mips.org>
References: <20100727111422.673b4919.sfr@canb.auug.org.au>
 <1280197979-24307-1-git-send-email-lars@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h5.dl5rb.org.uk ([81.2.74.5]:59597 "EHLO h5.dl5rb.org.uk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753046Ab0G0F4H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Jul 2010 01:56:07 -0400
Content-Disposition: inline
In-Reply-To: <1280197979-24307-1-git-send-email-lars@metafoo.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 27, 2010 at 04:32:59AM +0200, Lars-Peter Clausen wrote:

> The jz4740-fb driver should only be selectabed of MACH_JZ4740 is selected.

Thanks, folded into the original patch.

  Ralf
