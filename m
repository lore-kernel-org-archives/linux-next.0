From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: bad merge in the jc_docs tree
Date: Thu, 27 Oct 2016 17:50:13 -0600
Message-ID: <20161027175013.234467d8@lwn.net>
References: <20161028103029.1e147f3e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:41395 "EHLO vena.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S937770AbcJ0XuR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Oct 2016 19:50:17 -0400
In-Reply-To: <20161028103029.1e147f3e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 28 Oct 2016 10:30:29 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> I noticed that you left some conflict markers in
> Documentation/admin-guide/index.rst in merge commit
> 
>   7a6992dc952e ("Merge branch 'doc-tweaks' into docs-next")

Argh.  I noticed that too, but failed to amend the merge before pushing.
Thanks for the heads-up.

jon
