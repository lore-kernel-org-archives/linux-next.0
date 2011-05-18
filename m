From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the wireless
 tree
Date: Tue, 17 May 2011 22:09:13 -0700
Message-ID: <20110518050913.GA25333@kroah.com>
References: <20110518125633.0164cb32.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110518125633.0164cb32.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jouni Malinen <jouni.malinen@atheros.com>, Sukesh Srikakula <sukeshs@broadcom.com>, Arend van Spriel <arend@broadcom.com>
List-Id: linux-next.vger.kernel.org

On Wed, May 18, 2011 at 12:56:33PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c between commit
> 5a083c0aba95 ("cfg80211: Use consistent BSS matching between scan and
> sme") from the wireless tree and commit e494632efcd9 ("staging:
> brcm80211: Fixed bss (re)connect/disconnect issues in brcmfmac driver")
> from the staging tree.
> 
> I fixed it up (see below) anc can carry the fix as necessary.

Looks great to me, thanks for doing this.

greg k-h
