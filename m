From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS/sound: DB1200 audio support depends on MIPS arch.
Date: Thu, 10 Nov 2011 12:17:42 +0000
Message-ID: <20111110121742.GE21453@linux-mips.org>
References: <20111110122241.eed1e785e4c015a51b9ef585@canb.auug.org.au>
 <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from h5.dl5rb.org.uk ([81.2.74.5]:48213 "EHLO linux-mips.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932395Ab1KJMSF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Nov 2011 07:18:05 -0500
Content-Disposition: inline
In-Reply-To: <1320924059-4142-1-git-send-email-manuel.lauss@googlemail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: alsa-devel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Thu, Nov 10, 2011 at 12:20:59PM +0100, Manuel Lauss wrote:

> DB1200 audio support should only be visible if MIPS/Alchemy arch is
> selected.  Fixes an x86-allmodconfig build failure in linux-next.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Manuel Lauss <manuel.lauss@googlemail.com>

Thanks, folded into the offending patch.

  Ralf
