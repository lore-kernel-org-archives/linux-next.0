From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 6 (kgdboc)
Date: Fri, 6 Aug 2010 11:53:44 -0700
Message-ID: <20100806115344.52c712b7.randy.dunlap@oracle.com>
References: <20100806132758.6001d416.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart=_Fri__6_Aug_2010_11_53_44_-0700_h976G_n1VrryK+om"
Return-path: <kgdb-bugreport-bounces@lists.sourceforge.net>
In-Reply-To: <20100806132758.6001d416.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Wessel <jason.wessel@windriver.com>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Fri__6_Aug_2010_11_53_44_-0700_h976G_n1VrryK+om
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Aug 2010 13:27:58 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> As the merge window is open, please do not add 2.6.37 material to your
> linux-next included trees until after 2.6.36-rc1.
> 
> Changes since 20100805:


ERROR: "con_debug_enter" [drivers/serial/kgdboc.ko] undefined!
ERROR: "vc_cons" [drivers/serial/kgdboc.ko] undefined!
ERROR: "fg_console" [drivers/serial/kgdboc.ko] undefined!
ERROR: "con_debug_leave" [drivers/serial/kgdboc.ko] undefined!

.config is attached.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***

--Multipart=_Fri__6_Aug_2010_11_53_44_-0700_h976G_n1VrryK+om
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
This SF.net email is sponsored by 

Make an app they can't live without
Enter the BlackBerry Developer Challenge
http://p.sf.net/sfu/RIM-dev2dev 
--Multipart=_Fri__6_Aug_2010_11_53_44_-0700_h976G_n1VrryK+om
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport

--Multipart=_Fri__6_Aug_2010_11_53_44_-0700_h976G_n1VrryK+om--
