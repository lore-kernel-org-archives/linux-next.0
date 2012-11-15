From: "Arend van Spriel" <arend@broadcom.com>
Subject: Re: linux-next: manual merge of the wireless-next tree with the
 wireless tree
Date: Thu, 15 Nov 2012 09:06:40 +0100
Message-ID: <50A4A290.3070707@broadcom.com>
References: <20121115131707.25e7df1ab635c18e62f0712a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121115131707.25e7df1ab635c18e62f0712a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: linux-next.vger.kernel.org

On 11/15/2012 03:17 AM, Stephen Rothwell wrote:
> Hi John,
>
> Today's linux-next merge of the wireless-next tree got a conflict in
> drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c between commit
> d61f978b8f26 ("brcmfmac: fix typo in CONFIG_BRCMISCAN") from the  tree
> and commit f07998959d57 ("brcmfmac: remove obsolete i-scan and clean up
> related code") from the wireless-next tree.
>
> I used the latter (which removed the line that was fixed in the former)
> and can carry the fix as necessary (no action is required).
>

Agreed. The typo fix is only needed for v3.7.

Gr. AvS
