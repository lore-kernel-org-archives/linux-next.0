From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] Fix build failure when CONFIG_NLS is set to 'm' by
 allmodconfig
Date: Tue, 29 Mar 2011 09:23:03 -0700
Message-ID: <20110329092303.43430e15@jbarnes-desktop>
References: <20110223131536.GA16707@fedora14-r610.blr.amer.dell.com>
	<20110223131734.GA6275@srcf.ucam.org>
	<20110304101509.7eef7475@jbarnes-desktop>
	<20110328080220.1390d28e.randy.dunlap@oracle.com>
	<DBFB1B45AF80394ABD1C807E9F28D15702659CFB3D@BLRX7MCDC203.AMER.DELL.COM>
	<4D90EDE8.9070306@oracle.com>
	<87oc4u4rn4.fsf@devron.myhome.or.jp>
	<4D92063C.8040202@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:46103 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751836Ab1C2QXx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Mar 2011 12:23:53 -0400
In-Reply-To: <4D92063C.8040202@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Shyam_Iyer@Dell.com, mjg59@srcf.ucam.org, Narendra_K@Dell.com, viro@zeniv.linux.org.uk, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Matt_Domsch@Dell.com, Charles_Rose@Dell.com, Jordan_Hargrave@Dell.com

On Tue, 29 Mar 2011 09:18:04 -0700
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On 03/28/11 18:55, OGAWA Hirofumi wrote:
> > Randy Dunlap <randy.dunlap@oracle.com> writes:
> > 
> >>> I don't get this.. you should not be getting CONFIG_NLS=m unless you
> >>> have stripped you config files really.. :-) Is it possible to get
> >>> your .config to hit this issue.
> >>
> >> I haven't stripped any config files -- but they are randconfig files.
> >> Two (2) config files that cause build failures are attached.
> > 
> > config PCI_IOAPIC
> > 	bool
> > 	depends on PCI
> > 	depends on ACPI
> > 	depends on HOTPLUG
> > 	default y
> > 
> > select NLS if (DMI || ACPI)
> 
> Ugh.  That looks seriously mucked up.
> Dell people, have you checked what it is linux-next for this pci-label stuff?
> 
> Jesse, I would drop the b0rked pieces and ask for a new patch.

Should be the same as what's in Linus master at this point...  But yes
I'm tempted to revert since it's been nothing but trouble so far.

Narendra, any chance you can get me a fix today?  If not I'll queue up
a revert and you can try again in the next cycle.

-- 
Jesse Barnes, Intel Open Source Technology Center
