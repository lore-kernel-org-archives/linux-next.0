From: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Date: Tue, 17 Jul 2018 07:47:42 +0200
Message-ID: <20180717074742.62101999@epycfail>
References: <20180717123306.3e030fde@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717123306.3e030fde@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Pismenny <borisp@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 17 Jul 2018 12:33:06 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   include/linux/skbuff.h
> 
> between commit:
> 
>   8b7008620b84 ("net: Don't copy pfmemalloc flag in __copy_skb_header()")
> 
> from the net tree and commit:
> 
>   784abe24c903 ("net: Add decrypted field to skb")
> 
> from the net-next tree.
>
> [...]
>
> @@@ -736,7 -737,11 +738,11 @@@ struct sk_buff 
>   				peeked:1,
>   				head_frag:1,
>   				xmit_more:1,
>  +				pfmemalloc:1;
> + #ifdef CONFIG_TLS_DEVICE
>  -				decrypted:1;
>  -#else
>  -				__unused:1;
> ++	__u8			decrypted:1,
> ++				__unused:7;
> + #endif
>   
>   	/* fields enclosed in headers_start/headers_end are copied
>   	 * using a single memcpy() in __copy_skb_header()

I checked the layout of sk_buff after this, we already had a 1-byte
hole there, that now becomes a 7-bits hole (or disappears with
__unused). That's fine.

Boris, I read your commit 784abe24c903 ("net: Add decrypted field to
skb") just now.

I think 'decrypted' shouldn't go there, because you then copy it on
copy and clone: if you move if after headers_start[0] you don't need to
explicitly copy it in __copy_skb_header().

While at it, the copy you added in __skb_clone() is redundant (no
matter the position of 'decrypted').

I can send a clean-up patch against net-next. I guess this might cause
again a linux-next merge conflict, but it's again trivial (the __unused
field above would go away).

-- 
Stefano
