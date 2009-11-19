From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: manual merge of the edac-amd tree with the rr tree
Date: Thu, 19 Nov 2009 07:06:48 +0100
Message-ID: <20091119060648.GA15404@liondog.tnic>
References: <20091119162354.8800a885.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f221.google.com ([209.85.220.221]:51478 "EHLO
	mail-fx0-f221.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751359AbZKSGGt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2009 01:06:49 -0500
Content-Disposition: inline
In-Reply-To: <20091119162354.8800a885.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

Hi Stephen,

On Thu, Nov 19, 2009 at 04:23:54PM +1100, Stephen Rothwell wrote:
> Today's linux-next merge of the edac-amd tree got a conflict in
> drivers/edac/amd64_edac.c because commit
> 4de1ce0c99ff838090d3b57cab8bc6eeb303dda5
> ("cpumask:amd64_edac-cpumask_t-remove") from the rr tree and commit
> 2fd9af91b92c10e58993f9eb70300fdff32698fb ("cpumask: use modern cpumask
> style in drivers/edac/amd64_edac.c") from the edac-amd tree are the same
> patch but there are further changes in the edac-amd tree.  So, Rusty, I
> guess you can drop that patch (unless something later in the rr tree
> depends on it).

yes, we agreed I should pick up this patch. Rusty?

-- 
Regards/Gruss,
    Boris.
