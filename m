From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: error while fetching the spi-nor tree
Date: Wed, 13 Dec 2017 10:40:23 +1100
Message-ID: <20171213104023.2753e926@canb.auug.org.au>
References: <20171213075845.5923cc80@canb.auug.org.au>
        <12d92a91-bacc-38ae-9906-ac83ed32a0f6@wedev4u.fr>
        <20171213093530.15c3ac0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39675 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752723AbdLLXk0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Dec 2017 18:40:26 -0500
In-Reply-To: <20171213093530.15c3ac0b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>

Hi Cyrille,

On Wed, 13 Dec 2017 09:35:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> [cc'ing Linus on the off chance he knows something relevant]
> 
> On Tue, 12 Dec 2017 22:24:17 +0100 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:
> >
> > I've just added 2 commits about 8 hours ago, nothing special.
> > Could the issue be explained by an unlikely bad timing?  

I assume you did something as the fetch works fine now (including the 2
new commits).

-- 
Cheers,
Stephen Rothwell
