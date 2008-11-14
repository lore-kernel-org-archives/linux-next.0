From: Eric Paris <eparis@redhat.com>
Subject: Re: linux-next: security-testing tree build failure
Date: Fri, 14 Nov 2008 17:42:02 -0500
Message-ID: <1226702522.3353.85.camel@localhost.localdomain>
References: <20081113184624.7e29385f.sfr@canb.auug.org.au>
	 <20081114184313.27dbe432.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:57711 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751129AbYKNWml (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 14 Nov 2008 17:42:41 -0500
In-Reply-To: <20081114184313.27dbe432.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

On Fri, 2008-11-14 at 18:43 +1100, Stephen Rothwell wrote:
> Hi James,
> 
> On Thu, 13 Nov 2008 18:46:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next build (powerpc pseries_defconfig) failed like this:
> > 
> > kernel/built-in.o: In function `.__audit_log_bprm_fcaps':
> > (.text+0x63aec): undefined reference to `.get_vfs_caps_from_disk'
> > kernel/built-in.o: In function `.audit_copy_inode':
> > auditsc.c:(.text+0x64594): undefined reference to `.get_vfs_caps_from_disk'
> > 
> > get_vfs_caps_from_disk() is protected by
> > CONFIG_SECURITY_FILE_CAPABILITIES but the call sites in kernel/auditsc.c
> > are not.
> 
> This error is still there today.  I will have to drop the
> security-testing tree on Monday if this is not fixed.

I am aware.  James didn't like my first fix for CONFIG_AUDIT but not
CONFIG_SECURITY_FILE_CAPABILITIES so I just sent another one which
should address the concern.

-Eric
