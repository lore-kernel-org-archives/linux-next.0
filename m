From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the regulator tree
Date: Fri, 3 Feb 2017 09:30:04 +1100
Message-ID: <20170203092955.62f9681b@canb.auug.org.au>
References: <20170201134221.7a413d9b@canb.auug.org.au>
        <20170201100343.yv5e66pxkdmlnoxm@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751500AbdBBWaG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Feb 2017 17:30:06 -0500
In-Reply-To: <20170201100343.yv5e66pxkdmlnoxm@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

Hi Mark,

On Wed, 1 Feb 2017 10:03:43 +0000 Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 01, 2017 at 01:42:21PM +1100, Stephen Rothwell wrote:
> 
> > Caused by commit
> > 
> >   524d339a9d6b ("regulator: anatop-regulator: constify regulator_ops structure")
> > 
> > I can only assume that this patch has been rebased since it was tested.  
> 
> Discarded that commit.

The patch is still there ...

-- 
Cheers,
Stephen Rothwell
