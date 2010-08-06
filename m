From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: Tree for August 6 (kgdboc)
Date: Fri, 06 Aug 2010 15:00:57 -0500
Message-ID: <4C5C69F9.5020108@windriver.com>
References: <20100806132758.6001d416.sfr@canb.auug.org.au>
	<20100806115344.52c712b7.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kgdb-bugreport-bounces@lists.sourceforge.net>
In-Reply-To: <20100806115344.52c712b7.randy.dunlap@oracle.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jesse Barnes <jbarnes@virtuousgeek.org>, kgdb-bugreport@lists.sourceforge.net
List-Id: linux-next.vger.kernel.org

On 08/06/2010 01:53 PM, Randy Dunlap wrote:
> On Fri, 6 Aug 2010 13:27:58 +1000 Stephen Rothwell wrote:
> 
>> Hi all,
>>
>> As the merge window is open, please do not add 2.6.37 material to your
>> linux-next included trees until after 2.6.36-rc1.
>>
>> Changes since 20100805:
> 
> 
> ERROR: "con_debug_enter" [drivers/serial/kgdboc.ko] undefined!
> ERROR: "vc_cons" [drivers/serial/kgdboc.ko] undefined!
> ERROR: "fg_console" [drivers/serial/kgdboc.ko] undefined!
> ERROR: "con_debug_leave" [drivers/serial/kgdboc.ko] undefined!
> 
> .config is attached.
> 
> ---
> ~Randy
> *** Remember to use Documentation/SubmitChecklist when testing your code ***


Any possibility you can try this patch?

I'll push it into kgdb-next in just a few min, and I created another test against this.

Thanks,
Jason.


diff --git a/include/linux/console.h b/include/linux/console.h
index f76fc29..305e9c2 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -79,8 +79,13 @@ int register_con_driver(const struct consw *csw, int first, int last);
 int unregister_con_driver(const struct consw *csw);
 int take_over_console(const struct consw *sw, int first, int last, int deflt);
 void give_up_console(const struct consw *sw);
+#ifdef CONFIG_HW_CONSOLE
 int con_debug_enter(struct vc_data *vc);
 int con_debug_leave(void);
+#else
+#define con_debug_enter()
+#define con_debug_leave()
+#endif
 
 /* scroll */
 #define SM_UP       (1)

------------------------------------------------------------------------------
This SF.net email is sponsored by 

Make an app they can't live without
Enter the BlackBerry Developer Challenge
http://p.sf.net/sfu/RIM-dev2dev 
