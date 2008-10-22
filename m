From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for October 21 (staging/prism2-usb)
Date: Tue, 21 Oct 2008 21:47:20 -0700
Message-ID: <20081021214720.a1ff0096.randy.dunlap@oracle.com>
References: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752562AbYJVFEf@vger.kernel.org>
In-Reply-To: <20081021195109.ed83b102.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Tue, 21 Oct 2008 19:51:09 +1100 Stephen Rothwell wrote:

> Hi all,
> 
> Today's tree will not build for powerpc allyesconfig (libc aborts the
> link due to a free() problem), sparc(32) defconfig and probably some
> other configurations.
> 
> I am no longer commenting on conflicts that are clearly just caused by
> slight differences in what has been merged into Linus' tree and
> linux-next or conflicts caused by further changes in the linux-next after
> a subset of a tree has been merged.


ERROR: "wireless_send_event" [drivers/staging/wlan-ng/p80211.ko] undefined!

Looks like that driver should depend on WIRELESS or slt (something like that).

---
~Randy
