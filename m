From: Gertjan van Wingerde <gwingerde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] rt2x00: Fix compilation without CONFIG_RT2X00_LIB_CRYPTO
Date: Tue, 2 Aug 2011 11:46:09 +0200
Message-ID: <CAL1gcdNpRfznieegeSCLxeUP_0LRZmnzh91A8d3=+2VM1+S+8Q@mail.gmail.com>
References: <CAGXE3d9ynyJX2eAr2bfwOc_PdDNEwVHDVsA_Jx1ReBht=eVuYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXE3d9ynyJX2eAr2bfwOc_PdDNEwVHDVsA_Jx1ReBht=eVuYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Helmut Schaa <helmut.schaa-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ivo van Doorn <IvDoorn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 2, 2011 at 11:43 AM, Helmut Schaa
<helmut.schaa-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> This was introduced by commit
> 77b5621bac4a56b83b9081f48d4e7d1accdde400 (rt2x00: Don't use queue ent=
ry
> as parameter when creating TX descriptor.)
>
> Signed-off-by: Helmut Schaa <helmut.schaa-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>

OK. You beat me to it.

Acked-by: Gertjan van Wingerde <gwingerde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> Sending directly to John as I assume this should go through the wirel=
ess tree?
>
> =A0drivers/net/wireless/rt2x00/rt2x00lib.h | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/net/wireless/rt2x00/rt2x00lib.h
> b/drivers/net/wireless/rt2x00/rt2x00lib.h
> index 15cdc7e..4cdf247 100644
> --- a/drivers/net/wireless/rt2x00/rt2x00lib.h
> +++ b/drivers/net/wireless/rt2x00/rt2x00lib.h
> @@ -355,7 +355,8 @@ static inline enum cipher
> rt2x00crypto_key_to_cipher(struct ieee80211_key_conf *
> =A0 =A0 =A0 =A0return CIPHER_NONE;
> =A0}
>
> -static inline void rt2x00crypto_create_tx_descriptor(struct queue_en=
try *entry,
> +static inline void rt2x00crypto_create_tx_descriptor(struct
> rt2x00_dev *rt2x00dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct sk_buff *skb,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct txentry_desc *txdesc)
> =A0{
> =A0}
> --
> 1.7.3.4
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wirel=
ess" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
---
Gertjan
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
