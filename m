From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the security tree with the vfs tree
Date: Mon, 4 Jan 2016 12:55:12 +1100
Message-ID: <20160104125512.53a64cd2@canb.auug.org.au>
References: <20151231152453.08cfae79@canb.auug.org.au>
	<1451871440.2772.16.camel@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34668 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751894AbcADBzO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 3 Jan 2016 20:55:14 -0500
In-Reply-To: <1451871440.2772.16.camel@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: James Morris <jmorris@namei.org>, Al Viro <viro@ZenIV.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Petko Manolov <petkan@mip-labs.com>

Hi Mimi,

On Sun, 03 Jan 2016 20:37:20 -0500 Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
>
> FYI, I pushed out Petko's patch to linux-integrity/next earlier today.
> His patch moves taking the ima_write_mutex to after the the call to
> copy_from_user(), as discussed.  This obviously won't fix the conflict
> with Al's patch.  How do you want to handle it?  Do I need to do
> anything?

No, I will just do a different conflict resolution.  I will send the
usual email when I get to it.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
