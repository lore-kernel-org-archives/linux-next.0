From: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: linux-next: nfs build failure
Date: Wed, 18 Jun 2008 16:37:06 -0400
Message-ID: <485971F2.8000005@oracle.com>
References: <20080618125213.30382b62.sfr@canb.auug.org.au> <1213820042.8233.21.camel@localhost>
Reply-To: chuck.lever@oracle.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060100090706040400040700"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:44870 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753472AbYFRUh1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jun 2008 16:37:27 -0400
In-Reply-To: <1213820042.8233.21.camel@localhost>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------060100090706040400040700
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Trond Myklebust wrote:
> On Wed, 2008-06-18 at 12:52 +1000, Stephen Rothwell wrote:
>> Hi Trond,
>>
>> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
>>
>> fs/built-in.o: In function `.nfs_parse_ip_address':
>> super.c:(.text+0xe2f08): undefined reference to `.__ipv6_addr_type'
>>
>> Some CONFIG_IPV6 protections are needed ...
>>
>> I reverted commit 09491a874d4f9a8676567bc58bce9dec9539740d ("NFS: handle
>> interface identifiers in incoming IPv6 addresses").
> 
> I suggest something like the attached patch. Comments Chuck?
> 
> Trond
> 
> 
> 
> 
> ------------------------------------------------------------------------
> 
> Subject:
> NFS: Don't allow IPv6 addresses if CONFIG_IPv6 isn't set
> From:
> Trond Myklebust <Trond.Myklebust@netapp.com>
> Date:
> Wed, 18 Jun 2008 16:04:22 -0400
> 
> 
> Fixes a compile failure in fs/nfs/super.c
> 
> Also fix the compiler warnings:
>   fs/nfs/super.c:721: warning: field width should have type ‘int’, but
>   		      argument 2 has type ‘size_t’

I just saw this warning yesterday, and was about to send a fix for it. 
Sorry for the delay, but I had a power supply go south on me today.

>   fs/nfs/super.c:809:3: warning: returning void-valued expression
>   fs/nfs/super.c:811:3: warning: returning void-valued expression

But I've never seen that one.  Very strange how the warnings vary 
depending on what platform you compile to.

> Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
> ---
> 
>  fs/nfs/super.c |   19 ++++++++++++++-----
>  1 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/nfs/super.c b/fs/nfs/super.c
> index e62820c..6a47bc3 100644
> --- a/fs/nfs/super.c
> +++ b/fs/nfs/super.c
> @@ -718,10 +718,10 @@ static void nfs_parse_ipv4_address(char *string, size_t str_len,
>  	struct sockaddr_in *sin = (struct sockaddr_in *)sap;
>  	u8 *addr = (u8 *)&sin->sin_addr.s_addr;
>  
> -	dfprintk(MOUNT, "NFS: parsing IPv4 address %*s\n",
> -			str_len, string);
> -
>  	if (str_len <= INET_ADDRSTRLEN) {
> +		dfprintk(MOUNT, "NFS: parsing IPv4 address %*s\n",
> +				(int)str_len, string);
> +

You need the same fix in nfs_parse_ipv6_address().

>  		sin->sin_family = AF_INET;
>  		*addr_len = sizeof(*sin);
>  		if (in4_pton(string, str_len, addr, '\0', NULL))
> @@ -732,6 +732,7 @@ static void nfs_parse_ipv4_address(char *string, size_t str_len,
>  	*addr_len = 0;
>  }
>  
> +#ifdef CONFIG_IPV6
>  static void nfs_parse_ipv6_scope_id(const char *string, const size_t str_len,
>  				    const char *delim,
>  				    struct sockaddr_in6 *sin6)
> @@ -787,6 +788,14 @@ static void nfs_parse_ipv6_address(char *string, size_t str_len,
>  	sap->sa_family = AF_UNSPEC;
>  	*addr_len = 0;
>  }
> +#else
> +static void nfs_parse_ipv6_address(char *string, size_t str_len,
> +				   struct sockaddr *sap, size_t *addr_len)
> +{
> +	sap->sa_family = AF_UNSPEC;
> +	*addr_len = 0;
> +}
> +#endif

Instead of creating a separate function, you could just wrap everything 
in nfs_parse_ipv6_address() but these two lines with #ifdef CONFIG_IPV6 
/ #endif.

>  
>  /*
>   * Construct a sockaddr based on the contents of a string that contains
> @@ -806,9 +815,9 @@ static void nfs_parse_ip_address(char *string, size_t str_len,
>  			colons++;
>  
>  	if (colons >= 2)
> -		return nfs_parse_ipv6_address(string, str_len, sap, addr_len);
> +		nfs_parse_ipv6_address(string, str_len, sap, addr_len);
>  	else
> -		return nfs_parse_ipv4_address(string, str_len, sap, addr_len);
> +		nfs_parse_ipv4_address(string, str_len, sap, addr_len);
>  }
>  
>  /*

/me slaps forehead.  D'oh!

--------------060100090706040400040700
Content-Type: text/x-vcard; charset=utf-8;
 name="chuck_lever.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="chuck_lever.vcf"

begin:vcard
fn:Chuck Lever
n:Lever;Chuck
org:Oracle Corporation;Corporate Architecture: Linux Projects Group
adr:;;1015 Granger Avenue;Ann Arbor;MI;48104;USA
title:Principal Member of Staff
tel;work:+1 248 614 5091
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------060100090706040400040700--
