From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: manual merge of the mac80211-next tree with the
 mac80211 tree
Date: Tue, 09 Apr 2019 09:27:35 +0200
Message-ID: <7deebb8e8c82e4455af8fc4963ffc7acca3aab36.camel@sipsolutions.net>
References: <20190409110607.29df3cf3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409110607.29df3cf3@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wireless <linux-wireless@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> Today's linux-next merge of the mac80211-next tree got a conflict in:
> 
>   net/mac80211/tx.c
> 
> between commit:
> 
>   eb9b64e3a9f8 ("mac80211: fix memory accounting with A-MSDU aggregation")
> 
> from the mac80211 tree and commit:
> 
>   dcec1d9bc8a7 ("mac80211: calculate hash for fq without holding fq->lock in itxq enqueue")
> 
> from the mac80211-next tree.

Thanks for the heads-up!

But yes, I'm aware. It seemed simple enough though that I decided to
keep it like that, I didn't really find a better solution.

johannes
