From: "Arend van Spriel" <arend@broadcom.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 wireless tree
Date: Wed, 2 Mar 2011 16:39:04 +0100
Message-ID: <op.vrp23ens3ri7v4@arend-laptop>
References: <20110302172754.412dca34.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8;
 format=flowed;
 delsp=yes
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110302172754.412dca34.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Berg <johannes.berg@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Roland Vossen <rvossen@broadcom.com>
List-Id: linux-next.vger.kernel.org

On Wed, 02 Mar 2011 07:27:54 +0100, Stephen Rothwell  
<sfr@canb.auug.org.au> wrote:

> Hi Greg,
>
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/brcm80211/brcmsmac/wl_mac80211.c between commit
> 7bb4568372856688bc070917265bce0b88bb7d4d ("mac80211: make tx() operation
> return void") from the wireless tree (where this file is called
> drivers/staging/brcm80211/sys/wl_mac80211.c) and commits
> 62b54dca17ef40116491b0ca27ca35fbe9daedc6 ("staging: brcm80211: cleanup
> function prototypes in header files") and
> 55182a10063c40eda4dc5afecff712e5c3617ffc ("staging: brcm80211: cosmetic
> changes") from the staging tree.
>
> I fixed it up (see below) and can carry the fix as necessary.

I saw functions being removed. Checked the modified wl_ops_tx on  
git.kernel.org and it looks fine to me.

Thanks,
AvS
-- 
"The most merciful thing in the world, I think, is the inability of the  
human
mind to correlate all its contents." - "The Call of Cthulhu"
