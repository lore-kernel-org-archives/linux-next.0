From: Stanislav Fomichev <kernel@fomichev.me>
Subject: Re: [PATCH -next] staging/brcm80211: fix printk format warnings
Date: Thu, 3 Mar 2011 10:20:30 +0300
Message-ID: <20110303072028.GA21427@sdf-MacBook>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
 <20110301162948.34c28d6e.randy.dunlap@oracle.com>
 <20110302210511.GA20798@kroah.com>
 <20110303103620.6b3c463f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110303103620.6b3c463f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Randy Dunlap <randy.dunlap@oracle.com>, driverdevel <devel@driverdev.osuosl.org>, gregkh@suse.de, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> Maybe due to conflict resolutions in my tree (assuming that Randy based
> his patch in linux-next).
We don't have brcm80211/sys/ directory (it was renamed to
brcm80211/brcmsmac); so it's based on the wrong/outdated tree.

And I suppose these errors are already fixed.
