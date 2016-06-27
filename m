From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the jc_docs tree with the drm tree
Date: Mon, 27 Jun 2016 09:48:48 -0600
Message-ID: <20160627094848.3ea53331@lwn.net>
References: <20160627133124.4e3e8dfd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:33274 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751742AbcF0Psu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 11:48:50 -0400
In-Reply-To: <20160627133124.4e3e8dfd@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>

On Mon, 27 Jun 2016 13:31:24 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   Documentation/index.rst
> 
> between commit:
> 
>   cb597fcea5c2 ("Documentation/gpu: add new gpu.rst converted from DocBook gpu.tmpl")
> 
> from the drm tree and commit:
> 
>   17defc282fe6 ("Documentation: add meta-documentation for Sphinx and kernel-doc")
> 
> from the jc_docs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. 

Sigh, I fear that index.rst could become a bit of a conflict magnet, at
least in the near future as documents are being added.

The fix is obviously correct, thanks.

jon
