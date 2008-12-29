From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [ofa-general] Re: linux-next: origin tree build failure
Date: Mon, 29 Dec 2008 13:07:16 -0800 (PST)
Message-ID: <alpine.LFD.2.00.0812291304471.3082@localhost.localdomain>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<ada4p0nve4r.fsf@cisco.com> <1230544737.4261.33.camel@alst60>
	<adaljtyu45d.fsf@cisco.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <adaljtyu45d.fsf@cisco.com>
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: Roland Dreier <rdreier@cisco.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "general@lists.openfabrics.org" <general@lists.openfabrics.org>, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-next.vger.kernel.org



On Mon, 29 Dec 2008, Roland Dreier wrote:
>
> Something like the following maybe?  (This turns off the RDMA CM if
> INFINIBAND=y and IPV6=m -- another possibility would be to just turn off
> RDMA CM IPv6 support in the case that IB is build-in but IPv6 is
> modular, but that seems like a worse idea overall)
> 
> diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
> index a5dc78a..538a0ba 100644
> --- a/drivers/infiniband/Kconfig
> +++ b/drivers/infiniband/Kconfig
> @@ -36,7 +36,7 @@ config INFINIBAND_USER_MEM
>  
>  config INFINIBAND_ADDR_TRANS
>  	bool
> -	depends on INET
> +	depends on INET && !(INFINIBAND = y && IPV6 = m)
>  	default y

I'd suggest

  config IF_IPV6
	bool
	depends on INET
	depends on !(INFINIBAND = y && IPV6 = m)
	default y

and then you can use it not only for the above:

  config INFINIBAND_ADDR_TRANS
	bool
	depends on IF_IPV6
	default y

but also use it in the source code as a more readable version:

> diff --git a/drivers/infiniband/core/addr.c b/drivers/infiniband/core/addr.c
> index d98b05b..ec7abb5 100644
> --- a/drivers/infiniband/core/addr.c> +++ b/drivers/infiniband/core/addr.c
> @@ -128,6 +128,7 @@ int rdma_translate_ip(struct sockaddr *addr, struct rdma_dev_addr *dev_addr)
>  		ret = rdma_copy_addr(dev_addr, dev, NULL);
>  		dev_put(dev);
>  		break;
> +#if defined(CONFIG_IPV6) || defined(CONFIG_IPV6_MODULE)

ie use

	#ifdef CONFIG_IF_IPV6

here instead.

		Linus
