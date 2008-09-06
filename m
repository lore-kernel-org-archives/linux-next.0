From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for September 4 (PATCH: IXGBE)
Date: Fri, 5 Sep 2008 22:36:34 -0700
Message-ID: <20080905223634.7a05a2f5.randy.dunlap@oracle.com>
References: <20080904193606.573f2cb3.sfr@canb.auug.org.au>
	<20080904204137.9b31f644.randy.dunlap@oracle.com>
	<36D9DB17C6DE9E40B059440DB8D95F5206120576@orsmsx418.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <e1000-devel-bounces@lists.sourceforge.net>
In-Reply-To: <36D9DB17C6DE9E40B059440DB8D95F5206120576@orsmsx418.amr.corp.intel.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/e1000-devel>,
	<mailto:e1000-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=e1000-devel>
List-Post: <mailto:e1000-devel@lists.sourceforge.net>
List-Help: <mailto:e1000-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/e1000-devel>,
	<mailto:e1000-devel-request@lists.sourceforge.net?subject=subscribe>
Sender: e1000-devel-bounces@lists.sourceforge.net
Errors-To: e1000-devel-bounces@lists.sourceforge.net
To: "Brandeburg, Jesse" <jesse.brandeburg@intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew@sc8-sf-spam2-b.sourceforge.net, e1000-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, Morton <akpm@linux-foundation.org>, jgarzik <jgarzik@pobox.com>
List-Id: linux-next.vger.kernel.org

On Fri, 5 Sep 2008 16:47:55 -0700 Brandeburg, Jesse wrote:

> Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> > 
> > ixgbe needs to be restricted to the same build config (m/y)
> > as DCA since it calls the dca_*() functions.
> > 
> > ixgbe_main.c:(.text+0xd9c09): undefined reference to `dca3_get_tag'
> > ixgbe_main.c:(.text+0xd9cc9): undefined reference to `dca3_get_tag'
> > ixgbe_main.c:(.text+0xda5c1): undefined reference to
> > `dca_add_requester' ixgbe_main.c:(.text+0xda5d6): undefined reference
> > to `dca_remove_requester' text+0xdc162): undefined reference to
> > `dca_add_requester' 
> > text+0xdc1d3): undefined reference to `dca_remove_requester'
> > ixgbe_main.c:(.init.text+0xa74b): undefined reference to
> > `dca_register_notify' ixgbe_main.c:(.devinit.text+0xa4ca): undefined
> > reference to `dca_add_requester' ixgbe_main.c:(.exit.text+0xd21):
> > undefined reference to `dca_unregister_notify'
> > ixgbe_main.c:(.devexit.text+0x72d): undefined reference to
> > `dca_remove_requester' make[1]: *** [.tmp_vmlinux1] Error 1 
> > 
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ...
> > +	depends on PCI && INET && DCA
> 
> Looks like you set IXGBE=y and CONFIG_DCA=m.  This depends DCA option is
> not so great because if INTEL_IOATDMA is disabled (and therefore DCA is
> disabled) then ixgbe won't show up as an option.
> 
> How about this instead, use a select INTEL_IOATDMA:
> 
> inline is whitespace busted, sorry. attached is the patch.

OK, that works.  Thanks.

---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/

-------------------------------------------------------------------------
This SF.Net email is sponsored by the Moblin Your Move Developer's challenge
Build the coolest Linux based applications with Moblin SDK & win great prizes
Grand prize is a trip for two to an Open Source event anywhere in the world
http://moblin-contest.org/redirect.php?banner_id=100&url=/
