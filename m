From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: linux-next: manual merge of the mac80211-next tree with the
 mac80211 tree
Date: Tue, 16 Jan 2018 08:58:42 +0100
Message-ID: <1516089522.410.41.camel@sipsolutions.net>
References: <20180116111342.721301fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180116111342.721301fc@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Beichler <benjamin.beichler@uni-rostock.de>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> between commit:
> 
>   b71d856ab536 ("mac80211_hwsim: add workqueue to wait for deferred radio deletion on mod unload")
> 
> from the mac80211 tree and commit:
> 
>   c6509cc3b3e8 ("mac80211_hwsim: add hashtable with mac address keys for faster lookup")
> 
> from the mac80211-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Yeah, thanks. I was pondering whether I should knowingly generate that
conflict, but I'll fix it up before merge anyway - might hold the -next
for later anyway.

Thanks!

johannes
