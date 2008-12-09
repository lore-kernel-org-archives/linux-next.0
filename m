From: "J. Bruce Fields" <bfields@fieldses.org>
Subject: Re: linux-next: manual merge of the net tree
Date: Tue, 9 Dec 2008 17:17:08 -0500
Message-ID: <20081209221708.GH8596@fieldses.org>
References: <20081209132136.c58c0ca5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.fieldses.org ([66.93.2.214]:57703 "EHLO fieldses.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751073AbYLIWRN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 17:17:13 -0500
Content-Disposition: inline
In-Reply-To: <20081209132136.c58c0ca5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Harvey Harrison <harvey.harrison@gmail.com>, Chuck Lever <chuck.lever@oracle.com>

On Tue, Dec 09, 2008 at 01:21:36PM +1100, Stephen Rothwell wrote:
> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> fs/lockd/host.c between commit 3105d87fe1d311e80fd4781e82fa519fd5e2ffe2
> ("NLM: Support IPv6 scope IDs in nlm_display_address()") from the nfsd
> tree and various commits that replace the NIP* macros from the net tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks!

I could rebase nfsd onto net in this case if that'd simplify your life.
Assuming net never rebases that wouldn't cause additional conflicts for
you.

And that's more-or-less what we'll end up doing come the merge window
anyway.

(Or we could pull one of net or nfsd into the other.)

--b.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/
> 
> diff --cc fs/lockd/host.c
> index 472aac1,c48c263..0000000
> --- a/fs/lockd/host.c
> +++ b/fs/lockd/host.c
> @@@ -105,37 -104,25 +105,37 @@@ static void nlm_clear_port(struct socka
>   	}
>   }
>   
>  -static void nlm_display_address(const struct sockaddr *sap,
>  -				char *buf, const size_t len)
>  +static void nlm_display_ipv4_address(const struct sockaddr *sap, char *buf,
>  +				     const size_t len)
>   {
>   	const struct sockaddr_in *sin = (struct sockaddr_in *)sap;
> - 	snprintf(buf, len, NIPQUAD_FMT, NIPQUAD(sin->sin_addr.s_addr));
> ++	snprintf(buf, len, "%pI4", &sin->sin_addr.s_addr);
>  +}
>  +
>  +static void nlm_display_ipv6_address(const struct sockaddr *sap, char *buf,
>  +				     const size_t len)
>  +{
>   	const struct sockaddr_in6 *sin6 = (struct sockaddr_in6 *)sap;
>   
>  +	if (ipv6_addr_v4mapped(&sin6->sin6_addr))
> - 		snprintf(buf, len, NIPQUAD_FMT,
> - 				NIPQUAD(sin6->sin6_addr.s6_addr32[3]));
> ++		snprintf(buf, len, "%pI4",
> ++				&sin6->sin6_addr.s6_addr32[3]);
>  +	else if (sin6->sin6_scope_id != 0)
> - 		snprintf(buf, len, NIP6_FMT "%%%u", NIP6(sin6->sin6_addr),
> ++		snprintf(buf, len, "%pI6%%%u", &sin6->sin6_addr,
>  +				sin6->sin6_scope_id);
>  +	else
> - 		snprintf(buf, len, NIP6_FMT, NIP6(sin6->sin6_addr));
> ++		snprintf(buf, len, "%pI6", &sin6->sin6_addr);
>  +}
>  +
>  +static void nlm_display_address(const struct sockaddr *sap,
>  +				char *buf, const size_t len)
>  +{
>   	switch (sap->sa_family) {
>  -	case AF_UNSPEC:
>  -		snprintf(buf, len, "unspecified");
>  -		break;
>   	case AF_INET:
>  -		snprintf(buf, len, "%pI4", &sin->sin_addr.s_addr);
>  +		nlm_display_ipv4_address(sap, buf, len);
>   		break;
>   	case AF_INET6:
>  -		if (ipv6_addr_v4mapped(&sin6->sin6_addr))
>  -			snprintf(buf, len, "%pI4",
>  -				 &sin6->sin6_addr.s6_addr32[3]);
>  -		else
>  -			snprintf(buf, len, "%pI6", &sin6->sin6_addr);
>  +		nlm_display_ipv6_address(sap, buf, len);
>   		break;
>   	default:
>   		snprintf(buf, len, "unsupported address family");
