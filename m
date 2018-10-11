From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: manual merge of the crypto tree with the
 mac80211-next tree
Date: Thu, 11 Oct 2018 12:08:57 +0200
Message-ID: <1539252537.3687.209.camel@sipsolutions.net>
References: <20181011111329.253f0689@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011111329.253f0689@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2018-10-11 at 11:13 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the crypto tree got conflicts in:
> 
>   net/wireless/lib80211_crypt_tkip.c
>   net/wireless/lib80211_crypt_wep.c
> 
> between commit:
> 
>   b802a5d6f345 ("lib80211: don't use skcipher")
> 
> from the mac80211-next tree and commit:
> 
>   db20f570e17a ("lib80211: Remove VLA usage of skcipher")
> 
> from the crypto tree.

Thanks Stephen.

The fixup (use mac80211-next file) is fine, but I'm not sure we want to
bother Linus/Greg with it?

Herbert, maybe you can drop the patch from the crypto tree since my
change also removes the VLA usage?

johannes
