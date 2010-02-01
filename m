From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: crypto-current tree build warning
Date: Mon, 1 Feb 2010 21:48:46 +1100
Message-ID: <20100201104846.GA1170@gondor.apana.org.au>
References: <20100201110709.9de06b42.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100201110709.9de06b42.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matt Mackall <mpm@selenic.com>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 01, 2010 at 11:07:09AM +1100, Stephen Rothwell wrote:
> Hi Herbert,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> drivers/char/random.c: In function 'random_write':
> drivers/char/random.c:1104: warning: unused variable 'inode'
> 
> Introduced by commit b9b06a1fda275559492f8b083927fde4cec641dc ("random:
> drop weird m_time/a_time manipulation") which removed the last usage of
> "inode".

I've fixed it in my tree.

Thanks!
-- 
Visit Openswan at http://www.openswan.org/
Email: Herbert Xu ~{PmV>HI~} <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
