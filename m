From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: build failure
Date: Tue, 9 Dec 2008 13:05:26 -0800
Message-ID: <200812091305.28858.jbarnes@virtuousgeek.org>
References: <20081209183404.637d3331.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-124.bluehost.com ([67.222.38.24]:42470 "HELO
	outbound-mail-124.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753515AbYLIVMe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 16:12:34 -0500
In-Reply-To: <20081209183404.637d3331.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>, linux-next@vger.kernel.org, Eric Anholt <eric@anholt.net>, Venki Pallipadi <venkatesh.pallipadi@intel.com>

On Monday, December 08, 2008 11:34 pm Stephen Rothwell wrote:
> Hi Dave,
>
> Today's linux-next build (powerpc allyesconfig) failed like this:
>
> drivers/gpu/drm/drm_gem.c: In function 'drm_gem_mmap':
> drivers/gpu/drm/drm_gem.c:519: error: '_PAGE_CACHE_WC' undeclared (first
> use in this function)
>
> Caused by commit 33b801854540a4f5205c0b2b4b91987e7f21af08 ("drm: GEM mmap
> support").  I tried to revert just that commit, but it lead me down a
> road of dependent commits, so I have reverted the whole drm tree for
> today.
>
> _PAGE_CACHE_WC appears to be defined only for x86 and, before the above
> commit, was not used outside arch/x86.

We might be able to use the new pgprot_writecombine function, but I think 
that's only in an x86 branch atm...  And it doesn't look like it's properly 
stubbed out on non-x86, which means more #ifdefs.

-- 
Jesse Barnes, Intel Open Source Technology Center
