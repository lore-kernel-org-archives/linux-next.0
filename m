From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for July 13 (usb/serial/option)
Date: Mon, 13 Jul 2009 08:56:26 -0700
Message-ID: <20090713085626.182b73af.randy.dunlap@oracle.com>
References: <20090713180524.72f613dc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756380AbZGMP4X@vger.kernel.org>
In-Reply-To: <20090713180524.72f613dc.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 13 Jul 2009 18:05:24 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20090710:


when CONFIG_PM=n:

drivers/usb/serial/option.c: In function 'option_suspend':
drivers/usb/serial/option.c:1254: error: 'struct usb_device' has no member named 'auto_pm'

---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
