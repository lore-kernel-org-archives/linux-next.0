From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 2 (usb/whci)
Date: Wed, 11 Nov 2009 09:04:03 -0800
Message-ID: <20091111090403.5fb0229e.randy.dunlap@oracle.com>
References: <20091102173845.210d1c57.sfr@canb.auug.org.au>
	<20091102091339.479a3ddb.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757843AbZKKREU@vger.kernel.org>
In-Reply-To: <20091102091339.479a3ddb.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lud <linux-usb@vger.kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 2 Nov 2009 09:13:39 -0800 Randy Dunlap wrote:

> On Mon, 2 Nov 2009 17:38:45 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091030: <<<<<<<<<<<<<<<<<<<<<<<<<<
> 
> 
> whci build fails on i386 due to 64-bit multiply & divide:
> 
> ERROR: "__udivdi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!
> ERROR: "__umoddi3" [drivers/usb/host/whci/whci-hcd.ko] undefined!


Still present in linux-next-20091111.

---
~Randy
