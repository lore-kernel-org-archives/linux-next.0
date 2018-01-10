From: Jason Wang <jasowang@redhat.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Wed, 10 Jan 2018 13:53:37 +0800
Message-ID: <d983d019-1416-6c1e-d53c-954aa9b483e0@redhat.com>
References: <20180110150614.3fb5d9f1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:40948 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932335AbeAJFxn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Jan 2018 00:53:43 -0500
In-Reply-To: <20180110150614.3fb5d9f1@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>



On 2018年01月10日 12:06, Stephen Rothwell wrote:
> Hi all,
>
> After merging the net-next tree, today's linux-next build (sparc64
> defconfig) failed like this:
>
> net/socket.o: In function `tun_xdp_to_ptr':
> (.text+0x3180): multiple definition of `tun_xdp_to_ptr'
> fs/compat_ioctl.o:compat_ioctl.c:(.text+0x0): first defined here
> net/socket.o: In function `tun_ptr_to_xdp':
> (.text+0x31a0): multiple definition of `tun_ptr_to_xdp'
> fs/compat_ioctl.o:compat_ioctl.c:(.text+0x20): first defined here
>
> Caused by commit
>
>    fc72d1d54dd9 ("tuntap: XDP transmission")
>
> I applied the following fix for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 10 Jan 2018 15:01:41 +1100
> Subject: [PATCH] tuntap: fix for "tuntap: XDP transmission"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   include/linux/if_tun.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/if_tun.h b/include/linux/if_tun.h
> index 08e66827ad8e..c5b0a75a7812 100644
> --- a/include/linux/if_tun.h
> +++ b/include/linux/if_tun.h
> @@ -42,11 +42,11 @@ static inline bool tun_is_xdp_buff(void *ptr)
>   {
>   	return false;
>   }
> -void *tun_xdp_to_ptr(void *ptr)
> +static inline void *tun_xdp_to_ptr(void *ptr)
>   {
>   	return NULL;
>   }
> -void *tun_ptr_to_xdp(void *ptr)
> +static inline void *tun_ptr_to_xdp(void *ptr)
>   {
>   	return NULL;
>   }

Acked-by: Jason Wang <jasowang@redhat.com>

David, we need this for net-next, need I repost it?

Thanks
