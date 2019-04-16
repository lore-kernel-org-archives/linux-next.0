From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the crypto tree
Date: Tue, 16 Apr 2019 09:05:48 +0800
Message-ID: <20190416010548.tnos7ro7rvi6mqqc@gondor.apana.org.au>
References: <20190416072342.739863fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190416072342.739863fb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 16, 2019 at 07:23:42AM +1000, Stephen Rothwell wrote:
> Hi Herbert,
> 
> In commit
> 
>   2e53582d158e ("crypto: mxc-scc - Remove broken driver")
> 
> Fixes tag
> 
>   Fixes: d293b640ebd ("crypto: mxc-scc - add basic driver for the...")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks Stephen, it should be fixed now.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
