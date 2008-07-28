From: James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>
Subject: Re: BUG at security/selinux/avc.c:883 (was: Re: linux-next: Tree
 for July 17: early crash on x86-64)
Date: Tue, 29 Jul 2008 07:38:17 +1000 (EST)
Message-ID: <Xine.LNX.4.64.0807290736440.30242@us.intercode.com.au>
References: <20080718012842.690b8346.sfr@canb.auug.org.au>
 <a4423d670807180652y352e66lfe04d2b33d2ed176@mail.gmail.com>
 <20080719035231.GU28946@ZenIV.linux.org.uk>  <200807192042.06988.rjw@sisk.pl>
  <Xine.LNX.4.64.0807200553380.22632@us.intercode.com.au>
 <1216546973.3217.6.camel@dhcppc2>  <20080720121559.GV28946@ZenIV.linux.org.uk>
 <1217266358.20373.54.camel@moss-spartans.epoch.ncsc.mil>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1217266358.20373.54.camel-/ugcdrsPCSfIm9DtXLC9OUVfdvkotuLY+aIohriVLy8@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
Cc: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>, linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, 28 Jul 2008, Stephen Smalley wrote:

> SELinux needs MAY_APPEND to be passed down to the security hook.
> Otherwise, we get permission denials when only append permission is
> granted by policy even if the opening process specified O_APPEND.
> Shows up as a regression in the ltp selinux testsuite, fixed by
> this patch.
> 
> Signed-off-by:  Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>

Applied to  
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#hotfixes


Al, holler if you want to push this through your tree.


---

 fs/namei.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/namei.c b/fs/namei.c
index a7b0a0b..b91e973 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -274,7 +274,7 @@ int inode_permission(struct inode *inode, int mask)
                return retval;
 
        return security_inode_permission(inode,
-                       mask & (MAY_READ|MAY_WRITE|MAY_EXEC));
+                       mask & (MAY_READ|MAY_WRITE|MAY_EXEC|MAY_APPEND));
 }
 
 /**



- James
-- 
James Morris
<jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>
