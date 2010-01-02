From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: Tree for December 31 (kgdb)
Date: Fri, 01 Jan 2010 23:33:08 -0600
Message-ID: <4B3EDA94.3040005@windriver.com>
References: <20091231112314.a51e160b.sfr@canb.auug.org.au>
	<20091231110747.5efc1efa.randy.dunlap@oracle.com>
	<12c511ca0912311120i3f60fccas3487c1f47b5cf3c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kgdb-bugreport-bounces@lists.sourceforge.net>
In-Reply-To: <12c511ca0912311120i3f60fccas3487c1f47b5cf3c3@mail.gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
To: Tony Luck <tony.luck@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, jbarnes@virtuousgeek.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Tony Luck wrote:
> The kgdb bits break ia64 (and any other architecture without an
> <asm/kgdb.h> too):
>
>   

Certainly this was not intended.   It is properly fixed now in and
folded into a number of the kgdb patches so everything will properly
bisect.  It is updated in kgdb-next.

Thanks,
Jason.

------------------------------------------------------------------------------
This SF.Net email is sponsored by the Verizon Developer Community
Take advantage of Verizon's best-in-class app development support
A streamlined, 14 day to market process makes app distribution fast and easy
Join now and get one step closer to millions of Verizon customers
http://p.sf.net/sfu/verizon-dev2dev 
