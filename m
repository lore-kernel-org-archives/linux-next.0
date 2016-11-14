From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: unable to fetch the arm tree
Date: Mon, 14 Nov 2016 21:42:49 +1100
Message-ID: <20161114214249.21ebfb09@canb.auug.org.au>
References: <20161114092922.2963d6d8@canb.auug.org.au>
        <20161114102219.GE17314@flint.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45393 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751608AbcKNKmx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 05:42:53 -0500
In-Reply-To: <20161114102219.GE17314@flint.armlinux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Russell,

On Mon, 14 Nov 2016 10:22:19 +0000 Russell King <rmk@armlinux.org.uk> wrote:
>
> Gah, that's down to selinux having an argument over how the repository
> should be labelled - different parts of the system want different
> labels on that.  selinux is sometimes a nightmare.
> 
> Should be fixed now.

Yep, looks good, thanks.

-- 
Cheers,
Stephen Rothwell
