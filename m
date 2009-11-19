From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the edac-amd tree with the rr tree
Date: Thu, 19 Nov 2009 17:26:44 +1030
Message-ID: <200911191726.44667.rusty@rustcorp.com.au>
References: <20091119162354.8800a885.sfr@canb.auug.org.au> <20091119060648.GA15404@liondog.tnic>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37415 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752385AbZKSG4m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Nov 2009 01:56:42 -0500
In-Reply-To: <20091119060648.GA15404@liondog.tnic>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Borislav Petkov <petkovbb@googlemail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Borislav Petkov <borislav.petkov@amd.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 19 Nov 2009 04:36:48 pm Borislav Petkov wrote:
> Hi Stephen,
> 
> On Thu, Nov 19, 2009 at 04:23:54PM +1100, Stephen Rothwell wrote:
> > Today's linux-next merge of the edac-amd tree got a conflict in
> > drivers/edac/amd64_edac.c because commit
> > 4de1ce0c99ff838090d3b57cab8bc6eeb303dda5
> > ("cpumask:amd64_edac-cpumask_t-remove") from the rr tree and commit
> > 2fd9af91b92c10e58993f9eb70300fdff32698fb ("cpumask: use modern cpumask
> > style in drivers/edac/amd64_edac.c") from the edac-amd tree are the same
> > patch but there are further changes in the edac-amd tree.  So, Rusty, I
> > guess you can drop that patch (unless something later in the rr tree
> > depends on it).
> 
> yes, we agreed I should pick up this patch. Rusty?

Thanks!

Rusty.
