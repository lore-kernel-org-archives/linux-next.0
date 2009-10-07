From: Dan Williams <dcbw@redhat.com>
Subject: Re: linux-next: Tree for October 7 (libertas build failure)
Date: Wed, 07 Oct 2009 11:12:00 -0700
Message-ID: <1254939120.16001.45.camel@localhost.localdomain>
References: <20091007173517.abfcfa2a.sfr@canb.auug.org.au>
	 <20091007105210.409a1991.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S934345AbZJGSM4@vger.kernel.org>
In-Reply-To: <20091007105210.409a1991.randy.dunlap@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-wireless@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, libertas-dev@lists.infradead.org, Holger Schurig <hs4233@mail.mn-solutions.de>
List-Id: linux-next.vger.kernel.org

On Wed, 2009-10-07 at 10:52 -0700, Randy Dunlap wrote:
> On Wed, 7 Oct 2009 17:35:17 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > Changes since 20091006:
> 
> 
> drivers/built-in.o: In function `lbs_cfg_free':
> (.text+0x3479e0): undefined reference to `wiphy_unregister'
> drivers/built-in.o: In function `lbs_cfg_free':
> (.text+0x3479e7): undefined reference to `wiphy_free'
> drivers/built-in.o: In function `lbs_cfg_register':
> (.text+0x347a52): undefined reference to `wiphy_register'
> drivers/built-in.o: In function `lbs_cfg_alloc':
> (.text+0x347acf): undefined reference to `wiphy_new'

Holger, perhaps we need some Kconfig updates to select cfg80211?

Dan
