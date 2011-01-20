From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Tree for January 18 (__modver_version_show)
Date: Wed, 19 Jan 2011 16:38:08 -0800
Message-ID: <20110120003808.GA14292@core.coreip.homeip.net>
References: <20110118122139.6c2a6f2f.sfr@canb.auug.org.au>
 <20110118091749.ac5823df.randy.dunlap@oracle.com>
 <20110119160951.2a14d0a0.sfr@canb.auug.org.au>
 <4D370CE6.3000505@oracle.com>
 <4D370D63.5070503@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4D370D63.5070503@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 19, 2011 at 08:12:19AM -0800, Randy Dunlap wrote:
> On 01/19/11 08:10, Randy Dunlap wrote:
> > On 01/18/11 21:09, Stephen Rothwell wrote:
> >> Hi Randy,
> >>
> >> On Tue, 18 Jan 2011 09:17:49 -0800 Randy Dunlap <randy.dunlap@oracle.com> wrote:
> >>>
> >>> I'm seeing this on several builds (i386 and x86_64):
> >>>
> >>> lib/built-in.o:(__modver+0x8): undefined reference to `__modver_version_show'
> >>> lib/built-in.o:(__modver+0x2c): undefined reference to `__modver_version_show'
> >>>
> >>> It looks like the compiler or linker is dropping that function from the
> >>> build since it cannot see any references to it...
> >>> At least __modver_version_show is not in the kernel/params.o file.
> >>
> >> Do these builds have CONFIG_SYSFS set?
> >>
> > 
> > Yes, they all do (50 random builds have CONFIG_SYSFS=y).
> 
> Gawd, what bad grepping this morning.
> 
> You hit the nail.  They do not have SYSFS enabled.
> 

Argh, this one is my fault, the following should fix it.

-- 
Dmitry


>From 61b92c66e36e460ddcf4e53a950910fbc637c9c5 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dtor@vmware.com>
Date: Wed, 19 Jan 2011 16:33:06 -0800
Subject: [PATCH] Fix MODULE_VERSION() definition when SYSFS is disabled

Signed-off-by: Dmitry Torokhov <dtor@vmware.com>
---
 include/linux/module.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 742ebad..e633951 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -168,7 +168,7 @@ extern struct module __this_module;
   local headers in "srcversion".
 */
 
-#ifdef MODULE
+#if defined(MODULE) || !defined(CONFIG_SYSFS)
 #define MODULE_VERSION(_version) MODULE_INFO(version, _version)
 #else
 #define MODULE_VERSION(_version)					\
-- 
1.7.3.2
