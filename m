From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: suspend tree build failure
Date: Wed, 7 Oct 2009 22:41:54 +0200
Message-ID: <200910072241.54869.rjw@sisk.pl>
References: <20091006135505.f07ee40d.sfr@canb.auug.org.au> <200910070031.55135.rjw@sisk.pl> <20091007152914.8dadf6d7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757750AbZJGUlO@vger.kernel.org>
In-Reply-To: <20091007152914.8dadf6d7.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Hemminger <shemminger@vyatta.com>
List-Id: linux-next.vger.kernel.org

On Wednesday 07 October 2009, Stephen Rothwell wrote:
> Hi Rafael,
> 
> On Wed, 7 Oct 2009 00:31:55 +0200 "Rafael J. Wysocki" <rjw@sisk.pl> wrote:
> >
> > Thanks for the notification.
> > 
> > Did you cross-compile it by chance?  It builds for me on native x86_64 with
> > allmodconfig, which is why I missed this issue.
> 
> I cross compile all my x86 builds as my big machines are all PowerPC.
> 
> > > I have used the version of the suspend tree from next-20091002 for today.
> > 
> > I added the #include <linux/compiler.h> to freezer.h, but obviously I couldn't
> > verify if that fixed the problem.  Hopefully it did.
> 
> My guess was wrong.  You either need to leave the __cold off the
> definition in kernel/freezer.c or move it before the function name.  No
> other function definition in the kernel is marked __cold, but several
> declarations are.
> 
> Also __cold only generates something for gcc >= 4.3 ...  I am using 4.4.

OK, I've dropped the patch altogether for now, will add it later.

Just pushed the updated tree.

Thanks,
Rafael
