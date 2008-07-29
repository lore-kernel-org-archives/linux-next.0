From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: BUG at security/selinux/avc.c:883 (was: Re: linux-next: Tree
	for July 17: early crash on x86-64)
Date: Tue, 29 Jul 2008 01:33:18 +0100
Message-ID: <20080729003318.GE28946@ZenIV.linux.org.uk>
References: <20080718012842.690b8346.sfr@canb.auug.org.au> <a4423d670807180652y352e66lfe04d2b33d2ed176@mail.gmail.com> <20080719035231.GU28946@ZenIV.linux.org.uk> <200807192042.06988.rjw@sisk.pl> <Xine.LNX.4.64.0807200553380.22632@us.intercode.com.au> <1216546973.3217.6.camel@dhcppc2> <20080720121559.GV28946@ZenIV.linux.org.uk> <1217266358.20373.54.camel@moss-spartans.epoch.ncsc.mil> <Xine.LNX.4.64.0807290736440.30242@us.intercode.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <Xine.LNX.4.64.0807290736440.30242-RC8Ws/H8zzudju81dFSl6rpzq4S04n8Q@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Morris <jmorris-gx6/JNMH7DfYtjvyW6yDsg@public.gmane.org>
Cc: Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>, Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>, "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eric Paris <eparis-FjpueFixGhCM4zKIHC2jIg@public.gmane.org>, linux-security-module-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Jul 29, 2008 at 07:38:17AM +1000, James Morris wrote:
> On Mon, 28 Jul 2008, Stephen Smalley wrote:
> 
> > SELinux needs MAY_APPEND to be passed down to the security hook.
> > Otherwise, we get permission denials when only append permission is
> > granted by policy even if the opening process specified O_APPEND.
> > Shows up as a regression in the ltp selinux testsuite, fixed by
> > this patch.
> > 
> > Signed-off-by:  Stephen Smalley <sds-+05T5uksL2qpZYMLLGbcSA@public.gmane.org>
> 
> Applied to  
> git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#hotfixes
> 
> 
> Al, holler if you want to push this through your tree.

Applied, will push along with other patches tonight...
